//
//  Banner.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/06/12.
//

import Foundation

import RxDataSources

struct Banner : ModelType{
    var message : String
    var isDone = false
}

extension Banner : Equatable{
    static func == (lhs : Banner, rhs : Banner) -> Bool{
        lhs.message == rhs.message
    }
}
