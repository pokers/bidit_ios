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
        case tapBiddingBtn
        case tapDirectBuyingBtn
        
    }
    
    enum Mutation {
        case switchBidding
        case switchDirectBuying
        case updateData
    }
    
    struct State {
       // var itemSection = getDetailMock()//[ProductListSection]()
        
        var sections: [DetailCellSection]
        var isOpenBidding : Bool
        var isOpenDirectBuying : Bool
        var item : Item

    }
    
    let initialState: State
    
    init(item : Item) {
    
        self.initialState = State(sections: configSections(item: item), isOpenBidding: false, isOpenDirectBuying: false, item: item)
        
        
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
      switch action {
      case .viewDidLoad:
          return Observable<Mutation>.just(.updateData)
      
      case .tapBiddingBtn:
        print("mutate 호출")
          return Observable<Mutation>.just(.switchBidding)
          
      case .tapDirectBuyingBtn:
          print("mutate 호출")
          return Observable<Mutation>.just(.switchDirectBuying)
      }
    
    
    
    
    
    func reduce(state: State, mutation: Mutation) -> State {
      var state = state
      switch mutation {
      case .switchBidding :
          let statusBid =  state.isOpenBidding
          print("\(statusBid) bidding status")
          state.isOpenBidding = statusBid
     
          break
     
      case .switchDirectBuying:
          let statusDirect =  state.isOpenDirectBuying
          print(statusDirect)
          state.isOpenDirectBuying = (statusDirect)
          break
          
      case .updateData:
          state = initialState
          break
      }
      return state
    
    
    }
        
        
 

        
       

    }

}
    
    /*
     셀 리액터 마다 아이템 할당.
     */
func configSections(item : Item) -> [DetailCellSection] {
            
    let firstCell = DetailCellSectionItem.photo(ItemDetailImageCellReactor(item: item))
    let albumSection = DetailCellSection.album([firstCell])
        
    let secondCell = DetailCellSectionItem.title(ItemDetailTitleCellReactor(item: item))
    let titleSection = DetailCellSection.title([secondCell])
        
    let thirdCell = DetailCellSectionItem.content(ItemDetailContentCellReactor(item: item))
    let contentSection = DetailCellSection.content([thirdCell])
        
    let fourthCell = DetailCellSectionItem.bidding(ItemDetailBiddingListCellReactor(initialState: .init()))
    let biddingSection = DetailCellSection.biddingList([fourthCell])
            
        
    return [albumSection, titleSection, contentSection, biddingSection]
    
}


