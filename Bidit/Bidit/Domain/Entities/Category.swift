//
//  Category.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/06/13.
//

import Foundation

struct Category : ModelType{
    var categoryName : String
    var isDone = false
}

extension Category : Equatable{
    static func == (lhs : Category, rhs : Category) -> Bool{
        lhs.categoryName == rhs.categoryName
    }
}

