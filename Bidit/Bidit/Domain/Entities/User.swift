//
//  User.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/13.
//

import Foundation
struct User : Codable{
    var id : Int
    var status : Int
    var nickname : String?
    //let joinPath : String
    
    var kakaoAccount : KakaoAccount?
    var appleAccount : AppleAccount?
    
//
//    init() {
//
//        id = 1
//        status = 0
//        nickname = ""
//        kakaoAccount = nil
//        appleAccount = nil
//    }
//    
    
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
    
//    enum JoinPath : Codable{
//        case KAKAO
//        case APPLE
//        case GOOGLE
//    }
//    enum gender : Codable{
//        case MALE
//        case FEMALE
//    }

    
//    private enum CodingKeys: CodingKey {
//           case id, status, nickname, passwd, joinPath, birth, email, phone, createdAt, updatedAt, deletedAt, description, items,kakaoAccount,
//                appleAccount, pushToken, penalty, userAlarm
//       }
//
//       init(from decoder: Decoder) throws {
//           let values = try decoder.container(keyedBy: CodingKeys.self)
//           id = (try? values.decode(Int.self, forKey: .id)) ?? 0
//           status = (try? values.decode(Int.self, forKey: .status)) ?? 0
//           nickname = (try? values.decode(String.self, forKey: .nickname)) ?? ""
//           passwd = (try? values.decode(String.self, forKey: .passwd)) ?? ""
//           joinPath = (try? values.decode(JoinPath.self, forKey: .joinPath)) ?? .KAKAO
//           birth = (try? values.decode(String.self, forKey: .birth)) ?? ""
//           email = (try? values.decode(String.self, forKey: .email)) ?? ""
//           phone = (try? values.decode(String.self, forKey: .phone)) ?? ""
//           createdAt = (try? values.decode(String.self, forKey: .createdAt)) ?? ""
//           updatedAt = (try? values.decode(String.self, forKey: .updatedAt)) ?? ""
//           deletedAt = (try? values.decode(String.self, forKey: .deletedAt)) ?? ""
//           description = (try? values.decode(String.self, forKey: .description)) ?? ""
//           items = (try? values.decode(ItemConnection.self, forKey: .items)) ?? nil
//           kakaoAccount = (try? values.decode(KakaoAccount.self, forKey: .kakaoAccount)) ?? nil
//           appleAccount = (try? values.decode(AppleAccount.self, forKey: .appleAccount)) ?? nil
//           pushToken = (try? values.decode(PushToken.self, forKey: .pushToken)) ?? nil
//           penalty = (try? values.decode(Penalty.self, forKey: .penalty)) ?? nil
//           userAlarm = (try? values.decode(UserAlarm.self, forKey: .userAlarm)) ?? nil
//       }
    
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        id = 1
//        status = 0    //# 0=VALID, 1=INVALID
//        nickname = ""
//        passwd = ""
//       joinPath = .KAKAO
//
//        birth = ""
//        email = ""
//        phone = ""
//        createdAt = ""
//        updatedAt = ""
//        deletedAt = ""
//        description = ""
//        items = (try? values.decode(ItemConnection.self, forKey: .items)) ?? nil
//
//        kakaoAccount = (try? values.decode(KakaoAccount.self, forKey: .kakaoAccount)) ?? nil
//        appleAccount = nil
//        pushToken = nil
//        penalty = nil
//        userAlarm = nil
//
//
//    }

}

