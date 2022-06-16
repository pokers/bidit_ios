//
//  CategoryReactor.swift
//  Bidit
//
//

import Foundation
import ReactorKit

class CategoryReactor: Reactor {

    
    typealias Action = NoAction
    let initialState: Category
    
    init(category : Category){
        self.initialState = category
        
    }
}
