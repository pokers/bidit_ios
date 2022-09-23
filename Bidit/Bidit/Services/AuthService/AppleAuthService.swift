//
//  AppleAuthService.swift
//  Bidit
//
//  Created by pokers on 2022/09/23.
//

import Foundation
//
//  KakaoAuthService.swift
//  Bidit
//
//  Created by pokers on 2022/09/20.
//

import Foundation
import ReactorKit
import RxSwift

import AuthenticationServices

final class AppleAuthServiceImpl: AuthService {
    fileprivate var appKey:String? = nil
    fileprivate var accessToken:String? = nil {
        willSet {
            // TODO: It should be moved to Token Manager
            UserDefaults.standard.set("apple", forKey: "LoginState")
        }
    }
    
    weak var viewController: UIViewController?
    fileprivate let authStateSubject = PublishSubject<AuthState>()
    lazy var curAuthState:Observable<AuthState> = self.authStateSubject.asObservable().share()
    fileprivate var disposeBag = DisposeBag()
    
    // MARK: Apple User Information
    var userEmail:String?
    var userNickName:String?
    
    
    // MARK: Constructor
    init(){
        self.appKey = ""
    }
    init(appKey:String){
        self.appKey = appKey
    }
    
    // MARK: private Methods
    private func getCurrentToken() {
        
    }
    
    private func hasToken() -> Single<AuthState> {
        return Single.create { observer in
            observer(.success(AuthState.authenticated))
            return Disposables.create()
        }
    }
    
    private func isAvailableApp() -> Bool {
        return true
    }
    
    
    // MARK: Public Methods (Not Rx)
    func initialize() {
        guard self.appKey != nil else {
            log.error("Failed to initialize appleAuthService")
            return
        }
    }
    
    func setViewController(viewController: UIViewController?){
        self.viewController = viewController
    }
    
    func handleRedirectURL(redirectURL:URL) -> Bool {
        return true
    }
    
    func getAccessToken() -> String {
        if let accessToken = self.accessToken {
            return accessToken
        }
        return ""
    }
    
    // MARK: Public Rx Methods
    func isInstalled() -> Single<Bool> {
        return Single.create { observer in
            observer(.success(true))
            return Disposables.create()
        }
    }
    
    func isAuthenticated() -> Single<AuthState> {
        let requests = [ ASAuthorizationAppleIDProvider().createRequest()]
        let authorizationController = ASAuthorizationController(authorizationRequests: requests)
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
        
        return Single.create { observer in
            self.curAuthState
                .subscribe(
                    onNext: { result in
                        log.info("result : \(result)")
                        observer(.success(result))
                    },
                    onError: {error in
                        log.error("error : \(error)")
                        observer(.failure(AuthError.fail))
                    })
                .disposed(by: self.disposeBag)

            return Disposables.create()
        }
    }
    
    func authenticate() -> Single<AuthError> {
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]

        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.presentationContextProvider = self
        controller.performRequests()
        
        return Single.create { observer in
            self.curAuthState
                .subscribe(
                    onNext: { result in
                        log.info("result : \(result)")
                        switch result {
                        case .authenticated:
                            observer(.success(AuthError.success))
                        case .unauthenticated:
                            observer(.success(AuthError.fail))
                        }
                    },
                    onError: {error in
                        log.error("error : \(error)")
                        observer(.success(AuthError.fail))
                    })
                .disposed(by: self.disposeBag)

            return Disposables.create()
        }
    }
}


extension AppleAuthServiceImpl: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return viewController!.view.window!
    }
}

extension AppleAuthServiceImpl: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let credential = authorization.credential as? ASAuthorizationAppleIDCredential {
            let idToken = credential.identityToken!
            self.userNickName = credential.fullName?.nickname ?? ""
            self.userEmail = credential.email ?? ""
            self.accessToken = String(data: idToken, encoding: .ascii) ?? ""
            
            log.info("accessToken : \(String(describing: self.accessToken))")
            log.info("userNickName [\(String(describing: self.userNickName))], Email [\(String(describing: self.userEmail))]")
            
            self.authStateSubject.onNext(AuthState.authenticated)
        }
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        log.error("Failed to login... : \(error)")
        self.authStateSubject.onError(AuthError.fail)
    }
    
    // dummy
    func isEqual(_ object: Any?) -> Bool {
        return true
    }
    
    var hash: Int {
        return 0
    }
    
    var superclass: AnyClass? {
        return nil
    }
    
    func `self`() -> Self {
        return self
    }
    
    func perform(_ aSelector: Selector!) -> Unmanaged<AnyObject>! {
        return nil
    }
    
    func perform(_ aSelector: Selector!, with object: Any!) -> Unmanaged<AnyObject>! {
        return nil
    }
    
    func perform(_ aSelector: Selector!, with object1: Any!, with object2: Any!) -> Unmanaged<AnyObject>! {
        return nil
    }
    
    func isProxy() -> Bool {
        return false
    }
    
    func isKind(of aClass: AnyClass) -> Bool {
        return true
    }
    
    func isMember(of aClass: AnyClass) -> Bool {
        return true
    }
    
    func conforms(to aProtocol: Protocol) -> Bool {
        return true
    }
    
    func responds(to aSelector: Selector!) -> Bool {
        return true
    }
    
    var description: String {
        return "dummy class"
    }
    
}
