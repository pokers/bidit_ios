//
//  SearchReactor.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/06/28.
//

import Foundation
import ReactorKit
import UIKit

//검색 뷰 컨트롤러 리액터
class SearchReactor : Reactor {
    
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
