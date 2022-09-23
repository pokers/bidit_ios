//
//  CompleteWithdrawalVC.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/25.
//

import Foundation
import UIKit

class CompleteWithdrawalVC : UIViewController {
    
    
    var completeTitle = UILabel() // 탈퇴가 완료되었습니다.
    var descriptionLabel = UILabel() // BidiT을 이용해주셔서 감사합니다. 더욱더 노력하고 발전하는 BidiT이 되겠습니다.
    var goLoginBtn = UIButton() // 로그인 화면으로 돌아가기
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        layout()
        attribute()
        bind()
    }
    
    func layout(){
        [completeTitle, descriptionLabel, goLoginBtn].forEach{
            self.view.addSubview($0)
        }
        completeTitle.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(269)
        }
        descriptionLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(completeTitle.snp.bottom).offset(12)
            
        }
        goLoginBtn.snp.makeConstraints{
            $0.bottom.equalToSuperview().inset(32)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(340)
            $0.height.equalTo(42)
        }
    }
    
    func attribute(){
        completeTitle.text = "탈퇴가 완료되었습니다."
        completeTitle.font = .systemFont(ofSize: 20, weight: .bold)
        
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .center
        descriptionLabel.text =
        """
BidiT을 이용해주셔서 감사합니다.
더욱더 노력하고 발전하는 BidiT이 되겠습니다.
"""
        
        descriptionLabel.font = .systemFont(ofSize: 14, weight: .regular)
        descriptionLabel.textColor = UIColor(red: 0.62, green: 0.62, blue: 0.62, alpha: 1)
        
        goLoginBtn.setImage(UIImage(named: "back_login_btn_img"), for: .normal)
    }
    
    func bind(){
        self.goLoginBtn.rx.tap
            .subscribe(onNext : {
                self.dismiss(animated: false)
            })
    }
}
