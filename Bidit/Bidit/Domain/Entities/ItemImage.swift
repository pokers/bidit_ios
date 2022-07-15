//
//  ItemImage.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/15.
//

import Foundation

struct ItemImage : Codable{

    let id: Int!
    let status: Int!
    let itemId: Int!
    let type: Int
    let url: String
    let createdAt: String!
    let updatedAt: String
    let deletedAt: String
}
