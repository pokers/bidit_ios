//
//  Bidding.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/24.
//

import Foundation
struct Bidding : Codable{
    var id: Int
    var status: Int
    var userId: Int
    var itemId: Int
    var price: Int
    var createdAt: String
    var user: User
    var gap : Int
}
