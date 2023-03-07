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
    var email : String?
    //let joinPath : String
    var counting : Counting?
    
    var kakaoAccount : KakaoAccount?
    var appleAccount : AppleAccount?
    

    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case nickname = "nickname"
        case status = "status"
        case kakaoAccount = "kakaoAccount"
        case appleAccount = "appleAccount"
        case counting = "counting"
            
        }

}

