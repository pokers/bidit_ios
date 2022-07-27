//
//  ProfileChangeReactor.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/11.
//

import Foundation
import ReactorKit

class ProfileChangeReactor : Reactor{
    enum Action {
        
        case viewDidLoad
        case updateProfile(String)
    }
    
    enum Mutation {
        case loadMyInfo(User)
        case modifyProfile(String)
    }
    
    struct State {
        var user : User? = nil
        var successUpdate = false
    }
    
    let initialState: State
    
    init(user : User) {
        self.initialState = .init(user: user)
    }
}

extension ProfileChangeReactor{
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .viewDidLoad :

            return Observable<Mutation>.just(.loadMyInfo(initialState.user!))
        case .updateProfile(let nickName):
            return requestProfileUpdate(nickName: nickName)

        }
    }
//
    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        switch mutation {
        case .loadMyInfo(let user) :
            state.user = user
            break
            
        case.modifyProfile(let nickName):
            state.user?.nickname = nickName
            state.successUpdate = true
            break

        }
        return state
    }
    
    func requestProfileUpdate(nickName : String) -> Observable<Mutation>{
        return Observable<Mutation>.create(){ emitter in
            LoadingIndicator.showLoading()
            Network.shared.apollo.perform(mutation: UpdateNickNameMutation(userUpdate: .init(status: nil,
                                                                                             nickname: nickName,
                                                                                             gender: nil,
                                                                                             birth: nil,
                                                                                             deletedAt: nil,
                                                                                             description: nil))){result in
                switch result {
                case .success(let data) :
                    print("success \(data)")
                    do {
                        print("modify result is :  \(data)")
//
                        
                        LoadingIndicator.hideLoading()
                        //상품이 정상적으로 등록되었습니다. 메시지
                        
                        emitter.onNext(.modifyProfile(nickName))
                        emitter.onCompleted()
                       
                    }catch (let error) {
                        print("upload fail")
                        print(error.localizedDescription)
                    }
                    break
                case .failure(let error) :
                    print("error : \(error)")
                    //self.passed = false
                }
                
            }
                                          
            return Disposables.create()
        }
    

    }
}
