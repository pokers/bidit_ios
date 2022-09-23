//
//  KakaoAccount.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/13.
//

import Foundation
import UIKit

struct KakaoAccount : Codable{
    
    let id : Double!
    let status: Int!
    let userId: Int!
    let  createdAt: String!
    let  updatedAt: String!
    
    
    let name: String?
//    let email_needs_agreement: Bool
   
    let email: String?
   
    let phoneNumber: String?
   
    let  nickname: String?
    let  thumbnail_image_url: String?
    let  profile_image_url: String?
    let  is_default_image: Bool?
   
//    let deletedAt: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case status = "status"
        case userId = "userId"
        case name = "name"
        case email = "email"
        case phoneNumber = "phone_number"
        case nickname = "nickname"
        case thumbnail_image_url = "thumbnail_image_url"
        case profile_image_url = "profile_image_url"
        case is_default_image = "is_default_image"
        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
            
        }
}
