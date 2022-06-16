//
//  Default.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/06/12.
//

import Foundation


struct Default : ModelType{
    var message : String
    var isDone = false
}

extension Default : Equatable{
    static func == (lhs : Default, rhs : Default) -> Bool{
        lhs.message == rhs.message
    }
}

