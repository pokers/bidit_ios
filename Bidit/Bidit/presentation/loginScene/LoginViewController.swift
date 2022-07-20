//
//  LoginViewController.swift
//  Bidit
//


import Foundation
import UIKit
import ReactorKit
import RxCocoa
import RxSwift

import AuthenticationServices

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
        
//        self.rx.viewDidLoad
//              .mapVoid()
//              .map(Reactor.Action.viewDidLoad)
//              .bind(to: reactor.action)
//              .disposed(by: self.disposeBag)
        
        //애플 로그인
        self.appleLoginBtn.rx.tap
            .asObservable()
            .subscribe(onNext : {
                let request = ASAuthorizationAppleIDProvider().createRequest()
                request.requestedScopes = [.fullName, .email]
                UserDefaults.standard.set("apple", forKey: "LoginState")

                let controller = ASAuthorizationController(authorizationRequests: [request])
                controller.delegate = self as? ASAuthorizationControllerDelegate
                controller.presentationContextProvider = self as? ASAuthorizationControllerPresentationContextProviding
                controller.performRequests()
            })
              
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
//애플로그인
extension LoginViewController: ASAuthorizationControllerDelegate {
    // 성공 후 동작
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let credential = authorization.credential as? ASAuthorizationAppleIDCredential {

            let idToken = credential.identityToken!
            let tokeStr = String(data: idToken, encoding: .utf8)
            guard let code = credential.authorizationCode else { return }
                        let codeStr = String(data: code, encoding: .utf8)
                        print(codeStr)

                        let user = credential.user
                        print(user)
            let accessToken = String(data: idToken, encoding: .ascii) ?? ""
            UserDefaults.standard.set("apple", forKey: "LoginState")
            let keyChain = TokenManager.sharedKeyChain
            keyChain.set((accessToken),forKey: "apple")
            //서버 요청
            
            
            //애플에서 토큰을 받은 후 me 호출
            Network.shared.apollo.fetch(query: MeQuery()){result in
                switch result {
                case .success(let data) :
                    
                    //푸시 토큰 갱신
                    //self.updatePushToken()
                    //me 요청이 성공하면 홈화면으로 이동.
                    self.movingHomeView()
                    break
                case .failure(let error) :
                    print("로그인 실패 error : \(error)")
                    //self.passed = false
                    
                    //안된다면 가입 addUser호출
                    Network.shared.apollo.perform(mutation: MyQueryMutation()){result in
                        switch result {
                        case .success(let data) :
                            print("success \(data)")
                            //현재 로그인 상태 갱신 (애플, 카카오 등)
                            UserDefaults.standard.set("apple", forKey: "LoginState")
                            //푸시 토큰 갱신
                            //self.updatePushToken()
                            //홈화면 이동
                            let vc = TabbarController()
                            vc.modalPresentationStyle = UIModalPresentationStyle.fullScreen
                            self.view.backgroundColor = .systemBackground
                            self.dismiss(animated: true) {
                                self.present(vc, animated: true, completion: nil)
                            }

                            
                            break
                        case .failure(let error) :
                            print("error : \(error)")
                            //self.passed = false
                        }
                    }
                    
                }
            }
        }
    }

    // 실패 후 동작
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("로그인 error")
    }
    
    
}
