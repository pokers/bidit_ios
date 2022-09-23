//
//  Penalty.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/13.
//

import Foundation



struct Penalty : Codable{
    let  id: Int!
    let  status: Int!    //# 0=VALID, 1=INVALID
    let  userId: Int
    let  type: PenaltyType
    let  dueDate: String
    let  description: String
    let  createdAt: String!
    let  updatedAt: String
    let  deletedAt: String
    
    enum PenaltyType : Codable{
        case BIDDING
        case SELLING
        case KICKED
    }

}

