//
//  PolicyVC.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/10.
//

import Foundation
import UIKit
//서비스 이용약관
class PolicyVC : UIViewController {
    
    
    var policyTitle = UILabel()
    
    var descriptionLabel = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setNavigationBar()
        layout()
        attribute()
        
    }
    
    /*
      네비게이션 바
     */
    private func setNavigationBar(){
        //self.navigationItem.leftBarButtonItem = backButton
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = . gray
        self.navigationController?.navigationBar.isHidden = false
        self.title = "서비스 이용약관"

        self.tabBarController?.tabBar.isHidden = true
    }
    
    func layout(){
        self.view.addSubview(policyTitle)
        policyTitle.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(18)
            
            $0.top.equalToSuperview().offset(104)
        }
        self.view.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(18)
            $0.top.equalTo(policyTitle.snp.bottom).offset(12)
            $0.bottom.equalToSuperview().inset(32)
            
        }
    }
    
    func attribute(){
        self.policyTitle.text = "탈퇴하기 버튼을 누르면  복구가 불가능하며, 7일 동안 가입이 제한됩니다."
        self.policyTitle.numberOfLines = 0
        self.policyTitle.font = .systemFont(ofSize: 14, weight: .medium)
        
        self.descriptionLabel.text = "현재 계정으로 비딧이 제공하는 이벤트, 프로모션, 서비스, 혜택에 참여하실 수 없습니다. 현재 계정으로 비딧이 제공하는 이벤트, 프로모션, 서비스, 혜택에 참여하실 수 없습니다.현재 계정으로 비딧이 제공하는 이벤트, 프로모션, 서비스, 혜택에 참여하실 수 없습니다. 현재 계정으로 비딧이 제공하는 이벤트, 프로모션, 서비스, 혜택에 참여하실 수 없습니다.현재 계정으로 비딧이 제공하는 이벤트, 프로모션, 서비스, 혜택에 참여하실 수 없습니다. 현재 계정으로 비딧이 제공하는 이벤트, 프로모션, 서비스, 혜택에 참여하실 수 없습니다.현재 계정으로 비딧이 제공하는 이벤트, 프로모션, 서비스, 혜택에 참여하실 수 없습니다. 현재 계정으로 비딧이 제공하는 이벤트, 프로모션, 서비스, 혜택에 참여하실 수 없습니다.현재 계정으로 비딧이 제공하는 이벤트, 프로모션, 서비스, 혜택에 참여하실 수 없습니다. 현재 계정으로 비딧이 제공하는 이벤트, 프로모션, 서비스, 혜택에 참여하실 수 없습니다.현재 계정으로 비딧이 제공하는 이벤트, 프로모션, 서비스, 혜택에 참여하실 수 없습니다. 현재 계정으로 비딧이 제공하는 이벤트, 프로모션, 서비스, 혜택에 참여하실 수 없습니다.현재 계정으로 비딧이 제공하는 이벤트, 프로모션, 서비스, 혜택에 참여하실 수 없습니다. 현재 계정으로 비딧이 제공하는 이벤트, 프로모션, 서비스, 혜택에 참여하실 수 없습니다.현재 계정으로 비딧이 제공하는 이벤트, 프로모션, 서비스, 혜택에 참여하실 수 없습니다. 현재 계정으로 비딧이 제공하는 이벤트, 프로모션, 서비스, 혜택에 참여하실 수 없습니다.현재 계정으로 비딧이 제공하는 이벤트, 프로모션, 서비스, 혜택에 참여하실 수 없습니다. 현재 계정으로 비딧이 제공하는 이벤트, 프로모션, 서비스, 혜택에 참여하실 수 없습니다.현재 계정으로 비딧이 제공하는 이벤트, 프로모션, 서비스, 혜택에 참여하실 수 없습니다. 현재 계정으로 비딧이 제공하는 이벤트, 프로모션, 서비스, 혜택에 참여하실 수 없습니다.현재 계정으로 비딧이 제공하는 이벤트, 프로모션, 서비스, 혜택에 참여하실 수 없습니다. 현재 계정으로 비딧이 제공하는 이벤트, 프로모션, 서비스, 혜택에 참여하실 수 없습니다.현재 계정으로 비딧이 제공하는 이벤트, 프로모션, 서비스, 혜택에 참여하실 수 없습니다. 현재 계정으로 비딧이 제공하는 이벤트, 프로모션, 서비스, 혜택에 참여하실 수 없습니다."
        
        self.descriptionLabel.font = .systemFont(ofSize: 12, weight: .regular)
        self.descriptionLabel.textColor =  UIColor(red: 0.62, green: 0.62, blue: 0.62, alpha: 1)
        
    }

}
