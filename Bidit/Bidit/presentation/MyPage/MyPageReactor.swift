//
//  MyPageReactor.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/10.
//

import Foundation
import ReactorKit

class MyPageReactor : Reactor{
    
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
    
    init() {
        self.initialState = State()
    }
    
}

extension MyPageReactor {
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .viewDidLoad :
            
            return requestMyInfo()
        
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        switch mutation {
        case let .loadMyInfo(user) :
            state.user = user
            
        }
        return state
    }
    
    //내정보 불러오기.
    func requestMyInfo() -> Observable<Mutation>{
        
        
        return Observable<Mutation>.create(){ emitter in
            
            Network.shared.apollo.fetch(query: MyPageMeQuery()){ result in
                switch result {
                    
                    
                    
                    
                case .success(let data) :
                    print("success \(data)")
                    do {
                        
                        var datas = data.data!.me!
                        var id : Int = datas.id
                        var status : Int = datas.status
                        var nickname : String? = datas.nickname
                        
                        var kakao = datas.kakaoAccount
                        
                        var kakaoAccount : KakaoAccount? = KakaoAccount(id: Double(kakao!.id),
                                                        status: kakao!.status,
                                                        userId: kakao!.userId,
                                                        createdAt: kakao?.createdAt,
                                                        updatedAt: kakao?.updatedAt,
                                                        name: kakao?.name,
                                                        email: kakao?.email,
                                                        phoneNumber: kakao?.phoneNumber,
                                                        nickname: kakao?.nickname,
                                                        thumbnail_image_url: kakao?.thumbnailImageUrl,
                                                        profile_image_url: kakao?.profileImageUrl,
                                                        is_default_image: kakao?.isDefaultImage)
                       
                        var appleAccount = datas.appleAccount
                        
                        var user = User(id: id, status: status, nickname: nickname, kakaoAccount: kakaoAccount, appleAccount: nil)
                        
                        
                        
//                        let decoder = JSONDecoder()
//                        let data = try JSONSerialization.data(withJSONObject: data.data!.me!.jsonObject, options: [])//jsonObject
//                        print("JSONSerialization")
//                        print(data)
//                        let decode : User = try decoder.decode(User.self, from: data) //문제
//                        print("myProfile is \(decode)")
                      print(user)
                        
                        
//                        
//                        //return 대신
                        emitter.onNext(.loadMyInfo(user))
                        emitter.onCompleted()
//                        
                    }catch (let error) {
                        print(error)
                        print("item load fail")
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
//    (["phone": nil,
//      "birth": nil,
//      "status": Optional(0),
//      "nickname": nil,
//      "kakaoAccount": Optional(["deletedAt": nil,
//                                "status": Optional(0),
//                                "description": nil,
//                                "userId": Optional(33),
//                                "createdAt": Optional("2022-06-29T05:51:30.000Z"),
//                                "id": Optional("2299075227"),
//                                "thumbnail_image_url": nil,
//                                "__typename": Optional("KakaoAccount"),
//                                "is_default_image": nil,
//                                "profile_image_url": nil,
//                                "updatedAt": Optional("2022-06-29T05:51:30.000Z")]),
//      "passwd": nil,
//      "appleAccount": nil,
//      "joinPath": Optional(Bidit.JoinPath.kakao),
//      "createdAt": Optional("2022-06-29T05:51:30.000Z"),
//      "deletedAt": nil,
//      "__typename": Optional("User"),
//      "email": Optional("ko_su@naver.com"),
//      "description": nil,
//      "updatedAt": Optional("2022-06-29T05:51:30.000Z"),
//      "pushToken": Optional(["status": Optional(0),
//                             "token": Optional("dsj2fOOJS7KeRYBMxEjHtL:APA91bF-ZK_bjl1gEpoVaILBgxNzLKIegHiWvUf8qGR2qeez_80fAyIL_cMEh2QxDbyb2cdNxMooFLR6w7KMT_zkFNcz8FSkiqhnnAlvbQgTAQjUdaqCCEmpxLdJ2Ri-R3vUh_iS0sJ2"),
//                             "updatedAt": Optional("2022-07-06T08:45:40.000Z"),
//                             "__typename": Optional("PushToken"),
//                             "createdAt": Optional("2022-07-06T08:45:40.000Z"),
//                             "id": Optional(5), "userId": Optional(33)]), "id": Optional(33)])
    
    
}
