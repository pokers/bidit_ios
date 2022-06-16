//
//  EndingSoonReactor.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/06/16.
//

import Foundation

import ReactorKit

class EndingSoonReactor : Reactor {
    
    enum Action {
        case viewDidLoad
    }
      
      
    enum Mutation {
        case updateDataSource
      
    }
      
      
    struct State {
        var itemSection = getItemListMock()//[ProductListSection]()
      }
      
      let initialState: State
      
      init(
        initialState: State
      ) {
        self.initialState = initialState
      }
      
      func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .viewDidLoad:
          return Observable<Mutation>.just(.updateDataSource)
        }
      }
      
      func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        switch mutation {
        case .updateDataSource:
          state.itemSection = getItemListMock()
        }
        return state
      
      }
    
}


func getItemListMock() -> [ProductListSection]{
    let tempItem1 = ProductListSectionItem.item(EndingSoonCellReactor(item : Item(id : 1)))
    let tempItem2 = ProductListSectionItem.item(EndingSoonCellReactor(item : Item(id : 2)))
    let tempItem3 = ProductListSectionItem.item(EndingSoonCellReactor(item : Item(id : 3)))
    let tempItem4 = ProductListSectionItem.item(EndingSoonCellReactor(item : Item(id : 4)))
    let tempItem5 = ProductListSectionItem.item(EndingSoonCellReactor(item : Item(id : 5)))
    
    let itemInFirstSection = [tempItem1, tempItem2, tempItem3, tempItem4, tempItem5]
    
    let firstSection = ProductListSection(
        original: ProductListSection(
            original: .first(itemInFirstSection),
            items: itemInFirstSection),
        items: itemInFirstSection)
    
    return [firstSection]
    
}
