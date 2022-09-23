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
    let mainItem1 = CategorySectionItem
        .category(CategoryReactor(initialState: .init(categoryEntity: CategoryEntity(categoryName: "iphone_img"),
                                                      categoryId: 2)  ))
    let mainItem2 =  CategorySectionItem
        .category(CategoryReactor(initialState: .init(categoryEntity: CategoryEntity(categoryName: "tablet_img"),
                                                      categoryId: 3)  )) //CategoryEntity(categoryName: "tablet_img")
    let mainItem3 =  CategorySectionItem
        .category(CategoryReactor(initialState: .init(categoryEntity: CategoryEntity(categoryName: "gallaxy_img"),
                                                      categoryId: 4)  )) //CategoryEntity(categoryName: "gallaxy_img")
    let mainItem4 =  CategorySectionItem
        .category(CategoryReactor(initialState: .init(categoryEntity: CategoryEntity(categoryName: "monitor_img"),
                                                      categoryId: 5)  )) // CategoryEntity(categoryName: "monitor_img")
    let mainItem5 =  CategorySectionItem
        .category(CategoryReactor(initialState: .init(categoryEntity: CategoryEntity(categoryName: "etc_phone_img"),
                                                      categoryId: 6)  )) //CategoryEntity(categoryName: "etc_phone_img")
    let mainItem6 =  CategorySectionItem
        .category(CategoryReactor(initialState: .init(categoryEntity: CategoryEntity(categoryName: "game_img"),
                                                      categoryId: 7)  )) //CategoryEntity(categoryName: "game_img")
    let mainItem7 =  CategorySectionItem
        .category(CategoryReactor(initialState: .init(categoryEntity: CategoryEntity(categoryName: "smart_watch_img"),
                                                      categoryId: 8)  )) //CategoryEntity(categoryName: "smart_watch_img")
    let mainItem8 =  CategorySectionItem
        .category(CategoryReactor(initialState: .init(categoryEntity: CategoryEntity(categoryName: "music_img"),
                                                      categoryId: 9)  )) //CategoryEntity(categoryName: "music_img")
    let mainItem9 =  CategorySectionItem
        .category(CategoryReactor(initialState: .init(categoryEntity: CategoryEntity(categoryName: "notebook_img"),
                                                      categoryId: 10)  )) // CategoryEntity(categoryName: "notebook_img")
    let mainItem10 =  CategorySectionItem
        .category(CategoryReactor(initialState: .init(categoryEntity: CategoryEntity(categoryName: "camera_img"),
                                                      categoryId: 11)  ))// CategoryEntity(categoryName: "camera_img")
    let mainItem11 =  CategorySectionItem
        .category(CategoryReactor(initialState: .init(categoryEntity: CategoryEntity(categoryName: "drone_img"),
                                                      categoryId: 12)  )) //CategoryEntity(categoryName: "drone_img")
    let mainItem12 =  CategorySectionItem
        .category(CategoryReactor(initialState: .init(categoryEntity: CategoryEntity(categoryName: "etc_img"),
                                                      categoryId: 13)  )) //CategoryEntity(categoryName: "etc_img")
    
  
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
