//
//  CompositionRoot.swift
//  Bidit
//
//  Created by pokers on 2022/09/19.
//

import Foundation

final class ServiceProvider {
    // singleton services
    static var sendbirdService:SendbirdService? = nil
    static var kakaoService:AuthService? = nil
    static var appleService:AuthService? = nil
    static var userService:UserService? = nil
    
    static func getSendbirdService() -> SendbirdService {
        if self.sendbirdService == nil {
            self.sendbirdService = SendbirdServiceImpl(appId: PrivateKey().SENDBIRD_APP_ID)
        }
        return self.sendbirdService!
    }
    
    static func getKakaoAuthService() -> AuthService {
        if self.kakaoService == nil {
            self.kakaoService = KakaoAuthServiceImpl(appKey: PrivateKey().KAKAO_APP_KEY)
        }
        return self.kakaoService!
    }
    
    static func getAppleAuthService() -> AuthService {
        if self.appleService == nil {
            self.appleService = AppleAuthServiceImpl()
        }
        return self.appleService!
    }
    
    static func getUserService() -> UserService {
        if self.userService == nil {
            self.userService = UserServiceImpl(userRepo: RepositoryProvider.getUserRepository())
        }
        return self.userService!
    }
}
