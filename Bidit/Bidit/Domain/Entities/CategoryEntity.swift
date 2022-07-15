//
//  CategoryEntity.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/06/13.
//

import Foundation

struct CategoryEntity : ModelType{
    var categoryName : String
    var isDone = false
}

extension CategoryEntity : Equatable{
    static func == (lhs : CategoryEntity, rhs : CategoryEntity) -> Bool{
        lhs.categoryName == rhs.categoryName
    }
}

