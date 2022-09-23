//
//  WithdrawalVC.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/12.
//

import Foundation
import UIKit
import RxSwift

//탈퇴하기
class WithdrawalVC : UIViewController {
    
    
    let firstLabel = UILabel() // 비딧을 탈퇴하시나요?
    let secondLabel = UILabel() // 탈퇴하기 버튼을 누르면 복구가 불가능하며, 7일 동안 가입이 제한됩니다.
    let description1 = UILabel()// 현재 계정으로 비딧이 제공하는 이벤트, 프로모션, 서비스, 혜택에 참여하실 수 없습니다.
    let description2 = UILabel()
    let description3 = UILabel()
    
    let reasonTitle = UILabel()
    let resonBtn = UIButton()
    let btnLabel = UILabel()
    let withdrawalBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        setNavigationBar()
        layout()
        
        bind()
    }
    

    func layout() {
        //비딧을 탈퇴하시나요?
        view.addSubview(firstLabel)
        firstLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(104)
            $0.leading.equalToSuperview().offset(18)
        }
        firstLabel.text = "BidiT을 탈퇴하시나요?"
        firstLabel.font = .systemFont(ofSize: 20, weight: .bold)
        
        // 탈퇴하기 버튼을 누르면 복구가 불가능하며, 7일 동안 가입이 제한됩니다.
        view.addSubview(secondLabel)
        secondLabel.snp.makeConstraints{
            $0.top.equalTo(firstLabel.snp.bottom).offset(32)
            $0.leading.equalToSuperview().offset(18)
        }
        secondLabel.numberOfLines = 2
        secondLabel.text =
                                                                """
                                                                탈퇴하기 버튼을 누르면 복구가 불가능하며, 7일 동안 가입
                                                                이 제한됩니다.
                                                                """
        
        
        
        secondLabel.font = .systemFont(ofSize: 14, weight: .medium)
        
        
        // 현재 계정으로 비딧이 제공하는 이벤트, 프로모션, 서비스, 혜택에 참여하실 수 없습니다.
        view.addSubview(description1)
        description1.snp.makeConstraints{
            $0.top.equalTo(secondLabel.snp.bottom).offset(12)
            $0.leading.equalToSuperview().offset(26)
        }
        description1.numberOfLines = 2
        description1.text =
                                                        """
                                                                ·현재 계정으로 비딧이 제공하는 이벤트, 프로모션, 서비스, 혜택에
                                                                참여하실 수 없습니다.
                                                                """
        
        
        
        description1.font = .systemFont(ofSize: 14, weight: .medium)
        
        
        // 모든 활동 정보가 삭제됩니다.
        view.addSubview(description2)
        description2.snp.makeConstraints{
            $0.top.equalTo(description1.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(26)
        }
        description2.text =
                                                        """
                                                                ·모든 활동 정보가 삭제됩니다.
                                                                """
        
        
        
        description2.font = .systemFont(ofSize: 14, weight: .medium)
        
        // 현재 계정으로 다시는 로그인할 수 없습니다.
        view.addSubview(description3)
        description3.snp.makeConstraints{
            $0.top.equalTo(description2.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(26)
        }
        description3.text =
                                                        """
                                                                ·현재 계정으로 다시는 로그인할 수 없습니다.
                                                                """
        
        
        
        description3.font = .systemFont(ofSize: 14, weight: .medium)
        
        //서비스에 만족을 드리지 못해 대단히 죄송합니다. 탈퇴 사유
        //를 남겨주시면 서비스 개선에 힘쓰겠습니다.
        view.addSubview(reasonTitle)
        reasonTitle.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(18)
            $0.top.equalTo(description3).offset(40)
        }
        reasonTitle.numberOfLines = 2
        reasonTitle.text =
                                                                """
                                                                        서비스에 만족을 드리지 못해 대단히 죄송합니다. 탈퇴 사유
                                                                        를 남겨주시면 서비스 개선에 힘쓰겠습니다.
                                                                        """
        reasonTitle.font = .systemFont(ofSize: 14, weight: .medium)
        view.addSubview(resonBtn)
        resonBtn.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(18)
            $0.top.equalTo(reasonTitle.snp.bottom).offset(12)
            $0.height.equalTo(44)
        }
        resonBtn.setImage(UIImage(named: "reason_btn_img"), for: .normal)
        
        resonBtn.addSubview(btnLabel)
        btnLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
        }
        btnLabel.text = "탈퇴 사유를 선택해주세요"
        
        self.view.addSubview(withdrawalBtn)
        withdrawalBtn.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(18)
            $0.height.equalTo(42)
            $0.bottom.equalToSuperview().inset(24)
        }
        withdrawalBtn.setImage(UIImage(named: "withdraw_btn_img"), for: .normal)
        
        
        
    }
    /*
     사유 선택 팝업창
     */
    private func setPopup(){
    
        let vc = ReasonOptionVC()
        vc.modalPresentationStyle = .overFullScreen
        vc.preVC = self
        // 보여주기
        present(vc, animated: false, completion: nil)
        
        
    }
    
    /*
      네비게이션 바
     */
    private func setNavigationBar(){
        //self.navigationItem.leftBarButtonItem = backButton
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = . gray
        self.navigationController?.navigationBar.isHidden = false
        self.title = "탈퇴하기"

        self.tabBarController?.tabBar.isHidden = true
    }
    
    
    func bind(){
        self.resonBtn.rx.tap
            .subscribe(onNext : {
                self.setPopup()
            })
        
        
        self.withdrawalBtn.rx.tap
            .subscribe(onNext: {
                //임시
                
                self.requestWithdrawal()
               
            })
    }
}

extension WithdrawalVC {
    func requestWithdrawal(){
        LoadingIndicator.showLoading()
        
            
        Network.shared.apollo.perform(mutation: UpdateMembershipMutation(status: MembershipStatus.init(rawValue: "INVALID")))
            { result in
                switch result {
                case .success(let data) :
                    print("success \(data)")
                    do {
                        print("탈퇴 result :  \(data)")

                        LoadingIndicator.hideLoading()
                        print("탈퇴 fail : \(data.errors)")
                       
    
                        let vc = CompleteWithdrawalVC()
                        
                        self.navigationController?.pushViewController(vc, animated: false)
                       
                    }catch (let error) {
                        print("탈퇴 fail")
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
