//
//  ProductStatusDialogVC.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/17.
//

import Foundation
import UIKit
import RxSwift

//판매중 상태 변경 팝업창.
class ProductStatusDialogVC : UIViewController{
    let containerView = UIView()
    var disposeBag: DisposeBag  = DisposeBag()
    //이전 화면
    var preVC : ItemDetailTitleCell? = nil
    //판매중
    let firstContainer = UIView()
    let firstTitle = UILabel()
    let firstBtn = UIButton()
    //예약중
    let secondContainer = UIView()
    let secondTitle = UILabel()
    let secondBtn = UIButton()
    //판매완료
    let thirdContainer = UIView()
    let thirdTitle = UILabel()
    let thirdBtn = UIButton()
    var currItem : Item? = nil
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        layout()
        bind()
    }
    
    func layout(){
        view.addSubview(containerView)
        containerView.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(18)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(162)
        }
        containerView.backgroundColor = UIColor(red: 0.933, green: 0.933, blue: 0.933, alpha: 1)
        containerView.layer.cornerRadius = 10
        
        
        //배경 어둡게
        self.view.backgroundColor = .black.withAlphaComponent(0.2)
        //기록 삭제 목적
        containerView.addSubview(firstContainer)
        firstContainer.backgroundColor = .white
        firstContainer.snp.makeConstraints{
            $0.height.equalTo(53)
            $0.leading.trailing.equalToSuperview()
            $0.top.equalToSuperview()
        }
        firstContainer.addSubview(firstTitle)
        firstContainer.addSubview(firstBtn)
        firstTitle.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
        }
        firstTitle.text = "판매중"
        firstBtn.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(16)
            $0.width.height.equalTo(24)
            $0.centerY.equalToSuperview()
        }
        firstBtn.setImage(UIImage(named: "radio_unchecked_img"), for: .normal)
        
        //이용이 불편하고 오류가 많아서
        containerView.addSubview(secondContainer)
        secondContainer.backgroundColor = .white
        secondContainer.snp.makeConstraints{
            $0.height.equalTo(53)
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(firstContainer.snp.bottom).offset(1)
        }
        secondContainer.addSubview(secondTitle)
        secondContainer.addSubview(secondBtn)
        secondTitle.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
        }
        secondTitle.text = "예약중"
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
        thirdTitle.text = "판매완료"
        thirdBtn.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(16)
            $0.width.height.equalTo(24)
            $0.centerY.equalToSuperview()
        }
        thirdBtn.setImage(UIImage(named: "radio_unchecked_img"), for: .normal)
        
        
       
        
    }
    
    
    func bind(){
        self.firstBtn.rx.tap.subscribe(onNext : {
            self.firstBtn.setImage(UIImage(named: "radio_checked_img"), for: .normal)
            print(" 선택 : 판매중.")
            var inputStatus = 0
            
            if self.currItem?.cPrice == 0{
                inputStatus = 0
            }else {
                inputStatus = 1
            }
            
            self.changeItemStatus(itemId: self.currItem!.id, status: inputStatus)
            self.preVC?.statusDescription.text = "판매중"
            self.dismiss(animated: false)
            
        }).disposed(by: disposeBag)
        
        //예약중 버튼 이벤트
        self.secondBtn.rx.tap.subscribe(onNext : {
            self.secondBtn.setImage(UIImage(named: "radio_checked_img"), for: .normal)
            
            self.changeItemStatus(itemId: self.currItem!.id, status: 2)
            print(" 선택 : 예약중")
            self.preVC?.statusDescription.text = "예약중"
            self.dismiss(animated: false)
            
        }).disposed(by: disposeBag)
        
        self.thirdBtn.rx.tap.subscribe(onNext : {
            self.thirdBtn.setImage(UIImage(named: "radio_checked_img"), for: .normal)
            
          //  self.preVC?.btnLabel.text = "신뢰도가 떨어져서"
            self.changeItemStatus(itemId: self.currItem!.id, status: 3)
            print(" 선택 : 판매완료")
            self.preVC?.statusDescription.text = "판매완료"
            self.dismiss(animated: false)
            
        }).disposed(by: disposeBag)
        
        
        
        
        
        
    }


}

extension ProductStatusDialogVC {
    //아이템 status -> End(3)
    func changeItemStatus(itemId : Int, status : Int) -> Void{
        Network.shared.apollo.perform(mutation: UpdateItemMutation(itemId: itemId,
                                                                   itemUpdate: .init(status: status,
                                                                                                     categoryId: nil,
                                                                                                     sPrice: nil,
                                                                                                     buyNow: nil,
                                                                                                     name: nil,
                                                                                                     title: nil,
                                                                                                     dueDate: nil,
                                                                                                     deliveryType: nil,
                                                                                                     sCondition: nil,
                                                                                                     aCondition: nil,
                                                                                                     detail: nil),
                                                                   description: nil)){ result in
                
                switch result {
                case .success(let data) :
                    print("success \(data)")
                    do {
                        print("delete result :  \(data)")
//
                        //return 대신
                        //emitter.onNext(.requestBidding)
                        //emitter.onCompleted()
                        self.dismiss(animated: true)
                       
                    }catch (let error) {
                        print("item load fail")
                        print(error.localizedDescription)
                    }
                    break
                case .failure(let error) :
                    print("error : \(error)")
                    //self.passed = false
                }
                
            }
            
    }
}
