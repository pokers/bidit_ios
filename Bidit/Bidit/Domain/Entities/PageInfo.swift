//
//  PageInfo.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/13.
//

import Foundation

struct PageInfo : Codable{
    let startCursor: String
    let  endCursor: String
    let  hasNextPage: Bool
    let  hasPrevPage: Bool
}
