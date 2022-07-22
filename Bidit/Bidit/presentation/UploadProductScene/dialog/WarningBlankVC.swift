//
//  WarningBlankVC.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/21.
//

import Foundation
import UIKit
import RxSwift
//(아직 작성하지 않은 항목이 있어요.)팝업
class WarningBlankVC : UIViewController{
    
    var disposeBag: DisposeBag  = DisposeBag()
    private var containerView = UIView() //팝업 컨테이너
    private var popupTitleText = UILabel() //아직 작성하지 않은 항목이 있어요.
    private var descriptioLabel = UILabel() //제목, 카테고리, 가격, 마감 날짜 및 시간, 내용은 필수적으로 작성해주세요.
    private var cancelBtn = UIButton() // 취소 버튼
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
            $0.width.equalTo(340)
            $0.height.equalTo(182)
            $0.leading.trailing.equalToSuperview().inset(18)
            $0.centerY.equalToSuperview()
        }
       
        self.containerView.addSubview(popupTitleText)
        popupTitleText.snp.makeConstraints{
            $0.top.equalToSuperview().offset(16)
            $0.centerX.equalToSuperview()
        }
        
        
        self.containerView.addSubview(descriptioLabel)
        descriptioLabel.snp.makeConstraints{
            $0.width.equalTo(310)
            $0.height.equalTo(60)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(popupTitleText.snp.bottom).offset(16)
        }
        
        self.containerView.addSubview(cancelBtn)
        cancelBtn.snp.makeConstraints{
            $0.width.equalTo(310)
            $0.height.equalTo(42)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(descriptioLabel.snp.bottom).offset(12)
        }
    }
    
    func attribute(){
        popupTitleText.text = "아직 작성하지 않은 항목이 있어요."
        popupTitleText.font = .systemFont(ofSize: 20, weight: .medium)
        descriptioLabel.numberOfLines = 0;
        descriptioLabel.text = """
제목, 카테고리, 가격, 마감 날짜 및 시간, 내용은
        필수적으로 작성해주세요.
"""
        
        descriptioLabel.font = .systemFont(ofSize: 14, weight: .medium)
        descriptioLabel.textColor = UIColor(red: 0.62, green: 0.62, blue: 0.62, alpha: 1)
        cancelBtn.setImage(UIImage(named: "fail_check_btn_img"), for: .normal)
        
        //배경 어둡게
        self.view.backgroundColor = .black.withAlphaComponent(0.2)
    }
    
    func bind(){
        //취소 버튼 이벤트
        self.cancelBtn.rx.tap.subscribe(onNext : {
            self.dismiss(animated: false)
        }).disposed(by: disposeBag)
        
    }
}
