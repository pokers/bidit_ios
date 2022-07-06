//
//  Item.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/06/16.
//

import Foundation
struct Item : ModelType, Codable{
    var id : Int!
    let status : Int!
    let categoryId : Int?
    let userId : Int!

    let sPrice: Int?
    let cPrice: Int? //# It's not used. Temporary.
    let buyNow: Int?
    let viewCount: Int?
    let name: String?
    let title: String?
    let dueDate: String?
    let deliveryType: Int? //# 0=DIRECT, 1=PARCEL, 2=BOTH
    let sCondition: Int?
    let aCondition: Int?
    var createdAt: String!
    let  updatedAt: String?
    let  deletedAt: String?
   // let description: ItemDescription
    //let  image: [ItemImage]
   // let category: Category
    

    init() {
        
        id = 1
        status = 0
        userId = 1
        createdAt = "22222"
        categoryId = 1
        sPrice = 1
        cPrice = 1
        buyNow = 1
        viewCount = 1
        name = " 아이템 이름"
        title = ""
        dueDate =  " "
        deliveryType = 1 //# 0=DIRECT, 1=PARCEL, 2=BOT
        sCondition = 1
        aCondition = 1
        createdAt = ""
        updatedAt = ""
        deletedAt = ""
        
    }
    
    
}

extension Item : Equatable{
    static func == (lhs : Item, rhs : Item) -> Bool{
        lhs.id == rhs.id
    }
}
