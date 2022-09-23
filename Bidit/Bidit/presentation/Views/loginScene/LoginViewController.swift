//
//  LoginViewController.swift
//  Bidit
//


import Foundation
import UIKit
import ReactorKit

import AuthenticationServices

class LoginViewController : BaseViewController, View{
    typealias Reactor = LoginReactor
    
    // MARK: UI Compontnts
    var logoImg = UIImageView(image: UIImage(named:"logoImg"))
    var openningText = UIImageView(image: UIImage(named: "openLogo"))
    var kakaoLoginBtn = UIButton().then {
        $0.setImage(UIImage(named: "kakaoLoginBtn"), for: .normal)
    }
    var naverLoginBtn = UIButton().then {
        $0.setImage(UIImage(named: "naverLoginBtn"), for: .normal)
    }
    var appleLoginBtn = UIButton().then {
        $0.setImage(UIImage(named: "appleLoginBtn"), for: .normal)
    }
    
    // MARK: constructor
    init(reactor: Reactor){
        defer {
            self.reactor = reactor
        }
        super.init()
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        self.addSubViews()
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func setupConstraints(){
        log.info("Enter")
        
        logoImg.snp.makeConstraints{
            $0.top.equalToSuperview().offset(35)
            $0.leading.equalToSuperview().offset(18)
            $0.width.equalTo(149)
            $0.height.equalTo(46)
        }
        
        openningText.snp.makeConstraints{
            $0.top.equalTo(logoImg.snp.bottom).offset(120)
            $0.leading.equalToSuperview().offset(18)
            $0.width.equalTo(262)
            $0.height.equalTo(174)
            
        }

        naverLoginBtn.snp.makeConstraints{
            $0.bottom.equalToSuperview().inset(124)
            $0.leading.trailing.equalToSuperview().inset(18)
            $0.height.equalTo(0)
        }
        
        kakaoLoginBtn.snp.makeConstraints{
            $0.bottom.equalToSuperview().inset(185)
            $0.leading.trailing.equalToSuperview().inset(18)
            $0.height.equalTo(48)
        }
        
        appleLoginBtn.snp.makeConstraints{
            $0.bottom.equalToSuperview().inset(124)
            $0.leading.trailing.equalToSuperview().inset(18)
            $0.height.equalTo(48)
        }
        log.info("Leave")
    }
    
    private func addSubViews(){
        self.view.addSubview(logoImg)
        self.view.addSubview(openningText)
        self.view.addSubview(naverLoginBtn)
        self.view.addSubview(kakaoLoginBtn)
        self.view.addSubview(appleLoginBtn)
    }
    
    // MARK: RX - bind
    func bind(reactor: LoginReactor) {
        self.rx.viewDidLoad
            .map{Reactor.Action.isKakaoAuth}
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
        
        // Tab Button : kakao login
        self.kakaoLoginBtn.rx.tap
            .map{Reactor.Action.tapKakaoAuth}
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
        
        // Tab Button : apple login
        self.appleLoginBtn.rx.tap
            .map{reactor.setViewController(viewController: self)}
            .map{Reactor.Action.tapAppleAuth}
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
        
        // State
        reactor.state
            .map { $0.authState }
            .distinctUntilChanged()
            .filter { $0 == AuthState.authenticated }
            .subscribe(onNext : { [weak self] authState in
                log.info("authState : \(String(describing: authState))")
                switch authState {
                case .unauthenticated:
                    log.error("authState : it should not called")
                case .authenticated:
                    log.info("authenticated -> try to getMe for login of bidit server")
                    self?.reactor?.action.onNext(Reactor.Action.getMe)
                }
            })
            .disposed(by: self.disposeBag)

        reactor.state
            .map { $0.loginState }
            .distinctUntilChanged()
            .subscribe(onNext : { [weak self] loginState in
                log.info("authState : \(String(describing: loginState))")
                switch loginState {
                case .logout:
                    log.error("logout state")
                case .login:
                    self?.movingHomeView()
                case .unregistered:
                    log.info("should signup to bidit server")
                    self?.reactor?.action.onNext(Reactor.Action.addUser)
                }
            })
            .disposed(by: self.disposeBag)

    }
    
    func movingHomeView(){
        print("movingHomeView")
        let vc = TabbarController()
        vc.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        self.view.backgroundColor = .systemBackground
        self.dismiss(animated: true) {
            self.present(vc, animated: true, completion: nil)
        }
    }
   
}
