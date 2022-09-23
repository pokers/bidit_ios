//
//  MessageCell.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/28.
//

import Foundation
import SendBirdUIKit
import UIKit
class MessageCell: SBUUserMessageCell {

    override func setupStyles() {
        super.setupStyles()
        self.messageTextView.backgroundColor = UIColor(red: 0.059, green: 0.259, blue: 0.957, alpha: 1)
       // self.messageContentView.backgroundColor = .lightGray
    }
}
