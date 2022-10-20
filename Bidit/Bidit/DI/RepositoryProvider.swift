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
    static var itemRepo:ItemRepository? = nil
    
    static func getUserRepository() -> UserRepository {
        if self.userRepo == nil {
            self.userRepo = UserRepositoryImpl(apollo: Network.shared.apollo)
        }
        return self.userRepo!
    }
    
    static func getItemRepository() -> ItemRepository{
        if self.itemRepo == nil {
            self.itemRepo = ItemRepositoryImpl(apollo: Network.shared.apollo)
        }
        return self.itemRepo!
    }
}
