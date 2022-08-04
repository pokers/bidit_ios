//
//  MessageList.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/03.
//

import Foundation
import SendBirdUIKit
import UIKit
import Kingfisher
// 채팅방 (대화)
class MessageList : SBUChannelViewController {
    
    
    var noticeContainer = UIView()
    var itemImage = UIImageView()
    var itemName = UILabel()
    var statusLabel = UIImageView()
    var priceLabel = UILabel()
    //채팅방 타이틀
    let myView = UILabel()
    //채팅방 정보
    var currItem : Item? = nil
    
    init(channelUrl: String){
           super.init(channelUrl: channelUrl)
           //self.leftBarButton = createHighlightedBackButton()
        self.register(userMessageCell: MessageCell())
        
        
        
        layout()
        attribute()
        
        getChannelName(channelUrl: channelUrl)
//        self.myView.text = self.channelName!.count > 0 ? self.channelName : "Empty channel"

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
    
    func bind(){
        
        
        
    }
    /*
     채팅방 정보.
     */
    func getChannelName(channelUrl : String){
        SBDGroupChannel.getWithUrl((channelUrl), completionHandler: { (groupChannel, error) in
            guard error == nil else {
                // Handle error.
                return
            }

            // Through the "groupChannel" parameter of the callback method,
            // the group channel object identified with the CHANNEL_URL is returned by Sendbird server,
            // and you can get the group channel's data from the result object.
            var array = groupChannel?.name.components(separatedBy: "_")
            print("array 결과 :\(array)")
            
//            self.itemName.text = array![4].description
//            self.priceLabel.text = self.decimalWon(value: Int((array?[5])!) ?? 0)
            
            
            
            self.myView.text = array![1]
            if array![1] == UserDefaults.standard.string(forKey: "userName"){
                self.myView.text = array![3]
            }
            

            do {
                let jsonString = try groupChannel!.data ?? "" //groupChannel?.data//try?
                
                //string to jsonData
               
                let jsonData2 : Data = try jsonString.data(using: .utf8)!
                print("jsonData2 :\(jsonData2)")
                    print()
                let str = String.init(data: jsonData2, encoding: .utf8)!
                
                print("str :\(String(str))")
                //jsonData to dictionary
                let result = self.convertToDictionary(text: str) //try JSONDecoder().decode(ChatItem.self, from: jsonData2)
                print("json result :\(result)")

                self.itemName.text = result!["title"] as! String
                if result!["status"] as! Int == 0{
                    self.statusLabel.image = UIImage(named: "buynow_status_img")
                }else {
                    self.statusLabel.image = UIImage(named: "final_bid_status_img")
                }
                
                var oppoNames = result!["userName"] as! String
                if UserDefaults.standard.integer(forKey: "userId") == result!["userId"] as! Int { //내가 판매자라면
                    oppoNames = result!["buyerName"] as! String
                }
                self.myView.text = oppoNames
                print(oppoNames)
                print("nickNames :\(oppoNames)")
                
                print( "result print :\(result!["title"] as! String)")
//                let jsonDic = try JSONSerialization.jsonObject(with: jsonData2, options: []) as? ChatItem// as? Dictionary<String, Any> ?? [:]
//                print(jsonDic)
//                print()
//                let jsonDic2 = try JSONSerialization.jsonObject(with: jsonData2, options: []) as? [String : Any] ?? [:]
//                print(" jsonDic2 :\(jsonDic2)")
//                print()
//                print("channel data : \(jsonString)")
//                //dictionary to jsonData
//                let jsonData3:Data = try JSONSerialization.data(withJSONObject: jsonDic2, options: .sortedKeys)
//                print(jsonData3)
//                print()

                    //jsonData to struct
                
                //self.itemName.text = ""
                let structForm:ChatItem = try JSONDecoder().decode(ChatItem.self, from: jsonData2)
                    print("structForm : \(structForm)")
            } catch let err{
                print("err:\(err.localizedDescription)")
            }

        
            
            //let itemImage = item?["image"] as? ItemImage
           
            
            self.itemImage.image = self.loadProfileImg(url: (groupChannel?.coverUrl ??  "") as String)
            
        })
    }
    func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }

//    let str = "{\"name\":\"James\"}"
//
//    let dict = convertToDictionary(text: str)
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
    
    func loadProfileImg(url : String) -> UIImage{
        var resultImage : UIImage?
        if let thumbnailUrl = URL(string: url) {
            KingfisherManager.shared.retrieveImage(with: thumbnailUrl, completionHandler: { result in
            switch(result) {
                case .success(let imageResult):
//                    let resized = imageResult.image.resizedImageWithContentMode(.scaleAspectFit, bounds: CGSize(width: 84, height: 84), interpolationQuality: .medium)
                    //imageView.isHidden = false
                resultImage = imageResult.image
                case .failure(let error):
                break
                }
            })
        }
        return resultImage ?? UIImage(named: "empty_product_img")!
    }
    
    //가격 형식 쉼표찍기
    func decimalWon(value: Int) -> String{
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            let result = numberFormatter.string(from: NSNumber(value: value))!
            
            return result
        }
}
