//
//  MessageList.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/03.
//

import Foundation
import SendBirdUIKit
import UIKit

class MessageList : SBUChannelViewController {
    
    
    var noticeContainer = UIView()
    
    init(channelUrl: String){
           super.init(channelUrl: channelUrl)
           //self.leftBarButton = createHighlightedBackButton()
        layout()
        attribute()

       }
    
    func layout(){
        self.view.addSubview(noticeContainer)
        noticeContainer.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(74)

        }
        
        
    }
    func attribute(){
        noticeContainer.backgroundColor = .blue
    }
       
       func createHighlightedBackButton() -> UIBarButtonItem {
           let backButton = UIButton(type: .custom)
           backButton.frame = .init(x: 0, y: 0, width: 50, height: 45)
           backButton.setTitle("Back", for: .normal)
           backButton.setTitleColor(SBUColorSet.primary300, for: .normal)
           backButton.addTarget(self, action: #selector(clickedBack), for: .touchUpInside)
           let backBarButton = UIBarButtonItem(customView: backButton)
           return backBarButton
       }
       
       @objc func clickedBack() {
           self.navigationController?.popViewController(animated: true)
           self.dismiss(animated: true, completion: nil)
       }
}
