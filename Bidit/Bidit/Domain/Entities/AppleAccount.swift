//
//  AppleAccount.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/13.
//

import Foundation

struct AppleAccount :Codable {
    let id: Int!
    let status: Int!       //# 0=VALID, 1=INVALID
    let userId: Int?
    let email: String?
    let createdAt: String?
    let updatedAt: String?
    let deletedAt: String?
    
}
