//
//  PickedImageReactor.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/09.
//

import Foundation
import ReactorKit
//제품 사진 셀 리액터
class PickedImageReactor : Reactor{
    var initialState: State
    
    
    
    enum Action {
        case layoutSubviews
       
    }
      
      
    enum Mutation {
        case updateDataSource
      
    }
      
      
    struct State {
        var image : UIImage?
        var count : Int?
        
      }

      
    init(image : UIImage) {
        self.initialState = State(image: image)
    }
      
      func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .layoutSubviews:
          return Observable<Mutation>.just(.updateDataSource)
            
            
        
        }
      }
      
      func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        switch mutation {
        case .updateDataSource:
         // state.messageSection = getMockSections()
            break
            
        }
        return state
      }
    
}

//    func getMockSections() -> [CategorySection] {
//        let mainItem1 = CategorySectionItem.category(CategoryReactor(category: Category(categoryName: "1")))
//        let mainItem2 =  CategorySectionItem.category(CategoryReactor(category: Category(categoryName: "1")))
//        let mainItem3 =  CategorySectionItem.category(CategoryReactor(category: Category(categoryName: "1")))
//        let mainItem4 =  CategorySectionItem.category(CategoryReactor(category: Category(categoryName: "1")))
//        let mainItem5 =  CategorySectionItem.category(CategoryReactor(category: Category(categoryName: "1")))
//        let mainItem6 =  CategorySectionItem.category(CategoryReactor(category: Category(categoryName: "1")))
//        let mainItem7 =  CategorySectionItem.category(CategoryReactor(category: Category(categoryName: "1")))
//        let mainItem8 =  CategorySectionItem.category(CategoryReactor(category: Category(categoryName: "1")))
//        let mainItem9 =  CategorySectionItem.category(CategoryReactor(category: Category(categoryName: "1")))
//        let mainItem10 =  CategorySectionItem.category(CategoryReactor(category: Category(categoryName: "1")))
//        let mainItem11 =  CategorySectionItem.category(CategoryReactor(category: Category(categoryName: "1")))
//        let mainItem12 =  CategorySectionItem.category(CategoryReactor(category: Category(categoryName: "1")))
//
//
//      let itemsInFirstSection = [mainItem1, mainItem2, mainItem3,mainItem4, mainItem5,mainItem6,
//                                 mainItem7,
//                                 mainItem8,mainItem9,mainItem10,mainItem11,mainItem12]
//      let firstSection = CategorySection(
//        original: CategorySection(
//          original: .category(itemsInFirstSection),
//          items: itemsInFirstSection
//        ),
//        items: itemsInFirstSection
//      )
//
//      return [firstSection]
//}
