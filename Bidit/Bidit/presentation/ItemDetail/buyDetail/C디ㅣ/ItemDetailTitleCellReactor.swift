//
//  ItemDetailTitleCellReactor.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/06/25.
//

import Foundation
import ReactorKit

class ItemDetailTitleCellReactor : Reactor{
    
    var initialState: State
    
    enum Action {
       // case touchButton(index: Int)
        
    }
   
    
    enum Mutation {
        //case setImage(image: UIImage?)
    }
    
    struct State {
     //   var image: UIImage?
        var item : Item
        
    }
    
    
    init(item : Item){
        self.initialState = .init(item: item)

    }
    
}
