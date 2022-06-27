//
//  BiddingListCellOfCellReactor.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/06/25.
//

import Foundation
import ReactorKit
class BiddingListCellOfCellReactor : Reactor{
    typealias Action = NoAction
    
    let initialState : Item
    
    init(item : Item){
        self.initialState = item
    }
}
