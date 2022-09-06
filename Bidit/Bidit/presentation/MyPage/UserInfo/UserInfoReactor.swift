//
//  UserInfoReactor.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/10.
//

import Foundation
import ReactorKit

class UserInfoReactor : Reactor {
    enum Action {
        
        case viewDidLoad
    }
    
    enum Mutation {
        case loadMyInfo(User)
    }
    
    struct State {
        var user : User? = nil
    }
    
    let initialState: State
    
    init(user : User) {
        self.initialState = .init(user: user)
    }
}

extension UserInfoReactor{
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .viewDidLoad :

            return Observable<Mutation>.just(.loadMyInfo(initialState.user!))

        }
    }
//
    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        switch mutation {
        case .loadMyInfo(let user) :
            state.user = user

        }
        return state
    }
}
