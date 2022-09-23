//
//  DetailFilterVC.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/13.
//

import Foundation
import UIKit
import ReactorKit
//import RxSwift

//상세필터(글 등록)
class DetailFilterVC : UIViewController{
    
    var disposeBag: DisposeBag  = DisposeBag()
    
    var preVC : UploadProductViewController? = nil
    //확인 버튼
    let checkBtn = UIButton()
    //거래 방법
    let wayTitle = UILabel()
    let postBtn = UIButton() // 택배 거래 버튼
    let directBtn = UIButton() //직거래 버튼
    
    let line1 = UIView()
    
    //사용기간
    let periodTitle = UILabel()
    let periodField = UITextField()// 최소기간
    let periodUnitLabel = UILabel() // 개월
    
    
    //필터 설정 정보
    var availPost = false
    var availDirect = false
    var periodResult = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        layout()
        self.view.addSubview(checkBtn)
        checkBtn.snp.makeConstraints{
            $0.trailing.leading.equalToSuperview()
            $0.bottom.equalToSuperview().inset(36)
            $0.width.equalTo(340)
            $0.height.equalTo(40)
        }
        checkBtn.setImage(UIImage(named: "complete_btn_img"), for: .normal)
        bind()
    }
    /*
     뷰 컨 네비게이션바 설정.
     */
    private func setNavigationBar(){
        self.view.backgroundColor = .systemBackground
        //self.navigationItem.leftBarButtonItem = backButton
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = . gray
        self.navigationController?.navigationBar.isHidden = false

        self.navigationController?.isNavigationBarHidden = false
        self.title = "상세필터"
        self.tabBarController?.tabBar.isHidden = true
    }
    
    func layout(){
        //거래 방법
        self.view.addSubview(wayTitle)
        wayTitle.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(18)
            $0.top.equalToSuperview().offset(110)
        }
        wayTitle.text = "거래 방법"
        
        wayTitle.font = .systemFont(ofSize: 12, weight: .medium)
        self.view.addSubview(postBtn)
        self.view.addSubview(directBtn)
        postBtn.snp.makeConstraints{// 택배거래
            $0.centerY.equalTo(wayTitle.snp.centerY)
            $0.leading.equalTo(wayTitle.snp.trailing).offset(37)
            $0.height.equalTo(40)
            $0.width.equalTo(118)
        }
        postBtn.setImage(UIImage(named: "post_btn_uncheck"), for: .normal)
        
        directBtn.snp.makeConstraints{//직거래
            $0.centerY.equalTo(wayTitle.snp.centerY)
            $0.leading.equalTo(postBtn.snp.trailing).offset(20)
            $0.height.equalTo(40)
            $0.width.equalTo(118)
        }
        directBtn.setImage(UIImage(named: "direct_btn_uncheck"), for: .normal)
        
        //Line1
        self.view.addSubview(line1)
        line1.snp.makeConstraints{
            $0.trailing.leading.equalToSuperview()
            $0.height.equalTo(1)
            $0.top.equalTo(postBtn.snp.bottom).offset(20)
        }
        line1.backgroundColor = UIColor(red: 0.962, green: 0.962, blue: 0.962, alpha: 1)
        
        //사용기간
        self.view.addSubview(periodTitle)
        periodTitle.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(18)
            $0.top.equalTo(line1.snp.bottom).offset(34)
        }
        periodTitle.text = "사용기간"
        periodTitle.font = .systemFont(ofSize: 12, weight: .medium)
        self.view.addSubview(periodField)
        periodField.snp.makeConstraints{
            $0.leading.equalTo(periodTitle.snp.leading).offset(84)
            $0.centerY.equalTo(periodTitle.snp.centerY)
            $0.height.equalTo(40)
            $0.trailing.equalToSuperview().inset(18)
        }
        periodField.addLeftPadding() //필드 좌측 여백 추가.
        periodField.font = .systemFont(ofSize: 12, weight: .regular)
        periodField.keyboardType = .numberPad
        
        periodField.layer.cornerRadius = 4
        periodField.layer.borderColor = UIColor(red: 0.741, green: 0.741, blue: 0.741, alpha: 1).cgColor
        periodField.layer.borderWidth =  0.5
        periodField.placeholder = "최소기간"
        
        self.view.addSubview(periodUnitLabel)
        periodUnitLabel.snp.makeConstraints{
            $0.trailing.equalTo(periodField.snp.trailing).inset(20)
            $0.centerY.equalTo(periodField.snp.centerY)
        }
        periodUnitLabel.text = "개월"
        periodUnitLabel.font = .systemFont(ofSize: 12, weight: .regular)
        
    }
    
    
    func bind(){
        //택배거래 버튼 이벤트
        self.postBtn.rx.tap
            .subscribe(onNext : {
                if self.availPost == false{
                    self.availPost = true
                    self.postBtn.setImage(UIImage(named: "post_btn_checked"), for: .normal)
                    print("post 활성화")
                }else if self.availPost == true{
                    self.availPost = false
                    self.postBtn.setImage(UIImage(named: "post_btn_uncheck"), for: .normal)
                    print("post 비활성화")
                }
            }).disposed(by: disposeBag)
        
        self.directBtn.rx.tap
            .subscribe(onNext : {
                if self.availDirect == false{
                    self.availDirect = true
                    self.directBtn.setImage(UIImage(named: "direct_btn_checked"), for: .normal)
                }else{
                    self.availDirect = false
                    self.directBtn.setImage(UIImage(named: "direct_btn_uncheck"), for: .normal)
                }
            }).disposed(by: disposeBag)
        
        self.periodField.rx.text.subscribe(onNext : { text in
            self.periodResult = Int(text!.description) ?? 0
        }).disposed(by: disposeBag)
        
        self.rx.viewWillDisappear.subscribe(onNext : {_ in
            var type = 0
            if self.availDirect == true && self.availPost == true {
                type = 2
            }else if self.availPost == false && self.availDirect == true{
                type = 0
            }else if self.availPost == true && self.availDirect == false{
                type = 1
            }
            self.preVC?.deliveryType = type

        }).disposed(by: disposeBag)
        
        self.checkBtn.rx.tap
            .subscribe(onNext : {
                self.dismiss(animated: false)
            }).disposed(by: disposeBag)
        
    }
    
    
}
