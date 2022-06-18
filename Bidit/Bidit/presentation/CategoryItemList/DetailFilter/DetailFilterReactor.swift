//
//  DetailFilterReactor.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/06/18.
//

import Foundation
import ReactorKit

class DetailFilterReactor : Reactor{
    enum Action {
        case tapExitBtn
    }
    
    enum Mutation {
        case closeFilter
    }
    
    struct State {
        var isOpened = true
    }
    
    let initialState: State
    
    init() {
        self.initialState = State()
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
      switch action {
          
      case .tapExitBtn:
        return Observable<Mutation>.just(.closeFilter)
      }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
      var state = state
      switch mutation {
          
      case .closeFilter:
          return state
      }
        return state
    }
    
}
