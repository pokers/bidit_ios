//
//  UITextField+.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/06/18.
//


import Foundation
import UIKit

extension UITextField {
    func addLeftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
}
