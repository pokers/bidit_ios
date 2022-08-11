//
//  ExitChatDialogVC.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/28.
//
//
import Foundation
import UIKit
import RxSwift
import SendBirdUIKit
//채팅방을 나가면 대화가 삭제되고
//복구할 수 없어요. 팝업뷰
class ExitChatDialogVC : UIViewController {
    var disposeBag: DisposeBag  = DisposeBag()
    private var containerView = UIView() //팝업 컨테이너
    private var popupTitleText = UILabel() //채팅방을 나가면 대화가 삭제되고 복구할 수 없어요.
    private var popupDescription = UILabel() //채팅방에서 나가시겠어요?
    private var exitChatBtn = UIButton() //채팅방 나가기
    private var cancelBtn = UIButton() // 취소
    var nowChannel :  SBDGroupChannel? = nil
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
            $0.height.equalTo(218)
            $0.leading.trailing.equalToSuperview().inset(18)
            $0.centerY.equalToSuperview()
        }
       
        self.containerView.addSubview(popupTitleText)
        popupTitleText.snp.makeConstraints{
            $0.top.equalToSuperview().offset(16)
            $0.centerX.equalToSuperview()
        }
        self.containerView.addSubview(popupDescription)
        popupDescription.snp.makeConstraints{
            $0.top.equalTo(popupTitleText.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
        
        
        self.containerView.addSubview(exitChatBtn)
        exitChatBtn.snp.makeConstraints{
            $0.width.equalTo(310)
            $0.height.equalTo(42)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(popupDescription.snp.bottom).offset(16)
        }
        
        self.containerView.addSubview(cancelBtn)
        cancelBtn.snp.makeConstraints{
            $0.width.equalTo(310)
            $0.height.equalTo(42)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(exitChatBtn.snp.bottom).offset(12)
        }
    }
    
    func attribute(){
        popupTitleText.text =
        """
        채팅방을 나가면 대화가 삭제되고
        복구할 수 없어요.
"""
        popupTitleText.font = .systemFont(ofSize: 20, weight: .medium)
        popupDescription.text = "채팅방을 나가면 대화가 삭제되고 복구할 수 없어요."
        popupDescription.font = .systemFont(ofSize: 14, weight: .medium)
        popupDescription.textColor = UIColor(red: 0.62, green: 0.62, blue: 0.62, alpha: 1)
        exitChatBtn.setImage(UIImage(named: "exit_chat_btn_img"), for: .normal)
        cancelBtn.setImage(UIImage(named: "cancel_chat_exit_btn_img"), for: .normal)
        
        //배경 어둡게
        self.view.backgroundColor = .black.withAlphaComponent(0.2)
    }
    
    /*
     삭제불가능 팝업창
     */
    private func setFailPopup(){
    
        let vc = FailDeleteDialogVC()
        vc.modalPresentationStyle = .fullScreen
       
        // 보여주기
        present(vc, animated: false, completion: nil)
        
        
    }
    
    func bind(){
        //취소 버튼 이벤트
        self.cancelBtn.rx.tap.subscribe(onNext : {
            self.dismiss(animated: true)
        }).disposed(by: disposeBag)
        //채팅방 나가기 이벤트
        self.exitChatBtn.rx.tap
            .subscribe(onNext : {
//                let vc = NotOpenDialogVC()
//                vc.modalPresentationStyle = .fullScreen
//
//                // 보여주기
//                self.present(vc, animated: false, completion: nil)
                
                self.nowChannel!.leave()
                print("채팅방 떠나기")
                self.dismiss(animated: true){
                    self.presentingViewController?.dismiss(animated: false)
                }
                
            }).disposed(by: disposeBag)
    }
    
    
    
}
extension ExitChatDialogVC {
    //아이템 status -> End(3)
    func requestDeleteItem(itemId : Int) -> Void{
        Network.shared.apollo.perform(mutation: UpdateItemMutation(itemId: itemId,
                                                                   itemUpdate: .init(status: 3,
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
