//
//  UserService.swift
//  Bidit
//
//  Created by pokers on 2022/09/21.
//

import Foundation
import RxSwift

enum ServiceError:Error{
    case success
    case fail
}

protocol UserService {
    func getMe() -> Single<MeQuery.Data.Me>
    func addUser() -> Single<AddUserMutation.Data.AddUser>
}

final class UserServiceImpl:UserService {
    fileprivate let userRepo:UserRepository
    
    // MARK: Constructor
    init(userRepo:UserRepository){
        self.userRepo = userRepo
    }
    
    // MARK: Private Methods
    
    // MARK: Public Methods - none Rx
    
    // MARK: Public Methods - Rx
    
    func getMe() -> Single<MeQuery.Data.Me> {
        return self.userRepo.getMe()
    }
    
    func addUser() -> Single<AddUserMutation.Data.AddUser> {
        return self.userRepo.addUser()
    }
}
