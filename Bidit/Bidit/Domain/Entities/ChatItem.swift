//
//  ChatItem.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/29.
//

import Foundation
struct ChatItem : Codable{
    var id : Int!
    var status : Int!
    var userId : Int!
    var sPrice: Int? = 0
    var cPrice: Int? = 0 //# It's not used. Temporary.
    var buyNow: Int? = 0
    var name: String? = ""
    var title: String? = ""
   
  


    
}

extension ChatItem : Equatable{
    static func == (lhs : ChatItem, rhs : ChatItem) -> Bool{
        lhs.id == rhs.id
    }
}
