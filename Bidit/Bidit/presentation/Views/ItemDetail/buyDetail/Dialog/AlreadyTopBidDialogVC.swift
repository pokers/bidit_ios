//
//  AlreadyTopBidDialogVC.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/24.
//

import Foundation
import UIKit
import RxSwift
//이미 최고가를 입찰하셨습니다. 팝업
class AlreadyTopBidDialogVC : UIViewController{
    
    var preVC : BottomSheetViewController? = nil
    var disposeBag: DisposeBag  = DisposeBag()
    private var containerView = UIView() //팝업 컨테이너
    private var popupTitleText = UILabel() //이미 최고가를 입찰하셨습니다.
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
            $0.top.equalToSuperview().offset(40)
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
            $0.bottom.equalToSuperview().inset(32)
        }
    }
    
    func attribute(){
        popupTitleText.text = "이미 최고가를 입찰하셨습니다."
        popupTitleText.font = .systemFont(ofSize: 20, weight: .medium)
        descriptioLabel.text =
                                """

"""
        
        descriptioLabel.font = .systemFont(ofSize: 14, weight: .medium)
        
        cancelBtn.setImage(UIImage(named: "fail_check_btn_img"), for: .normal)
        
        //배경 어둡게
        self.view.backgroundColor = .black.withAlphaComponent(0.2)
    }
    
    func bind(){
        //취소 버튼 이벤트
        self.cancelBtn.rx.tap.subscribe(onNext : {
            self.dismiss(animated: false){
                self.preVC?.dismiss(animated: false)
            }
        }).disposed(by: disposeBag)
        
    }
}
