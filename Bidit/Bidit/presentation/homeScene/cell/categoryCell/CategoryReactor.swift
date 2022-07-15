//
//  CategoryReactor.swift
//  Bidit
//
//

import Foundation
import ReactorKit

class CategoryReactor: Reactor {

    
    typealias Action = NoAction
    let initialState: CategoryEntity
    
    init(category : CategoryEntity){
        self.initialState = category
        
    }
}
