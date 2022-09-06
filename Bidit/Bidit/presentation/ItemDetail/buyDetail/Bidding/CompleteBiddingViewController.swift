//
//  CompleteBiddingViewController.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/05.
//

import Foundation
import UIKit
import ReactorKit

//입찰 후 화면
class CompleteBiddingViewController : UIViewController, View{
    
    var preVC : ItemBuyDetailViewController? = nil
    
    let completeImg = UIImageView()
    let priceText = UILabel()
    let completeText = UILabel()
    let descriptionText = UILabel()
    
    let cancelButton = UIButton()// 취소 버튼
    let checkButton = UIButton() // 확인 버튼
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var disposeBag: DisposeBag  = DisposeBag()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
        attribute()
        cancelButton.isHidden = true //기능 미구현
        self.view.backgroundColor = .white
    }
    
    //가격 형식 쉼표찍기
    func decimalWon(value: Int) -> String{
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            let result = numberFormatter.string(from: NSNumber(value: value))!
            
            return result
        }
    
    
    func bind(reactor: CompleteBiddingReactor) {
        // 확인버튼 이벤트 (홈화면으로 돌아가기)
        self.checkButton.rx.tap
            .subscribe(onNext : {

               

                self.dismiss(animated: true) {
                    self.preVC?.navigationController?.popViewController(animated: false)
                    
                  //pvc.present(CompleteBiddingViewController(), animated: true, completion: nil)
                }
            }).disposed(by: disposeBag)
        
        self.cancelButton.rx.tap
            .subscribe(onNext : {
                self.setBidCancelPopup()
            })
        
        self.reactor?.state.map{$0.biddingPrice}
            .subscribe(onNext : {
                var result = self.decimalWon(value: $0)
                self.priceText.text = "\(result)원을"
                
                
            }).disposed(by: disposeBag)
        
        
    }
    

    private func layout(){
        [completeImg, priceText, completeText, descriptionText, cancelButton, checkButton].forEach{
            self.view.addSubview($0)
        }
        
        completeImg.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(120)
            $0.top.equalToSuperview().offset(210)
        }
        
        priceText.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(completeImg.snp.bottom).offset(38)
        }
        
        completeText.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(priceText.snp.bottom).offset(8)
        }
        descriptionText.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(completeText.snp.bottom).offset(16)
        }
        
        checkButton.snp.makeConstraints{
            $0.bottom.equalToSuperview().inset(32)
            $0.trailing.equalToSuperview().inset(16)
            $0.leading.equalToSuperview().offset(16)
            //$0.width.equalTo(224)
            $0.height.equalTo(42)
        }
        
        cancelButton.snp.makeConstraints{
            $0.bottom.equalToSuperview().inset(32)
            $0.leading.equalToSuperview().offset(16)
            $0.width.equalTo(108)
            $0.height.equalTo(42)
        }
        
    }
    private func attribute(){
        completeImg.image = UIImage(named: "complete_bidding_logo_astronaut_img")
        var result = self.decimalWon(value: reactor?.initialState.biddingPrice ?? 0) 
        self.priceText.text = "\(result)원을"
        self.priceText.font = .systemFont(ofSize: 24, weight: .bold)
        completeText.text = "입찰 완료했습니다."
        completeText.font = .systemFont(ofSize: 24, weight: .medium)
        descriptionText.text = "최종 낙찰되면 알림이 가니, 알림을 확인해주세요!"
        descriptionText.font = .systemFont(ofSize: 12, weight: .medium)
        descriptionText.textColor = UIColor(red: 0.62, green: 0.62, blue: 0.62, alpha: 1)
        
        cancelButton.setImage(UIImage(named: "cancel_bidding_long_btn_img"), for: .normal)
        checkButton.setImage(UIImage(named: "check_blue_btn_long_img"), for: .normal)
        
    }
    
    /*
     입찰 취소하기 팝업창(취소, 입찰 취소하기)
     */
    private func setBidCancelPopup(){
    
        let vc = CancelBidDialogVC()
        vc.modalPresentationStyle = .fullScreen
       
        // 보여주기
        present(vc, animated: false, completion: nil)
        
        
    }
    
    
}
