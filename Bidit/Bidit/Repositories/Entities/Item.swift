//
//  Item.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/06/16.
//

import Foundation
//상품 상태
enum ItemStatus : Int{
    case REGISTED = 0//등록
    case ONGOING = 1//경매중
    case SOLD = 2//판매 완료
    case END = 3//거래 완료
    case CANCEL = 4 //등록 취소
}

struct Item : ModelType, Codable{
    var id : Int!
    var status : Int!
    var categoryId : Int? = 0
    var userId : Int!
    var sPrice: Int? = 0
    var cPrice: Int? = 0 //# It's not used. Temporary.
    var buyNow: Int? = 0
    var viewCount: Int? = 0
    var name: String? = ""
    var title: String? = ""
    var dueDate: String? = ""
    var deliveryType: Int?  = 0//# 0=DIRECT, 1=PARCEL, 2=BOTH
    var sCondition: Int? = 0
    var aCondition: Int? = 0
    var createdAt: String? = ""
    var updatedAt: String? = ""
    var deletedAt: String? = ""
    var image : [ItemImage]? = []
    var user : User?
   // let description: ItemDescription
    //let  image: [ItemImage]
   // let category: Category
    
}

extension Item : Equatable{
    static func == (lhs : Item, rhs : Item) -> Bool{
        lhs.id == rhs.id
    }
}
//(["sPrice": Optional(100000),
//  "updatedAt": Optional("2022-07-12T04:53:02.000Z"),
//  "status": Optional(0),
//  "cPrice": nil,
//  "id": Optional(47),
//  "buyNow": Optional(500000),
//  "dueDate": Optional("2022-07-31T00:00:00.000Z"),
//  "title": Optional("아이폰13 프로맥스 256G 팝니다."),
//  "name": Optional("아이폰13"),
//  "__typename": Optional("Item")])
