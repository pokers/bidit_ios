//
//  ItemConnection.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/13.
//

import Foundation

struct ItemConnection : Codable{
    let totalCount: Int
    let  edges: [ItemEdge]
    let  pageInfo: PageInfo
}
