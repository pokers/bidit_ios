//
//  ReasonOptionVC.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/12.
//

import Foundation
import UIKit
//탈퇴사유 선택 창
class ReasonOptionVC : UIViewController {
    
    let containerView = UIView()
    
    //기록삭제목적
    let deleteContainer = UIView()
    let deleteTitle = UILabel()
    let deleteBtn = UIButton()
    //이용이 불편하고 오류가 많아서
    let secondContainer = UIView()
    let secondTitle = UILabel()
    let secondBtn = UIButton()
    //신뢰도가 떨어져서
    let thirdContainer = UIView()
    let thirdTitle = UILabel()
    let thirdBtn = UIButton()
    //찾는 상품이 없어서
    let fourthContainer = UIView()
    let fourthTitle = UILabel()
    let fourthBtn = UIButton()
    //사용자들이 불친절해서
    let fifthContainer = UIView()
    let fifthTitle = UILabel()
    let fifthBtn = UIButton()
    //타 플랫폼을 더 사용해서
    let sixContainer = UIView()
    let sixTitle = UILabel()
    let sixBtn = UIButton()
    //콘텐츠 불만
    let seventhContainer = UIView()
    let seventhTitle = UILabel()
    let seventhBtn = UIButton()
    //사용빈도가 낮아서
    let eighthContainer = UIView()
    let eighthTitle = UILabel()
    let eighthBtn = UIButton()
    //기타.
    let ninthContainer = UIView()
    let ninthTitle = UILabel()
    let ninthBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
    }
    
    func layout(){
        view.addSubview(containerView)
        containerView.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(18)
            $0.top.equalToSuperview().offset(84)
            $0.height.equalTo(486)
        }
        containerView.backgroundColor = UIColor(red: 0.933, green: 0.933, blue: 0.933, alpha: 1)
        containerView.layer.cornerRadius = 10
        
        
        //배경 어둡게
        self.view.backgroundColor = .black.withAlphaComponent(0.2)
        //기록 삭제 목적
        containerView.addSubview(deleteContainer)
        deleteContainer.backgroundColor = .white
        deleteContainer.snp.makeConstraints{
            $0.height.equalTo(53)
            $0.leading.trailing.equalToSuperview()
            $0.top.equalToSuperview()
        }
        deleteContainer.addSubview(deleteTitle)
        deleteContainer.addSubview(deleteBtn)
        deleteTitle.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
        }
        deleteTitle.text = "기록 삭제 목적"
        deleteBtn.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(16)
            $0.width.height.equalTo(24)
            $0.centerY.equalToSuperview()
        }
        deleteBtn.setImage(UIImage(named: "radio_unchecked_img"), for: .normal)
        
        //이용이 불편하고 오류가 많아서
        containerView.addSubview(secondContainer)
        secondContainer.backgroundColor = .white
        secondContainer.snp.makeConstraints{
            $0.height.equalTo(53)
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(deleteContainer.snp.bottom).offset(1)
        }
        secondContainer.addSubview(secondTitle)
        secondContainer.addSubview(secondBtn)
        secondTitle.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
        }
        secondTitle.text = "이용이 불편하고 오류가 많아서"
        secondBtn.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(16)
            $0.width.height.equalTo(24)
            $0.centerY.equalToSuperview()
        }
        secondBtn.setImage(UIImage(named: "radio_unchecked_img"), for: .normal)
        
        //신뢰도가 떨어져서
        containerView.addSubview(thirdContainer)
        thirdContainer.backgroundColor = .white
        thirdContainer.snp.makeConstraints{
            $0.height.equalTo(53)
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(secondContainer.snp.bottom).offset(1)
        }
        thirdContainer.addSubview(thirdTitle)
        thirdContainer.addSubview(thirdBtn)
        thirdTitle.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
        }
        thirdTitle.text = "신뢰도가 떨어져서"
        thirdBtn.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(16)
            $0.width.height.equalTo(24)
            $0.centerY.equalToSuperview()
        }
        thirdBtn.setImage(UIImage(named: "radio_unchecked_img"), for: .normal)
        
        
        //찾는 상품이 없어서
        containerView.addSubview(fourthContainer)
        fourthContainer.backgroundColor = .white
        fourthContainer.snp.makeConstraints{
            $0.height.equalTo(53)
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(thirdContainer.snp.bottom).offset(1)
        }
        fourthContainer.addSubview(fourthTitle)
        fourthContainer.addSubview(fourthBtn)
        fourthTitle.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
        }
        fourthTitle.text = "찾는 상품이 없어서"
        fourthBtn.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(16)
            $0.width.height.equalTo(24)
            $0.centerY.equalToSuperview()
        }
        fourthBtn.setImage(UIImage(named: "radio_unchecked_img"), for: .normal)
        
        
        //사용자들이 불친절해서
        containerView.addSubview(fifthContainer)
        fifthContainer.backgroundColor = .white
        fifthContainer.snp.makeConstraints{
            $0.height.equalTo(53)
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(fourthContainer.snp.bottom).offset(1)
        }
        fifthContainer.addSubview(fifthTitle)
        fifthContainer.addSubview(fifthBtn)
        fifthTitle.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
        }
        fifthTitle.text = "사용자들이 불친절해서"
        fifthBtn.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(16)
            $0.width.height.equalTo(24)
            $0.centerY.equalToSuperview()
        }
        fifthBtn.setImage(UIImage(named: "radio_unchecked_img"), for: .normal)
        
        //타 플랫폼을 더 사용해서
        containerView.addSubview(sixContainer)
        sixContainer.backgroundColor = .white
        sixContainer.snp.makeConstraints{
            $0.height.equalTo(53)
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(fifthContainer.snp.bottom).offset(1)
        }
        sixContainer.addSubview(sixTitle)
        sixContainer.addSubview(sixBtn)
        sixTitle.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
        }
        sixTitle.text = "타 플랫폼을 더 사용해서"
        sixBtn.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(16)
            $0.width.height.equalTo(24)
            $0.centerY.equalToSuperview()
        }
        sixBtn.setImage(UIImage(named: "radio_unchecked_img"), for: .normal)
        
        //콘텐츠 불만
        containerView.addSubview(seventhContainer)
        seventhContainer.backgroundColor = .white
        seventhContainer.snp.makeConstraints{
            $0.height.equalTo(53)
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(sixContainer.snp.bottom).offset(1)
        }
        seventhContainer.addSubview(seventhTitle)
        seventhContainer.addSubview(seventhBtn)
        seventhTitle.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
        }
        seventhTitle.text = "콘텐츠 불만"
        seventhBtn.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(16)
            $0.width.height.equalTo(24)
            $0.centerY.equalToSuperview()
        }
        seventhBtn.setImage(UIImage(named: "radio_unchecked_img"), for: .normal)
        
        
        //사용빈도가 낮아서
        containerView.addSubview(eighthContainer)
        eighthContainer.backgroundColor = .white
        eighthContainer.snp.makeConstraints{
            $0.height.equalTo(53)
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(seventhContainer.snp.bottom).offset(1)
        }
        eighthContainer.addSubview(eighthTitle)
        eighthContainer.addSubview(eighthBtn)
        eighthTitle.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
        }
        eighthTitle.text = "사용빈도가 낮아서"
        eighthBtn.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(16)
            $0.width.height.equalTo(24)
            $0.centerY.equalToSuperview()
        }
        eighthBtn.setImage(UIImage(named: "radio_unchecked_img"), for: .normal)
        
        //기타
        containerView.addSubview(ninthContainer)
        ninthContainer.backgroundColor = .white
        ninthContainer.snp.makeConstraints{
            $0.height.equalTo(53)
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(eighthContainer.snp.bottom).offset(1)
        }
        ninthContainer.addSubview(ninthBtn)
        ninthContainer.addSubview(ninthTitle)
        ninthTitle.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
        }
        ninthTitle.text = "기타"
        ninthBtn.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(16)
            $0.width.height.equalTo(24)
            $0.centerY.equalToSuperview()
        }
        ninthBtn.setImage(UIImage(named: "radio_unchecked_img"), for: .normal)
        
    }
}
