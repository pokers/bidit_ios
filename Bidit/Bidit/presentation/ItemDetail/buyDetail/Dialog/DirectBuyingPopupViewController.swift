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

class DirectBuyingPopupViewController : UIViewController{
    
    
    private var containerView = UIView() //팝업 컨테이너
    private var priceLabel = UILabel() // **원에
    private var directText = UILabel() //구매할게요
    private var sendChatBtn = UIButton() //즉시 구매 채팅 보내기 버튼
    private var cancelBtn = UIButton() // 취소 버튼
    
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
            $0.width.equalTo(340)
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
        self.cancelBtn.rx.tap.subscribe(onNext : {
            self.dismiss(animated: true)
        })
        self.sendChatBtn.rx.tap.subscribe(onNext : {
            let vc = NotOpenDialogVC()
            vc.modalPresentationStyle = .fullScreen
           
            // 보여주기
            self.present(vc, animated: false, completion: nil)
        })
    }
    
}
