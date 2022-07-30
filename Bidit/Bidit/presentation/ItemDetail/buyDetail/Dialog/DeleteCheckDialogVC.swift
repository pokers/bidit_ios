//
//  DeleteCheckDialogVC.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/16.
//

import Foundation
import UIKit
import RxSwift
//판매글을 삭제하시겠어요? 팝업뷰
class DeleteCheckDialogVC : UIViewController {
    var disposeBag: DisposeBag  = DisposeBag()
    private var containerView = UIView() //팝업 컨테이너
    private var popupTitleText = UILabel() //판매글을 삭제하시겠어요?
    private var deleteProductBtn = UIButton() //즉시 구매 채팅 보내기 버튼
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
        
        
        self.containerView.addSubview(deleteProductBtn)
        deleteProductBtn.snp.makeConstraints{
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
            $0.top.equalTo(deleteProductBtn.snp.bottom).offset(12)
        }
    }
    
    func attribute(){
        popupTitleText.text = "판매글을 삭제하시겠어요?"
        popupTitleText.font = .systemFont(ofSize: 20, weight: .medium)
        
        deleteProductBtn.setImage(UIImage(named: "upload_delete_btn_img"), for: .normal)
        cancelBtn.setImage(UIImage(named: "cancel_direct_btn"), for: .normal)
        
        //배경 어둡게
        self.view.backgroundColor = .black.withAlphaComponent(0.2)
    }
    
    /*
     삭제불가능 팝업창
     */
    private func setFailPopup(){
    
        let vc = FailDeleteDialogVC()
        vc.modalPresentationStyle = .overFullScreen
       
        // 보여주기
        present(vc, animated: false, completion: nil)
        
        
    }
    
    func bind(){
        //취소 버튼 이벤트
        self.cancelBtn.rx.tap.subscribe(onNext : {
            self.dismiss(animated: true)
        }).disposed(by: disposeBag)
        //삭제 버튼 이벤트
        self.deleteProductBtn.rx.tap
            .subscribe(onNext : {
                //현재 입찰 진행중이라면 상태를 바꿀 수 없음.
                if self.currItem?.status == 1 {
                    //판매글 삭제가 불가능합니다. 팝업창
                    self.setFailPopup()
                    self.dismiss(animated: false)
                }else {
                    self.requestDeleteItem(itemId: self.currItem!.id)
                }
                
            }).disposed(by: disposeBag)
    }
    
    
    
}
extension DeleteCheckDialogVC {
    //아이템 status -> Cancel(4)
    func requestDeleteItem(itemId : Int) -> Void{
        LoadingIndicator.showLoading()
        Network.shared.apollo.perform(mutation: UpdateItemMutation(itemId: itemId,
                                                                   itemUpdate: .init(status: 4,
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
