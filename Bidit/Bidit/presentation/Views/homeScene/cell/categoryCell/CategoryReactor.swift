//
//  CategoryReactor.swift
//  Bidit
//
//

import Foundation
import ReactorKit

class CategoryReactor: Reactor {
    typealias Action = NoAction
    
    struct State {
        var categoryEntity : CategoryEntity
        var categoryId : Int
    }
      
    let initialState: State

    init(initialState: State) {
        self.initialState = initialState
    }
}
