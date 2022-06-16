//
//  MainReactor.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/06/12.
//

import Foundation
import ReactorKit

class MainReactor : Reactor{
    
    enum Action {
        case touchButton(index: Int)
    }
    
    enum Mutation {
        case setImage(image: UIImage?)
    }
    
    struct State {
        var image: UIImage?
    }
    
    let initialState: State
    
    init() {
        self.initialState = State()
    }
}
