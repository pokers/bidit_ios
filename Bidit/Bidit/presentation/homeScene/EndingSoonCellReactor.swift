//
//  EndingSoonCellReactor.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/06/16.
//

import Foundation
import UIKit
import ReactorKit

class EndingSoonCellReactor : Reactor{
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
        var timeInterval : String
        
    }
    
    
    init(item : Item){
        self.initialState = .init(item: item, timeInterval: calcRestDay(end: item.dueDate ?? ""))

    }
    
    
   
}
