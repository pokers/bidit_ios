//
//  ItemImage.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/15.
//

import Foundation
//이비지
struct ItemImage : Codable{
    var id: Int? = 0
    var status: Int? = 0
    var itemId: Int? = 0
    var type: Int? = 0
    var url: String
    var createdAt: String? = ""
    var updatedAt: String? = ""
    var deletedAt: String? = ""
}
