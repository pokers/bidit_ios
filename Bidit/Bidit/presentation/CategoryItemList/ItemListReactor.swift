//
//  ItemListReactor.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/06/16.
//

import Foundation
import ReactorKit


class ItemListReactor : Reactor{
    
    enum Action {
        case viewDidLoad
        case cellSelected(IndexPath)
        case tapSortButton(isOpened : Bool) // 유저 정렬버튼 클릭 -> mutate()를 통해 Mutation반환
        
        case tapPopularityBtn
        case tapEndingSoonBtn
        case tapLatestBtn
    }
      
      
    enum Mutation {
        case updateDataSource
        case setSelectedIndexPath(IndexPath?)
        case sortListOpen(isOpened : Bool) // -> reduce()를 통해 State반환하여 UI정보 업데이트
      
        case sortPopularity
        case sortEndingSoon
        case sortLatest
    }
      
      
    struct State {
        var itemSection = getItemListMock()//[ProductListSection]()
        var selectedIndexPath : IndexPath?
        var isSortListOpened : Bool = false
        var sortState : SortState = .latest
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
            
        case .cellSelected(let indexPath):
            return Observable.concat([
                Observable.just(Mutation.setSelectedIndexPath(indexPath)),
                Observable.just(Mutation.setSelectedIndexPath(nil))
            ])
            
        case .tapSortButton(let isOpened): // isOpened : 누르기 전 상태
            print( "isOpened 열렸니? : \(isOpened)")
            return Observable<Mutation>.just(Mutation.sortListOpen(isOpened: isOpened))
            
        case .tapPopularityBtn:
            print("reactor : 인기순 버튼 클릭")
            return Observable<Mutation>.just(Mutation.sortPopularity)
        
        case .tapEndingSoonBtn:
            print("reactor : 마감직전 버튼 클릭")
            return Observable<Mutation>.just(Mutation.sortEndingSoon)
        case .tapLatestBtn:
            print("reactor : 최신순 버튼 클릭")
            return Observable<Mutation>.just(Mutation.sortLatest)
        
        }
      }
      
      func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        switch mutation {
            
        case .updateDataSource:
            state.itemSection = getItemListMock()
        
        case .setSelectedIndexPath(let indexPath):
            state.selectedIndexPath = indexPath
            
        case .sortListOpen(let isOpened):
            state.isSortListOpened = isOpened
            print("reactor sortList \(isOpened)")
            
        case .sortPopularity:
            print("reactor 인기순")
            state.sortState = .popularity
            
        case .sortEndingSoon:
            state.sortState = .endingSoon
            
        case .sortLatest:
            state.sortState = .latest
            
        }
        return state
      
      }
    
    enum SortState{
        case null
        case popularity
        case endingSoon
        case latest
    }
}
