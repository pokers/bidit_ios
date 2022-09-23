//
//  UIView+WidthConstraint.swift
//  Bidit
//
//  Created by pokers on 2022/09/21.
//

import Foundation

import Foundation
import UIKit

extension UIView {
    var widthConstraint: NSLayoutConstraint? {
        get {
            return constraints.first(where: {
                $0.firstAttribute == .width && $0.relation == .equal
            })
        }
        set { setNeedsLayout() }
    }
}
