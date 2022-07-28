//
//  MessageList.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/03.
//

import Foundation
import SendBirdUIKit
import UIKit
// 채팅방 (대화)
class MessageList : SBUChannelViewController {
    
    
    var noticeContainer = UIView()
    var itemImage = UIImageView()
    var itemName = UILabel()
    var statusLabel = UIImageView()
    var priceLabel = UILabel()
    
    init(channelUrl: String){
           super.init(channelUrl: channelUrl)
           //self.leftBarButton = createHighlightedBackButton()
        self.register(userMessageCell: MessageCell())
        layout()
        attribute()

       }
    
    //하단 send
    override func messageInputView(_ messageInputView: SBUMessageInputView, didSelectSend text: String) {
            guard text.count > 0 else { return }
            
            guard let messageParams = SBDUserMessageParams(message: text) else {
                return
            }
            
            messageParams.customType = "EXAMPLE 1"
            
            self.sendUserMessage(messageParams: messageParams)
            print("Working")
        }
    
    
    func layout(){
        self.view.addSubview(noticeContainer)
        noticeContainer.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(74)

        }
        noticeContainer.addSubview(itemImage)
        noticeContainer.addSubview(itemName)
        noticeContainer.addSubview(statusLabel)
        noticeContainer.addSubview(priceLabel)
        
        itemImage.snp.makeConstraints{
            $0.width.height.equalTo(44)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(18)
        }
        
        itemName.snp.makeConstraints{
            $0.leading.equalTo(itemImage.snp.trailing).offset(12)
            $0.top.equalTo(itemImage.snp.top)
        }
        statusLabel.snp.makeConstraints{
            $0.leading.equalTo(itemName.snp.leading)
            $0.top.equalTo(itemName.snp.bottom).offset(5)
            $0.width.equalTo(67)
            $0.height.equalTo(18)
            
        }
        
        priceLabel.snp.makeConstraints{
            $0.leading.equalTo(statusLabel.snp.trailing).offset(5)
            $0.top.equalTo(statusLabel.snp.top)
        }
        
        
    }
    func attribute(){
        noticeContainer.backgroundColor = .white
        //채팅방 타이틀
        let myView = UILabel()
        myView.text = "닉네임" // channel!.name.count > 0 ? channel!.name : "Empty channel"
        self.titleView = myView
         //메뉴버튼
        
        var barButtonItem = UIBarButtonItem(title: "test", style: .done, target: self, action: #selector(menuTapped))
        barButtonItem.image = UIImage(named: "menu_btn")
        self.rightBarButton? = barButtonItem
        
        self.statusLabel.image = UIImage(named: "buynow_status_img")
        self.itemImage.image = UIImage(named: "empty_product_img") //프로필 이미지 설정
        self.itemImage.layer.cornerRadius = 10
        self.itemImage.layer.masksToBounds = true
        
        self.priceLabel.text = " 100,000"
        self.priceLabel.font = .systemFont(ofSize: 12, weight: .bold)
        self.itemName.text = "닉네임"
        self.itemName.font = .systemFont(ofSize: 12, weight: .bold)
        
    }
    //메뉴버튼 이벤트
    @objc func menuTapped () {
            print("tapped")
        setActionSheet()
        
    }
    
    /*
     액션시트
    차단하기, 채팅방 나가기, 닫기
     */
    private func setActionSheet(){
        //action sheet title 지정
        
        let optionMenu = UIAlertController(title: nil, message: "", preferredStyle: .actionSheet)
        
        //옵션 초기화
        
        //차단하기,
        let blockAction = UIAlertAction(title: "차단하기", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            
            let vc = NotOpenDialogVC()
            vc.modalPresentationStyle = .fullScreen
           
            // 보여주기
            self.present(vc, animated: false, completion: nil)
            
        })
//        채팅방 나가기"
        let exitAction = UIAlertAction(title: "채팅방 나가기", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            
            let vc = NotOpenDialogVC()
            vc.modalPresentationStyle = .fullScreen
           
            // 보여주기
            self.present(vc, animated: false, completion: nil)
            // self.setDeletePopup()
        })
       //cancel
        let cancelAction = UIAlertAction(title: "닫기", style: .cancel, handler: {
            (alert: UIAlertAction!) -> Void in
            
        })
        
        //action sheet에 옵션 추가.
        
        optionMenu.addAction(blockAction)
        optionMenu.addAction(exitAction)
        optionMenu.addAction(cancelAction)
        
        
        
        //show
        
        self.present(optionMenu, animated: true, completion: nil)
        
        
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
