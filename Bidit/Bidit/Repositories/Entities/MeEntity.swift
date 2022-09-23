//
//  MeEntity.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/14.
//

import Foundation
struct MeEntity : Codable {
    let me : User
    
    enum CodingKeys: String, CodingKey {
        case me = "me"
    }
}
