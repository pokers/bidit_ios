//
//  FailDeleteDialogVC.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/17.
//

import Foundation
import UIKit
import RxSwift
//(판매글 삭제가 불가능합니다)팝업
class FailDeleteDialogVC : UIViewController{
    var disposeBag: DisposeBag  = DisposeBag()
    private var containerView = UIView() //팝업 컨테이너
    private var popupTitleText = UILabel() //판매글 삭제가 불가능합니다.
    private var descriptioLabel = UILabel() //이 판매글은 현재 입찰이 진행되어 삭제가 불가능해요.
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
            $0.height.equalTo(42)
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
        popupTitleText.text = "판매글 삭제가 불가능합니다"
        popupTitleText.font = .systemFont(ofSize: 20, weight: .medium)
        descriptioLabel.text =
                                """
이 판매글은 현재 입찰이 진행되어
    삭제가 불가능해요.
"""
        
        descriptioLabel.font = .systemFont(ofSize: 14, weight: .medium)
        
        cancelBtn.setImage(UIImage(named: "fail_check_btn_img"), for: .normal)
        
        //배경 어둡게
        self.view.backgroundColor = .black.withAlphaComponent(0.2)
    }
    
    func bind(){
        //취소 버튼 이벤트
        self.cancelBtn.rx.tap.subscribe(onNext : {
            self.dismiss(animated: true)
        }).disposed(by: disposeBag)
        
    }
}
