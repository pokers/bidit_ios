//
//  Category.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/13.
//

import Foundation

struct Category : Codable {
    let id: Int!
    let status: Int!
    //let parentId: Int
    let name: String?
    //let depth: Int
    let createdAt: String!
    let updatedAt: String?
    let deletedAt: String?
    
}
