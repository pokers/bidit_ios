//
//  HomeProductListReactor.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/06/13.
//

import Foundation
import ReactorKit
class HomeProductListReactor : Reactor{
    typealias Action = NoAction
    let initialState: Banner
    
    init(banner : Banner){
        self.initialState = banner
        
    }
}
