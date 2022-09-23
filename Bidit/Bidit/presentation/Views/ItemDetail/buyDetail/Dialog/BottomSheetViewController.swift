//
//  BottomSheetViewController.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/05.
//

import Foundation
import UIKit

//import RxSwift
//import RxCocoa
import ReactorKit
//입찰하기 하단 시트 뷰
class BottomSheetViewController : UIViewController, View{
    typealias Reactor = BottomSheetReactor
    
    var preVC : ItemBuyDetailViewController? = nil
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
    
    
    override func viewWillAppear(_ animated: Bool) {
        cancelBtn.setImage(UIImage(named: "bid_cancel_btn"), for: .normal)
        biddingBtn.setImage(UIImage(named: "bidding_btn"), for: .normal)
        
    }
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
            $0.bottom.equalToSuperview().inset(32)
            $0.width.equalTo(108)
            $0.height.equalTo(42)
        }
        //입찰하기 버튼
        biddingBtn.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(18)
            $0.bottom.equalToSuperview().inset(32)
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
        priceLabel.keyboardType = .numberPad
        
        
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
    //가격 형식 쉼표찍기
    func decimalWon(value: Int) -> String{
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            let result = numberFormatter.string(from: NSNumber(value: value))!
            
            return result
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
//        self.rx.viewDidLoad
//            .map{Reactor.Action.viewDidLoad}
//            .bind(to: reactor.action)
//            .disposed(by: disposeBag)
        
        //서버에 넘겨줄 입력값 감지
        var resultPrice = 0
        self.priceLabel.rx.text.map{
            var text = $0?.description ?? "0"
            //text = text.components(separatedBy: [","]).joined() //쉼표 제거
            text = text.replacingOccurrences(of: ",", with: "")
            return Int(text.description ?? "0") ?? 0
            print("입력된 가격 : \(text)")
        }.subscribe(onNext : { result  in
            resultPrice = result
            
        }).disposed(by: disposeBag)
        
            //마이너스 버튼
        self.minusBtn.rx.tap
            .subscribe(onNext : {
                var text = self.priceLabel.text ?? "0"
                //text = text.components(separatedBy: [","]).joined() //쉼표 제거
                text = text.replacingOccurrences(of: ",", with: "")
                var initialPrice = Int( text ?? "0")
                if initialPrice! > 100{
                    initialPrice = initialPrice! - 100
                }
                let result = self.decimalWon(value: initialPrice!)
                self.priceLabel.text = result
            }).disposed(by: disposeBag)
        
            //플러스 버튼
        self.plusBtn.rx.tap
            .subscribe(onNext : {
                var text = self.priceLabel.text ?? "0"
//                text.components(separatedBy: ",").joined() //쉼표 제거
                text = text.replacingOccurrences(of: ",", with: "")
                var initialPrice = Int( text )
                
                
                initialPrice = initialPrice! + 100
                
                let result = self.decimalWon(value: initialPrice!)
                self.priceLabel.text = result
            }).disposed(by: disposeBag)
            //입찰하기 버튼
        
        self.biddingBtn.rx.tap
            .filter{_ in
                
                var text = self.priceLabel.text ?? "0" //현재 입력된 가격 텍스트
                text = text.replacingOccurrences(of: ",", with: "") //쉼표 제거
                var tryPrice = Int( text ) ?? 0
                var nowPrice = reactor.initialState.item.cPrice ?? reactor.initialState.item.sPrice
                
                
                return nowPrice! < tryPrice} // 참인경우만 이벤트 발생. 지금 가격보다 높은 가격을 비딩했을 때만가능.
            .map{
                var text = self.priceLabel.text ?? "0" //현재 입력된 가격 텍스트
                text = text.replacingOccurrences(of: ",", with: "") //쉼표 제거
                var tryPrice = Int( text ) ?? 0
                
                //즉구 가격 이상일때
                if tryPrice >= reactor.initialState.item.buyNow ?? 999999999{
                    tryPrice = reactor.initialState.item.buyNow!
                    print("즉시 구매 채팅")
                }
                
                return Reactor.Action.tapBiddingBtn(
                id: reactor.initialState.item.id, price: tryPrice
            )}
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        
        self.biddingBtn.rx.tap.subscribe(onNext : {
            var nowPrice = reactor.initialState.item.cPrice ?? reactor.initialState.item.sPrice
            var text = self.priceLabel.text ?? "0" //현재 입력된 가격 텍스트
            text = text.replacingOccurrences(of: ",", with: "") //쉼표 제거
            var tryPrice = Int( text ) ?? 0
            if nowPrice ?? 999999 > tryPrice {
                self.warningNotice.isHidden = false
            }else {
                self.warningNotice.isHidden = true
            }
        }).disposed(by: disposeBag)
        
            //취소 버튼
        
        
        //Status
        
        reactor.state
            .map { $0.item.cPrice?.description ?? $0.item.sPrice!.description}
            .subscribe(onNext : { result in
                
                self.priceLabel.text = self.decimalWon(value: Int(result)!)
            }).disposed(by: disposeBag)
        
        
        
        reactor.state.map{
            $0.item.cPrice?.description ?? $0.item.sPrice!.description
        }.subscribe(onNext : {result in
            self.inputNotice.text = "현재가인 \((self.decimalWon(value: Int(result)!))) 원 이상 비딩해야합니다."
        }).disposed(by: disposeBag)
        //이미 최고가 입찰했음. 알림
        reactor.state.map{$0.biddingError}
            .subscribe(onNext : {
                if $0 == true {
                    let vc = AlreadyTopBidDialogVC()
                    vc.preVC = self
                    vc.modalPresentationStyle = .fullScreen
                   
                    // 보여주기
                    self.present(vc, animated: false, completion: nil)
                }
            }).disposed(by: disposeBag)
        
        
        //비딩 성공시 화면 전환
        reactor.state
            .map { $0.biddingSuccess }
            .subscribe(onNext : {
                if $0 > 0{
                    // rootVC -> FirstVC -> SecondVC
                    
                    var text = $0.description //현재 입력된 가격 텍스트
                    text = text.replacingOccurrences(of: ",", with: "") //쉼표 제거
                    var tryPrice = Int( text ) ?? 0
                    guard let pvc = self.presentingViewController
                    else {
                        print("no navigation")
                        return}

                    self.dismiss(animated: true) {
                        var nextVC =  CompleteBiddingViewController()
                        nextVC.preVC = self.preVC
                        nextVC.reactor = CompleteBiddingReactor(price: tryPrice )
                        pvc.modalPresentationStyle = .fullScreen
                        pvc.present( nextVC, animated: true, completion: nil)
                        
                    }
                }
            }).disposed(by: disposeBag)
        
        
    }
    
    
}
