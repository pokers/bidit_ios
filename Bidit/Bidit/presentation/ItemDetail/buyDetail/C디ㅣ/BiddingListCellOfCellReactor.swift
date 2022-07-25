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
    
    let initialState : State
    
    struct State {
        var bidding :  Bidding //getBiddingListMock()//
       
      }
    
    init(bidding : Bidding){
        self.initialState = .init(bidding: bidding)
    }
}
