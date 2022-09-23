//
//  UIView+.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/06/16.
//

import Foundation
import UIKit

extension UIView {
    var heightConstraint: NSLayoutConstraint? {
        get {
            return constraints.first(where: {
                $0.firstAttribute == .height && $0.relation == .equal
            })
        }
        set { setNeedsLayout() }
    }
}
