//
//  BottomSheetViewController.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/05.
//

import Foundation
import UIKit

import RxSwift
import RxCocoa
import ReactorKit
class BottomSheetViewController : UIViewController, View{
    
    var disposeBag: DisposeBag  = DisposeBag()
    
    let minusBtn = UIButton()
    let plusBtn = UIButton()
    let cancelBtn = UIButton() //취소 버튼
    let biddingBtn = UIButton()// 입찰하기 버튼
    
    let priceLabel = UITextField() //300,000
    
    let inputStackView = UIStackView()
    let priceUnit = UILabel() // 원
    
    let inputNotice = UILabel() // ~이상 입력하셔야합니다.
    let warningNotice = UILabel() //가격을 다시 확인해주세요 .
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
        attribute()
        extendBind()
    }
    
    
    func layout(){
        
        [minusBtn, plusBtn, cancelBtn, biddingBtn,inputStackView, inputNotice, warningNotice]
            .forEach{self.view.addSubview($0)}
        
        minusBtn.snp.makeConstraints{
            $0.top.equalToSuperview().offset(48)
            $0.leading.equalToSuperview().offset(36)
            $0.width.height.equalTo(32)
        }
        plusBtn.snp.makeConstraints{
            $0.top.equalToSuperview().offset(48)
            $0.trailing.equalToSuperview().inset(36)
            $0.width.height.equalTo(32)
        }
        //취소 버튼
        cancelBtn.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(18)
            $0.bottom.equalToSuperview().inset(16)
            $0.width.equalTo(108)
            $0.height.equalTo(42)
        }
        //입찰하기 버튼
        biddingBtn.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(18)
            $0.bottom.equalToSuperview().inset(16)
            $0.width.equalTo(224)
            $0.height.equalTo(42)
        }
        
        inputStackView.snp.makeConstraints{
            $0.top.bottom.equalTo(minusBtn)
            $0.height.equalTo(24)
            $0.centerX.equalToSuperview()
        }
        inputStackView.addArrangedSubview(priceLabel)
        inputStackView.addArrangedSubview(priceUnit)
        inputStackView.spacing = 8
        //가격
        priceLabel.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalTo(priceUnit.snp.leading)
        }
        //원
        priceUnit.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.leading.equalTo(priceLabel.snp.trailing).offset(8)
            $0.trailing.equalToSuperview()
        }
        
        inputNotice.snp.makeConstraints{
            $0.top.equalTo(priceLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            
        }
        warningNotice.snp.makeConstraints{
            $0.top.equalTo(inputNotice.snp.bottom).offset(4)
            $0.centerX.equalToSuperview()
            
        }
    }
    
    func attribute(){
        plusBtn.setImage(UIImage(named: "plus_btn"), for: .normal)
        minusBtn.setImage(UIImage(named: "minus_btn"), for: .normal)
        cancelBtn.setImage(UIImage(named: "bid_cancel_btn"), for: .normal)
        biddingBtn.setImage(UIImage(named: "bidding_btn"), for: .normal)
        
        priceLabel.text = "300,000"
        priceLabel.font = .systemFont(ofSize: 24, weight: .bold)
        priceUnit.text = "원"
        priceUnit.font = .systemFont(ofSize: 24, weight: .medium)
        priceUnit.textColor = UIColor(cgColor: CGColor(red: 0.258, green: 0.258, blue: 0.258, alpha: 1))
        self.view.backgroundColor = .white
        self.view.layer.cornerRadius = 20
        
        inputNotice.text = "현재가인 0000000 이상 비딩하셔야합니다."
        inputNotice.font = .systemFont(ofSize: 10, weight: .medium)
        inputNotice.textColor = UIColor(cgColor: CGColor(red: 0.62, green: 0.62, blue: 0.62, alpha: 1))
        
        
        warningNotice.text = "가격을 다시 한 번 확인해주세요."
        warningNotice.isHidden = true
        warningNotice.font = .systemFont(ofSize: 10, weight: .medium)
        warningNotice.textColor = .red
    }
    
    func extendBind(){
        self.cancelBtn.rx.tap.subscribe(onNext : {
            print("취소 버튼 클릭")
            self.dismiss(animated: true, completion: {
                
            })
        })
    }
    
    func bind(reactor: BottomSheetReactor) {
        //Action
        
        self.rx.viewDidLoad
            .map{Reactor.Action.viewDidLoad}
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        //서버에 넘겨줄 입력값 감지
        var resultPrice = 0
        self.priceLabel.rx.text.map{
            Int($0?.description ?? "0") ?? 0
        }.subscribe(onNext : { result  in
            resultPrice = result
        }).disposed(by: disposeBag)
        
            //마이너스 버튼
        
            //플러스 버튼
        
            //입찰하기 버튼
        
        self.biddingBtn.rx.tap
            .filter{_ in reactor.initialState.item.sPrice ?? 9999999 < resultPrice} // 참인경우만 이벤트 발생. 지금 가격보다 높은 가격을 비딩했을 때만가능. 
            .map{
                Reactor.Action.tapBiddingBtn(
                id: reactor.initialState.item.id, price: resultPrice
            )}
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        
        self.biddingBtn.rx.tap.subscribe(onNext : {
            var nowPrice = reactor.initialState.item.cPrice
            var tryPrice = resultPrice
            if nowPrice ?? 999999 > tryPrice {
                self.warningNotice.isHidden = false
            }
        })
        
            //취소 버튼
        
        
        //Status
        
        reactor.state
            .map { $0.item.sPrice?.description ?? "" }
            .subscribe(onNext : { result in
                self.priceLabel.text = result
            }).disposed(by: disposeBag)
        
        reactor.state.map{
            $0.item.sPrice?.description ?? "0"
        }.subscribe(onNext : {result in
            self.inputNotice.text = "현재가인 \(result)원 이상 비딩해야합니다."
        })
        
        
    }
    
    
}
