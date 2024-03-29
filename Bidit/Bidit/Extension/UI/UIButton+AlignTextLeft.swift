//
//  UIButton+.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/22.
//

import Foundation
import UIKit
extension UIButton {
    func alignTextLeft(spacing: CGFloat = 8.0) {
        contentHorizontalAlignment = .leading
        titleEdgeInsets = UIEdgeInsets(top: 0, left: spacing/2, bottom: 0, right: -spacing/2)
        imageEdgeInsets = UIEdgeInsets(top: 0, left: -spacing/2, bottom: 0, right: spacing/2)
        contentEdgeInsets = UIEdgeInsets(top: 0, left: spacing / 2, bottom: 0, right: -spacing / 2)
    }
}
