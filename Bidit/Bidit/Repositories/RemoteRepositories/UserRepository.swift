//
//  UserRepository.swift
//  Bidit
//
//  Created by pokers on 2022/09/21.
//

import Foundation
import Apollo
import RxSwift

enum RepositoryError:Error{
    case success
    case fail
}

enum UserRepoError:Error {
    case unregistereduser
}

protocol UserRepository {
    func getMe() -> Single<MeQuery.Data.Me>
    func addUser() -> Single<AddUserMutation.Data.AddUser>
}

final class UserRepositoryImpl:UserRepository {
    // TODO: apollo type should be changed generic
    fileprivate var apollo: ApolloClient? = nil
    
    // MARK: Constructor
    init(apollo:ApolloClient){
        self.apollo = apollo
    }
    
    // MARK: Private Methods
    
    // MARK: Public Methods - none Rx
    
    // MARK: Public Methods - Rx
    
    func getMe() -> Single<MeQuery.Data.Me> {
        return Single.create { [weak self] observer in
            if let apollo = self?.apollo {
                apollo.fetch(query: MeQuery()) { result in
                    switch result {
                    case .success(let response):
                        if let me = response.data?.me {
                            observer(.success(me))
                            return
                        }
                        observer(.failure(UserRepoError.unregistereduser))
                    case.failure(let error):
                        log.error("Error : \(String(describing:error))")
                        observer(.failure(error))
                    }
                }
            }else{
                observer(.failure(RepositoryError.fail))
            }
                        
            return Disposables.create()
        }
    }
    
    func addUser() -> Single<AddUserMutation.Data.AddUser> {
        return Single.create { [weak self] observer in
            if let apollo = self?.apollo {
                apollo.perform(mutation: AddUserMutation()) { result in
                    switch result {
                    case .success(let response):
                        if let addUser = response.data?.addUser {
                            observer(.success(addUser))
                            return
                        }
                        observer(.failure(UserRepoError.unregistereduser))
                    case.failure(let error):
                        log.error("Error : \(String(describing:error))")
                        observer(.failure(error))
                    }
                }
            }else{
                observer(.failure(RepositoryError.fail))
            }

            return Disposables.create()
        }
    }
}
