//
//  ProfileEntity.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/13.
//

import Foundation
struct ProfileEntity :ModelType, Codable{
    
    let id : Int
    let status : Int
    let nickname : String?
    //let joinPath : String
    
    let kakaoAccount : KakaoAccount?
    let appleAccount : AppleAccount?
    
    init() {
        id = 1
        status = 0
        nickname = ""
        kakaoAccount = nil
        appleAccount = nil
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case nickname = "nickname"
        case status = "status"
        case kakaoAccount = "kakaoAccount"
        case appleAccount = "appleAccount"
        }
//    enum JoinPath : Codable{
//        case KAKAO
//        case APPLE
//        case GOOGLE
//    }
}

extension ProfileEntity : Equatable{
    static func == (lhs : ProfileEntity, rhs : ProfileEntity) -> Bool{
        lhs.id == rhs.id
    }
}

