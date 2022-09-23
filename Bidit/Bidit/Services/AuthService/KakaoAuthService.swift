//
//  KakaoAuthService.swift
//  Bidit
//
//  Created by pokers on 2022/09/20.
//

import Foundation
import ReactorKit
import RxSwift

import KakaoSDKAuth
import KakaoSDKCommon
import KakaoSDKUser

final class KakaoAuthServiceImpl: AuthService {
    fileprivate var appKey:String? = nil
    fileprivate var accessToken:String? = nil {
        willSet {
            // TODO: It should be moved to Token Manager
            UserDefaults.standard.set("kakao", forKey: "LoginState")
        }
    }
    weak var viewController: UIViewController?  // For Kakao, it's not necessary
    
    // MARK: Constructor
    init(appKey:String){
        self.appKey = appKey
    }
    
    // MARK: private Methods
    private func getCurrentToken() {
        if let oauthToken = KakaoSDKAuth.TokenManager.manager.getToken() {
            self.accessToken = oauthToken.accessToken
        }
    }
    
    private func hasToken() -> Single<AuthState> {
        return Single.create { [weak self] observer in
            if AuthApi.hasToken() {
                UserApi.shared.accessTokenInfo { (accessToken, error) in
                    if let error = error {
                        log.error("Failed to kakaoAuth : Expired accessToken [\(error)]")
                        observer(.success(AuthState.unauthenticated))
                        return
                    }

                    self?.getCurrentToken()
                    observer(.success(AuthState.authenticated))
                }
            }else{
                observer(.success(AuthState.unauthenticated))
            }

            return Disposables.create()
        }
    }
    
    private func isAvailableApp() -> Bool {
        return UserApi.isKakaoTalkLoginAvailable()
    }
    
    private func loginWithApp() -> Single<AuthError> {
        return Single.create { [weak self] observer in
            UserApi.shared.loginWithKakaoTalk { oauthToken, error in
                if let error = error {
                    log.error("Failed to kakaoAuth : \(error)")
                    observer(.failure(AuthError.fail))
                    return
                }
                
                guard let accessToken = oauthToken?.accessToken else {
                    log.error("Failed to kakaoAuth : Invalid AccessToken")
                    observer(.failure(AuthError.fail))
                    return
                }
                
                self?.accessToken = accessToken
                observer(.success(AuthError.success))
            }
            return Disposables.create()
        }
    }
    
    private func loginWithoutApp() -> Single<AuthError> {
        return Single.create { [weak self] observer in
            UserApi.shared.loginWithKakaoAccount { oauthToken, error  in
                if let error = error {
                    log.error("Failed to kakaoAuth : \(error)")
                    observer(.failure(AuthError.fail))
                    return
                }
                
                guard let accessToken = oauthToken?.accessToken else {
                    log.error("Failed to kakaoAuth : Invalid AccessToken")
                    observer(.failure(AuthError.fail))
                    return
                }
                
                self?.accessToken = accessToken
                observer(.success(AuthError.success))
            }
            return Disposables.create()
        }
    }
    
    
    // MARK: Public Methods (Not Rx)
    func initialize() {
        guard self.appKey != nil else {
            log.error("Failed to initialize kakaoSDK")
            return
        }
        KakaoSDK.initSDK(appKey: self.appKey!)
    }
    
    func setViewController(viewController: UIViewController?){
        self.viewController = viewController
    }
    
    func handleRedirectURL(redirectURL:URL) -> Bool {
        if AuthApi.isKakaoTalkLoginUrl(redirectURL) == false {
            log.error("Failed to handleRedirectURL : Is not redirectURL")
            return false
        }
        
        return AuthController.handleOpenUrl(url: redirectURL)
    }
    
    func getAccessToken() -> String {
        if let accessToken = self.accessToken {
            return accessToken
        }
        return ""
    }
    
    // MARK: Public Rx Methods
    func isInstalled() -> Single<Bool> {
        return Single.create { [weak self] observer in
            let result:Bool = (self?.isAvailableApp())!
            observer(.success(result))
            return Disposables.create()
        }
    }
    
    func isAuthenticated() -> Single<AuthState> {
        return self.hasToken()
    }
    
    func authenticate() -> Single<AuthError> {
        if self.isAvailableApp() {
            return self.loginWithApp()
        }
        return self.loginWithoutApp()
    }
}
