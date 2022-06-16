//
//  EndingSoonCellReactor.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/06/16.
//

import Foundation
import UIKit
import ReactorKit

class EndingSoonCellReactor : Reactor{
    typealias Action = NoAction
    
    let initialState : Item
    
    init(item : Item){
        self.initialState = item
    }
}
