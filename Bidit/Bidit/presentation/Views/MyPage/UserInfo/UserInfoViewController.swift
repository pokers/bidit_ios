//
//  UserInfoViewController.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/10.
//

import Foundation
import UIKit
import ReactorKit
//계정 기본 정보
class UserInfoViewController : UIViewController, View{
    
    //이메일
    let emailContainer = UIView()
    let emailTitle = UILabel()
    let emailText = UILabel()
    
    let separator1 = UIView()
    //이름
    let nameContainer = UIView()
    let nameTitle = UILabel()
    let nameText = UILabel()
    
    let separator2 = UIView()
    //연락처
    let phoneContainer = UIView()
    let phoneTitle = UILabel()
    let phoneText = UILabel()
    
    let separator3 = UIView()
    //SNS연동
    let snsContainer = UIView()
    let snsTitle = UILabel()
    let snsImg = UIImageView()
    
    let separator4 = UIView()
    //탈퇴하기
    let withdrawBtn = UIButton()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var disposeBag: DisposeBag  = DisposeBag()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        setNavigationBar()
        layout()
    }
    
    private func layout(){
        //이메일
        view.addSubview(emailContainer)
        emailContainer.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalToSuperview().offset(80)
            $0.height.equalTo(57)
            $0.width.equalToSuperview()
        }
        emailContainer.addSubview(emailText)
        emailContainer.addSubview(emailTitle)
        emailTitle.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(18)
            
        }
        emailTitle.text = "이메일"
        emailText.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(18)
        }
        emailText.text = "gmail@gmail.com"
        
        //줄1
        view.addSubview(separator1)
        separator1.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(emailContainer.snp.bottom)
            $0.height.equalTo(1)
            $0.width.equalToSuperview()
        }
        separator1.backgroundColor = UIColor(red: 0.962, green: 0.962, blue: 0.962, alpha: 1)
        
        
        //이름
        view.addSubview(nameContainer)
        nameContainer.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(emailContainer.snp.bottom)
            $0.height.equalTo(57)
            $0.width.equalToSuperview()
        }
        nameContainer.addSubview(nameText)
        nameContainer.addSubview(nameTitle)
        nameTitle.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(18)
            
        }
        nameTitle.text = "이름"
        nameText.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(18)
        }
        nameText.text = "홍길동"
        
        //줄2
        view.addSubview(separator2)
        separator2.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(nameContainer.snp.bottom)
            $0.height.equalTo(1)
            $0.width.equalToSuperview()
        }
        separator2.backgroundColor = UIColor(red: 0.962, green: 0.962, blue: 0.962, alpha: 1)
        
        
        //연락처
        view.addSubview(phoneContainer)
        phoneContainer.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(separator2.snp.bottom)
            $0.height.equalTo(57)
            $0.width.equalToSuperview()
        }
        phoneContainer.addSubview(phoneText)
        phoneContainer.addSubview(phoneTitle)
        phoneTitle.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(18)
            
        }
        phoneTitle.text = "연락처"
        phoneText.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(18)
        }
        phoneText.text = "010-0000-0000"
        
        //줄3
        view.addSubview(separator3)
        separator3.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(phoneContainer.snp.bottom)
            $0.height.equalTo(1)
            $0.width.equalToSuperview()
        }
        separator3.backgroundColor = UIColor(red: 0.962, green: 0.962, blue: 0.962, alpha: 1)
        
        //SNS연동
        view.addSubview(snsContainer)
        snsContainer.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(separator3.snp.bottom)
            $0.height.equalTo(57)
            $0.width.equalToSuperview()
        }
        snsContainer.addSubview(snsImg)
        snsContainer.addSubview(snsTitle)
        snsTitle.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(18)
            
        }
        snsTitle.text = "SNS 연동"
        snsImg.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(18)
            $0.width.height.equalTo(24)
        }
        snsImg.image = UIImage(systemName: "chevron.left")
        
        var nowLoginState = UserDefaults.standard.string(forKey: "LoginState")
        
        if nowLoginState!.elementsEqual("kakao"){
            self.snsImg.image = UIImage(named: "kakao_sns_img")//카카오
        }else if nowLoginState!.elementsEqual("apple"){
            self.snsImg.image = UIImage(named: "apple_sns_img")
        }
        
        //줄4
        view.addSubview(separator4)
        separator4.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(snsContainer.snp.bottom)
            $0.height.equalTo(1)
            $0.width.equalToSuperview()
        }
        separator4.backgroundColor = UIColor(red: 0.962, green: 0.962, blue: 0.962, alpha: 1)
        //탈퇴하기
        view.addSubview(withdrawBtn)
        withdrawBtn.snp.makeConstraints{
            $0.top.equalTo(separator4.snp.bottom)
            $0.leading.equalToSuperview()
            $0.width.equalTo(100)
            $0.height.equalTo(40)
        }
        withdrawBtn.setTitle("탈퇴하기", for: .normal)
        withdrawBtn.setTitleColor(.black, for: .normal)
        
    }
    
    
    /*
     계정 기본 정보
     */
    private func setNavigationBar(){
        //self.navigationItem.leftBarButtonItem = backButton
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = . gray
        self.navigationController?.navigationBar.isHidden = false
        self.title = "계정 기본 정보"

        self.tabBarController?.tabBar.isHidden = true
    }
    
    
    func bind(reactor: UserInfoReactor) {
        
        
        //탈퇴 버튼
        self.withdrawBtn.rx.tap
            .subscribe(onNext : {
                let vc = WithdrawalVC()
                //let reactor =
                //vc.reactor = reactor
               // vc.bind(reactor: listReactor)
                self.navigationController?.pushViewController(vc, animated: true)
            })
//
        
        self.rx.viewDidLoad
            .map{Reactor.Action.viewDidLoad}
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
        
        reactor.state
            .map { $0.user }
            .subscribe(onNext : { user in
                
                if user?.kakaoAccount != nil{
                    self.nameText.text = user?.kakaoAccount?.name
                    self.emailText.text = user?.kakaoAccount?.email
                    self.phoneText.text = user?.kakaoAccount?.phoneNumber
                }else if user?.appleAccount != nil{
                    self.nameText.text = "없음"
                    self.emailText.text = user?.appleAccount?.email
                    self.phoneText.text = "없음"
                }
                
                //현재 로그인 SNS확인
                //현재 로그인 SNS확인
                
                var nowLoginState = UserDefaults.standard.string(forKey: "LoginState")
                
                if nowLoginState!.elementsEqual("kakao"){
                    self.snsImg.image = UIImage(named: "kakao_sns_img")//카카오
                }else if nowLoginState!.elementsEqual("apple"){
                    self.snsImg.image = UIImage(named: "apple_sns_img")
                }
                
//                if user?.kakaoAccount != nil{
//                    
//                }else if user?.appleAccount != nil{
//                    
//                }
                
                
                
            })
            .disposed(by: self.disposeBag)
    }
    

    
    
}
