//
//  LoginViewController.swift
//  Bidit
//


import Foundation
import UIKit
import ReactorKit
import RxCocoa
import RxSwift

class LoginViewController : UIViewController, View{
    var disposeBag: DisposeBag = DisposeBag()
    
    
    var logoImg = UIImageView()
    var openningText = UIImageView()
    var kakaoLoginBtn = UIButton()
    var naverLoginBtn = UIButton()
    var appleLoginBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
        attribute()
        extendBind()
        
    }
    
    


    private func layout(){
        self.view.addSubview(logoImg)
        logoImg.snp.makeConstraints{
            $0.top.equalToSuperview().offset(35)
            $0.leading.equalToSuperview().offset(18)
            $0.width.equalTo(149)
            $0.height.equalTo(46)
        }
        
        self.view.addSubview(openningText)
        openningText.snp.makeConstraints{
            $0.top.equalTo(logoImg.snp.bottom).offset(120)
            $0.leading.equalToSuperview().offset(18)
            $0.width.equalTo(262)
            $0.height.equalTo(174)
            
        }
        
        
        
        self.view.addSubview(naverLoginBtn)
        naverLoginBtn.snp.makeConstraints{
            $0.bottom.equalToSuperview().inset(124)
            $0.leading.trailing.equalToSuperview().inset(18)
            $0.height.equalTo(48)
        }
        
        self.view.addSubview(kakaoLoginBtn)
        kakaoLoginBtn.snp.makeConstraints{
            $0.bottom.equalToSuperview().inset(185)
            $0.leading.trailing.equalToSuperview().inset(18)
            $0.height.equalTo(48)
        }
        
        self.view.addSubview(appleLoginBtn)
        appleLoginBtn.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(18)
            $0.height.equalTo(48)
            $0.bottom.equalToSuperview().inset(60)
        }
    }
    private func attribute(){
        self.view.backgroundColor = .black
        
        logoImg.image = UIImage(named: "logoImg")
        
        openningText.image = UIImage(named: "openLogo")
        
        kakaoLoginBtn.setImage(UIImage(named: "kakaoLoginBtn"), for: .normal)
        
        naverLoginBtn.setImage(UIImage(named: "naverLoginBtn"), for: .normal)
        
        appleLoginBtn.setImage(UIImage(named: "appleLoginBtn"), for: .normal)
    }
    
    
    func bind(reactor: LoginReactor) {
        //Action
        self.kakaoLoginBtn.rx.tap
              .mapVoid()
              .map(Reactor.Action.tapKakaoLoginBtn)
              .bind(to: reactor.action)
              .disposed(by: self.disposeBag)
        
//        reactor.state
//            .bind(to: collectionView.rx.scrollsToTop)
              
            //State
        reactor.state
            .map { $0.loginPassed }
            .subscribe(onNext : { loginPassed in
                switch loginPassed {
                case true :
                    print("인증 성공 화면 넘어가기")
//                    let vc = TabbarController()
//                    self.present(vc, animated: true)
                    
                    
                     //카카오 로그인 실행
                    
                case false:
                    print("not yet")
                
                }
                
            })
            .disposed(by: self.disposeBag)
        
        
    }
    
    func extendBind(){
        reactor?.finalPassed.asDriver(onErrorJustReturn: false)
            .drive(onNext :{[weak self] status in
                guard let self = self else  { return }
                self.movingHomeView()
            }).disposed(by: disposeBag)
    }
    
    func movingHomeView(){
        print("movingHomeView")
        let vc = TabbarController()
        vc.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        self.view.backgroundColor = .systemBackground
        self.dismiss(animated: true) {
            self.present(vc, animated: true, completion: nil)
        }
        
        //self.present(vc, animated: true)
    }
   
}
