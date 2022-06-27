//
//  HomeReactor.swift
//  Bidit
//

import Foundation
import ReactorKit
import Reusable
import UIKit


//리액터를 뷰에 연결해주어야함 .
class HomeReactor : Reactor{
    
    
    enum Action {
        case viewDidLoad
        case cellSelected(IndexPath)
    }
      
      
    enum Mutation {
        case updateDataSource
        case setSelectedIndexPath(IndexPath?)
      
    }
      
      
    struct State {
        var messageSection = [CategorySection]()
        var selectedIndexPath : IndexPath?
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
        }
        
      }
      
      func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        switch mutation {
        case .updateDataSource:
          state.messageSection = getMockCategory()
            
        case .setSelectedIndexPath(let indexPath):
            state.selectedIndexPath = indexPath
            print("reactor endingSoon : ")
        }
        return state
      
      }
    
}



func getMockCategory() -> [CategorySection] {
    let mainItem1 = CategorySectionItem.category(CategoryReactor(category: Category(message: "1")))
    let mainItem2 =  CategorySectionItem.category(CategoryReactor(category: Category(message: "1")))
    let mainItem3 =  CategorySectionItem.category(CategoryReactor(category: Category(message: "1")))
    let mainItem4 =  CategorySectionItem.category(CategoryReactor(category: Category(message: "1")))
    let mainItem5 =  CategorySectionItem.category(CategoryReactor(category: Category(message: "1")))
    let mainItem6 =  CategorySectionItem.category(CategoryReactor(category: Category(message: "1")))
    let mainItem7 =  CategorySectionItem.category(CategoryReactor(category: Category(message: "1")))
    let mainItem8 =  CategorySectionItem.category(CategoryReactor(category: Category(message: "1")))
    let mainItem9 =  CategorySectionItem.category(CategoryReactor(category: Category(message: "1")))
    let mainItem10 =  CategorySectionItem.category(CategoryReactor(category: Category(message: "1")))
    let mainItem11 =  CategorySectionItem.category(CategoryReactor(category: Category(message: "1")))
    let mainItem12 =  CategorySectionItem.category(CategoryReactor(category: Category(message: "1")))
    
  
  let itemsInFirstSection = [mainItem1, mainItem2, mainItem3,mainItem4, mainItem5,mainItem6,
                             mainItem7,
                             mainItem8,mainItem9,mainItem10,mainItem11,mainItem12]
  let firstSection = CategorySection(
    original: CategorySection(
      original: .category(itemsInFirstSection),
      items: itemsInFirstSection
    ),
    items: itemsInFirstSection
  )
  
  return [firstSection]
}
