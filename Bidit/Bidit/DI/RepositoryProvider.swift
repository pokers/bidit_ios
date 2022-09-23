//
//  RepositoryProvider.swift
//  Bidit
//
//  Created by pokers on 2022/09/21.
//

import Foundation

import Foundation

final class RepositoryProvider {
    // singleton repositories
    static var userRepo:UserRepository? = nil
    
    static func getUserRepository() -> UserRepository {
        if self.userRepo == nil {
            self.userRepo = UserRepositoryImpl(apollo: Network.shared.apollo)
        }
        return self.userRepo!
    }
}
