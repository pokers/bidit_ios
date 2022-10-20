//
//  BannerCellReactor.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/06/12.
//

import Foundation
import ReactorKit

class BannerCellReactor : Reactor{
    typealias Action = NoAction
    let initialState: Banner
    
    init(banner : Banner){
        self.initialState = banner
        
    }
}
