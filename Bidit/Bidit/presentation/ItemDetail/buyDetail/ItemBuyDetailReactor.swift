//
//  ItemBuyDetailReactor.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/06/25.
//

import Foundation
import ReactorKit
class ItemBuyDetailReactor : Reactor {
    enum Action {
        case viewDidLoad
    }
    
    enum Mutation {
        //case updateDataSource
        case setTitle
        case setAlbum
        case setContent
        case setBiddingList
    }
    
    struct State {
       // var itemSection = getDetailMock()//[ProductListSection]()
        var albumSection = ItemDetailSection.DetailSectionModel(model: .album, items: [])
        
        var titleSection = ItemDetailSection.DetailSectionModel(model: .title, items: [])
        var contentSection = ItemDetailSection.DetailSectionModel(model: .content, items: [])
        var biddingListSection = ItemDetailSection.DetailSectionModel(model: .biddingList, items: [])

    }
    
    let initialState: State
    
    init() {
        self.initialState = State()
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
      switch action {
      case .viewDidLoad:
          return .concat(
            [Observable<Mutation>.just(.setAlbum),
             Observable<Mutation>.just(.setTitle),
             Observable<Mutation>.just(.setContent),
             Observable<Mutation>.just(.setBiddingList)
            ]
          )
      }
    }
    
    
    
    
    
    func reduce(state: State, mutation: Mutation) -> State {
      var state = state
      switch mutation {
      case .setAlbum:
          let items = ItemDetailSection.DetailItem.photo
          state.albumSection = ItemDetailSection.DetailSectionModel(model: .album, items: [items])
          
      case .setTitle:
          let items = ItemDetailSection.DetailItem.title
          state.titleSection = ItemDetailSection.DetailSectionModel(model: .title, items: [items])
          
      case .setContent:
          let items = ItemDetailSection.DetailItem.content
          state.contentSection = ItemDetailSection.DetailSectionModel(model: .content, items: [items])
          
      case .setBiddingList:
          let items = ItemDetailSection.DetailItem.bidding
          state.biddingListSection = ItemDetailSection.DetailSectionModel(model: .biddingList, items: [items])
          
          
      }
      return state
    
    }
    
}
//func getDetailMock() -> [ItemDetailSctionItem]{
//    let tempItem1 = .item(ItemDetailImageCellReactor())
//    let tempItem2 = DetailListSectionItem.item(ItemDetailImageCellReactor())
//    let tempItem3 = DetailListSectionItem.item(ItemDetailImageCellReactor())
//    let tempItem4 = DetailListSectionItem.item(ItemDetailImageCellReactor())
//   // let tempItem5 = ProductListSectionItem.item(EndingSoonCellReactor(item : Item(id : 5)))
//
//    let itemInFirstSection = [tempItem1, tempItem2, tempItem3, tempItem4]
//
//    let firstSection = DetailListSection(
//        original: DetailListSection(
//            original: .first(itemInFirstSection),
//            items: itemInFirstSection),
//        items: itemInFirstSection)
//
//    return [firstSection]
//
//}
