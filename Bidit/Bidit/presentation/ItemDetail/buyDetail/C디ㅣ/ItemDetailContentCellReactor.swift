//
//  ItemDetailContentCellReactor.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/06/25.
//
import ReactorKit
import Foundation
class ItemDetailContentCellReactor : Reactor{
    typealias Action = NoAction
    
    let initialState : Item
    
    init(item : Item){
        self.initialState = item
    }
}

