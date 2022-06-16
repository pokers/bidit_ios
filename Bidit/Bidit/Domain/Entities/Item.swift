//
//  Item.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/06/16.
//

import Foundation
struct Item : ModelType{
    var id : Int
    var isDone = false
}

extension Item : Equatable{
    static func == (lhs : Item, rhs : Item) -> Bool{
        lhs.id == rhs.id
    }
}
