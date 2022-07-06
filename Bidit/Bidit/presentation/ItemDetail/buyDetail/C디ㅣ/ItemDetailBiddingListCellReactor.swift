//
//  ItemDetailBiddingListCellReactor.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/06/25.
//

import Foundation
import ReactorKit

class ItemDetailBiddingListCellReactor : Reactor{
    
    
    
    enum Action {
        case viewDidLoad
        //case cellSelected(IndexPath)
       
    }
      
      
    enum Mutation {
        case updateDataSource
        //case setSelectedIndexPath(IndexPath?)
       
    }
      
      
    struct State {
        var itemSection = getBiddingListMock()// [ProductListSection]()//
        //var selectedIndexPath : IndexPath?
       
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
            
//        case .cellSelected(let indexPath):
//            return Observable.concat([
//                Observable.just(Mutation.setSelectedIndexPath(indexPath)),
//                Observable.just(Mutation.setSelectedIndexPath(nil))
//            ])
        
        }
      }
      
      func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        switch mutation {
            
        case .updateDataSource:
            state.itemSection = []//getBiddingListMock()
        
//        case .setSelectedIndexPath(let indexPath):
//            state.selectedIndexPath = indexPath
            
        }
        return state
      
      }
    
//    let initialState : Item
//    
//    init(item : Item){
//        self.initialState = item
//    }
}
func getBiddingListMock() -> [BiddingListSection]{
    print("입찰 내역 생성")
    let tempItem1 = BiddingListSectionItem.item(BiddingListCellOfCellReactor(item : Item()))
    let tempItem2 = BiddingListSectionItem.item(BiddingListCellOfCellReactor(item : Item()))
    let tempItem3 = BiddingListSectionItem.item(BiddingListCellOfCellReactor(item : Item()))
    let tempItem4 = BiddingListSectionItem.item(BiddingListCellOfCellReactor(item : Item()))
    let tempItem5 = BiddingListSectionItem.item(BiddingListCellOfCellReactor(item : Item()))

    let itemInFirstSection = [tempItem1, tempItem2, tempItem3, tempItem4, tempItem5]

    let firstSection = BiddingListSection(
        original: BiddingListSection(
            original: .first(itemInFirstSection),
            items: itemInFirstSection),
        items: itemInFirstSection)

    return [firstSection]

}

