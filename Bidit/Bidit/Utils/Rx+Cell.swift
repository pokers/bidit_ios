//
//  Rx+Cell.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/06/13.
//

import Foundation
import UIKit

import RxCocoa
import RxSwift

public extension Reactive where Base: UITableViewCell {
    

  var layoutSubviews: ControlEvent<Void> {
      let source = self.methodInvoked(#selector(Base.layoutSubviews)).map { _ in }
    return ControlEvent(events: source)
  }
    
}

