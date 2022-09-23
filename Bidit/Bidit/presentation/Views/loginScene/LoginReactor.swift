//
//  LoginReactor.swift
//  Bidit
//


import Foundation
import ReactorKit
//import RxSwift
import Apollo
//import KeychainSwift

import KakaoSDKUser
import KakaoSDKAuth
import KakaoSDKCommon

class LoginReactor : Reactor {
    // MARK: Declare Action, Mutation, Stat
    enum Action {
        case tapKakaoAuth
        case tapAppleAuth
        case isKakaoAuth
        case isAppleAuth
        case getMe
        case addUser
    }
    
    enum Mutation {
        case authType(AuthType)
        case authState(AuthState)
        case loginState(LoginState)
    }
    
    struct State {
        var authType:AuthType
        var authState:AuthState
        var loginState:LoginState
    }
    
    // MARK: Services
    let sendbirdService: SendbirdService
    let kakaoAuthService: AuthService
    let appleAuthService: AuthService
    let userService: UserService

    let initialState: State
    weak var viewController: UIViewController?
    
    init(){
        self.initialState = State(
            authType: AuthType.none,
            authState: AuthState.unauthenticated,
            loginState: LoginState.logout
        )
        
        // TODO: The service provider also should be injected by parent class.
        self.sendbirdService = ServiceProvider.getSendbirdService()
        self.kakaoAuthService = ServiceProvider.getKakaoAuthService()
        self.appleAuthService = ServiceProvider.getAppleAuthService()
        self.userService = ServiceProvider.getUserService()
    }
    
    // TODO: It should be moved to TokenService
    private func setAccessToken(accessToken:String, authType:AuthType) -> Bool {
        if accessToken == "" {
            return false
        }
        log.info("AccessToken[\(accessToken)], Type[\(authType)]")
        TokenManager.sharedKeyChain.set(accessToken, forKey: authType.rawValue)
        return true
    }
    
    // TODO: It should be removed. Do not use USerDefaults when it need to get userName, UserId etc
    private func setUserInfo(me:MeQuery.Data.Me) {
        UserDefaults.standard.set(me.id, forKey: "userId")
        UserDefaults.standard.set(me.nickname ?? me.email ?? "닉네임 없음", forKey: "userName")
    }
    
    // MARK: RX - mutate
    func setViewController(viewController: UIViewController){
        self.viewController = viewController
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        log.info("mutate : \(action)")
        
        switch action {
        case .addUser:
            return self.userService.addUser()
                .do(
                    onSuccess: { result in log.info("addUser : \(result)")},
                    onError: { error in log.info("Error - addUser : \(error)")}
                )
                .asObservable()
                .map { _ in LoginState.login }
                .observe(on: MainScheduler.instance)
                .catchAndReturn(LoginState.logout)
                .map(Mutation.loginState)
            
        case .getMe:
            return self.userService.getMe()
                .do(
                    onSuccess: { result in log.info("getMe : \(result)")},
                    onError: { error in log.info("Error - getMe : \(error)")}
                )
                .asObservable()
                .observe(on: MainScheduler.instance)
                .flatMap {
                    log.info("flatMap : \($0)")
                    let userId:Int = $0.id
                    if userId >= 0 {
                        self.setUserInfo(me:$0)
                        return Single<LoginState>.just(LoginState.login)
                    }
                    return Single<LoginState>.just(LoginState.logout)
                }
                .catch { error in
                    log.error("Catch error : \(error)")
                    if let userRepoErr = error as? UserRepoError, userRepoErr == UserRepoError.unregistereduser {
                        return .just(LoginState.unregistered)
                    }
                    return .just(LoginState.logout)
                }
                .map(Mutation.loginState)
            
        case .tapKakaoAuth:
            return self.kakaoAuthService.authenticate()
                .do(
                    onSuccess: { result in log.info("kakaologin : \(result)")},
                    onError: { error in log.info("Error - kakaologin : \(error)") }
                )
                .asObservable()
                .observe(on: MainScheduler.instance)
                .flatMap {
                    if $0 == AuthError.success
                        && self.setAccessToken(accessToken: self.kakaoAuthService.getAccessToken(), authType: AuthType.kakao) {
                        return Single<AuthState>.just(AuthState.authenticated)
                    }
                    return Single<AuthState>.just(AuthState.unauthenticated)
                }
                .asObservable()
                .catchAndReturn(AuthState.unauthenticated)
                .map(Mutation.authState)
                .startWith(.authType(AuthType.kakao))

        case .tapAppleAuth:
            self.appleAuthService.setViewController(viewController: self.viewController)
            return self.appleAuthService.authenticate()
                .asObservable()
                .observe(on: MainScheduler.instance)
                .flatMap {
                    log.info("auth result : \($0)")
                    if $0 == AuthError.success
                        && self.setAccessToken(accessToken: self.appleAuthService.getAccessToken(), authType: AuthType.apple) {
                        return Single<AuthState>.just(AuthState.authenticated)
                    }
                    return Single<AuthState>.just(AuthState.unauthenticated)
                }
                .asObservable()
                .catchAndReturn(AuthState.unauthenticated)
                .map(Mutation.authState)
                .startWith(.authType(AuthType.apple))
            
        case .isAppleAuth:
            return self.appleAuthService.isAuthenticated()
                .asObservable()
                .observe(on: MainScheduler.instance)
                .map(Mutation.authState)
                .startWith(.authType(AuthType.apple))
            
        case .isKakaoAuth:
            return self.kakaoAuthService.isInstalled()
                .do(onSuccess: { result in log.info("isKakaoInstalled : \(result)")},
                    onError: { error in log.info("Error - isKakaoInstalled : \(error)") }
                )
                .asObservable()
                .observe(on: MainScheduler.instance)
                .flatMap {
                    if $0 {
                        return self.kakaoAuthService.isAuthenticated()
                    }
                    return Single<AuthState>.just(AuthState.unauthenticated)
                }
                .map {
                    if $0 == AuthState.authenticated {
                        if !self.setAccessToken(accessToken: self.kakaoAuthService.getAccessToken(), authType: AuthType.kakao) {
                            return AuthState.unauthenticated
                        }
                    }
                    return $0
                }
                .asObservable()
                .catchAndReturn(AuthState.unauthenticated)
                .map(Mutation.authState)
                .startWith(.authType(AuthType.kakao))
        }
    }
        
    // MARK: RX - reduce
    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        log.info("reduce : \(mutation) -> \(state)")
        switch mutation {            
        case let .authType(authType):
            state.authType = authType;

        case let .authState(authState):
            state.authState = authState
            
        case let .loginState(loginState):
            state.loginState = loginState
        }
        return state
    }
}
