//
//  AuthService.swift
//  Bidit
//
//  Created by pokers on 2022/09/20.
//

import Foundation
import ReactorKit
import RxSwift

protocol AuthService {
    func initialize()
    func setViewController(viewController: UIViewController?)
    func handleRedirectURL(redirectURL:URL) -> Bool
    func getAccessToken() -> String
    
    func isInstalled() -> Single<Bool>
    func isAuthenticated() -> Single<AuthState>
    func authenticate() -> Single<AuthError>
}


enum AuthError:Error {
    case success
    case fail
}

enum AuthType: String {
    case none = "none"
    case kakao = "kakao"
    case naver = "naver"
    case apple = "apple"
}

enum AuthState {
    case unauthenticated
    case authenticated
}

enum LoginState {
    case logout
    case login
    case unregistered
}
