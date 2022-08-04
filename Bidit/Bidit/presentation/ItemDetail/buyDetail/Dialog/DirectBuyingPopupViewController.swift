//
//  DirectBuyingPopupViewController.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/05.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import SendBirdUIKit

class DirectBuyingPopupViewController : UIViewController{
    
    var disposeBag = DisposeBag()
    
    private var containerView = UIView() //팝업 컨테이너
    private var priceLabel = UILabel() // **원에
    private var directText = UILabel() //구매할게요
    private var sendChatBtn = UIButton() //즉시 구매 채팅 보내기 버튼
    private var cancelBtn = UIButton() // 취소 버튼
    
    // 즉구할때 나(구매자), 상대(아이템 판매자)
    let myId = UserDefaults.standard.integer(forKey: "userId") //userId
    let myName = UserDefaults.standard.string(forKey: "userName")
    var currItem : Item? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        attribute()
        bind()
    }
    
    func layout(){
        self.view.addSubview(containerView)
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 4
        
        containerView.snp.makeConstraints{
            
            $0.height.equalTo(234)
            $0.leading.trailing.equalToSuperview().inset(18)
            $0.centerY.equalToSuperview()
        }
        self.containerView.addSubview(priceLabel)
        priceLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(30)
            $0.centerX.equalToSuperview()
        }
        self.containerView.addSubview(directText)
        directText.snp.makeConstraints{
            $0.top.equalTo(priceLabel.snp.bottom).offset(4)
            $0.centerX.equalToSuperview()
        }
        
        
        self.containerView.addSubview(sendChatBtn)
        sendChatBtn.snp.makeConstraints{
            $0.width.equalTo(310)
            $0.height.equalTo(42)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(directText.snp.bottom).offset(30)
        }
        
        self.containerView.addSubview(cancelBtn)
        cancelBtn.snp.makeConstraints{
            $0.width.equalTo(310)
            $0.height.equalTo(42)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(sendChatBtn.snp.bottom).offset(12)
        }
    }
    
    func attribute(){
        priceLabel.text = "  원에"
        directText.text = "즉시구매 할게요."
        
        sendChatBtn.setImage(UIImage(named: "direct_chat_btn"), for: .normal)
        cancelBtn.setImage(UIImage(named: "cancel_direct_btn"), for: .normal)
        
        //배경 어둡게
        self.view.backgroundColor = .black.withAlphaComponent(0.2)
    }
    
    func bind(){
        
        
        
        priceLabel.text = "  \(self.decimalWon(value: (currItem?.buyNow)!))원에"
        
        //채널 생성.
        var channelUrl = ""
        
        //취소 버튼
        self.cancelBtn.rx.tap.subscribe(onNext : {
            self.dismiss(animated: true)
        }).disposed(by: disposeBag)
        
        //즉시 구매 채팅 보내기
        self.sendChatBtn.rx.tap.subscribe(onNext : {
            
//            //채널에 넣어둘 정보 Data변환
//            let jsonEncoder = JSONEncoder()
//            jsonEncoder.outputFormatting = .prettyPrinted
//            let data  = try? jsonEncoder.encode(self.currItem) //"\(self.currItem?.title ?? "")_\(self.currItem?.buyNow ?? 0)" // //self.currItem.debugDescription  ////try?
            
            print("myname : \(self.myName!)")
            print("currentItemUser : \(self.currItem?.userId)")
            var opId = self.currItem?.userId
            var users: [String] = []
            var chatItem : ChatItem? = ChatItem(id: self.currItem?.id,
                                                status: 0, //즉시 구매시 0
                                                userId: self.currItem?.userId,
                                                userName: self.currItem?.user?.nickname ?? "닉네임 없음.",
                                                sPrice: self.currItem?.sPrice,
                                                cPrice: self.currItem?.cPrice,
                                                buyNow: self.currItem?.buyNow,
                                                name: self.currItem?.name,
                                                title: self.currItem?.title,
                                                buyerId: UserDefaults.standard.integer(forKey: "userId"),
                                                buyerName: UserDefaults.standard.string(forKey: "userName") ?? "닉네임 없음"
            
            )
        
            
            var jsonString : String = ""
            var jsonData : Data? = nil
            do {
                //struct to jsonData
                jsonData = try JSONEncoder().encode(chatItem) // data
                print(jsonData)
                print()

                //jsonData to string
                jsonString  = String.init(data: jsonData!, encoding: .utf8) ?? "err"
                print( "jsonString : \(jsonString)")
                print()
            } catch let err{
                print("err:\(err.localizedDescription)")
            }

            
            
//            print("data : \(data?.description)")
            //users.append("\(self.myId)")
            users.append("\(opId!)")
            //채팅방 이름 : status_구메자닉네임_구매자ID, 판매자 닉네임_ 즉구 가격
            print("채널 이름. : 0_\(self.myName!)_\(self.myId)_\(self.currItem?.user?.nickname ?? " ")_\(chatItem?.buyNow ?? 0)_\(chatItem?.title ?? " ")")
            SBDGroupChannel.createChannel(withName: "0_\(self.myName!)_\(self.myId)_\(self.currItem?.user?.nickname ?? " ")_\(chatItem?.title ?? " ")_\(chatItem?.buyNow ?? 0)", //즉구 : 0, 낙찰 : 1
                                          isDistinct: true,
                                          userIds: users,
                                          coverUrl: self.currItem?.image?[0].url,
                                          data: jsonString , //data?.description , //현재 거래 아이템 정보.
                                          customType: nil,
                                          completionHandler:
                                            { (groupChannel, error) in
                guard error == nil else {
                    // Handle error.
                    print("채널 생성 실패")
                    return
                }

                // A group channel with additional information is successfully created.
                channelUrl = groupChannel!.channelUrl
                print("채널 생성 성공.")
//                var autoAccept = true  // The value of true (default) means that a user will automatically join a group channel with no choice of accepting and declining an invitation.
//                SBDMain.setChannelInvitationPreferenceAutoAccept(autoAccept, completionHandler: { (error) in
//                    guard error == nil else {
//                        // Handle error.
//                        return
//
//                    }
//                    print("초대 승낙")
//
//
//                })
                guard let pvc = self.presentingViewController
                else {
                    print("no navigation")
                    return}

                self.dismiss(animated: true) {
                    var nextVC =  MessageList(channelUrl: channelUrl)
                    var naviVC = UINavigationController(rootViewController: nextVC)
                    naviVC.modalPresentationStyle = .fullScreen
                    pvc.present(naviVC, animated: false)
                }
            })
            
           
            
            
//
            
        }).disposed(by: disposeBag)
    }
    //가격 형식 쉼표찍기
    func decimalWon(value: Int) -> String{
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            let result = numberFormatter.string(from: NSNumber(value: value))!
            
            return result
        }
    
}
