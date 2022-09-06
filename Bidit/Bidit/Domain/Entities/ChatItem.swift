//
//  ChatItem.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/29.
//

import Foundation
struct ChatItem : Codable{
    var id : Int! //아이템 아이디
    var status : Int!
    var userId : Int! //판매자 아이디
    var userName : String
    var sPrice: Int? = 0
    var cPrice: Int? = 0 
    var buyNow: Int? = 0
    var name: String? = ""
    var title: String? = ""
    var buyerId : Int //구매자 아이디
    var buyerName : String
   
  


    
}

extension ChatItem : Equatable{
    static func == (lhs : ChatItem, rhs : ChatItem) -> Bool{
        lhs.id == rhs.id
    }
}
