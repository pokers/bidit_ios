//
//  LoginViewController.swift
//  Bidit
//


import Foundation
import UIKit
import ReactorKit

class LoginViewController : UIViewController, View{
    var disposeBag: DisposeBag = DisposeBag()
    
    
    var logoImg = UIImageView()
    var openningText = UIImageView()
    var kakaoLoginBtn = UIButton()
    var naverLoginBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
        attribute()
        
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
            $0.bottom.equalToSuperview().inset(60)
            $0.leading.trailing.equalToSuperview().inset(18)
            $0.height.equalTo(48)
        }
        
        self.view.addSubview(kakaoLoginBtn)
        kakaoLoginBtn.snp.makeConstraints{
            $0.bottom.equalToSuperview().inset(124)
            $0.leading.trailing.equalToSuperview().inset(18)
            $0.height.equalTo(48)
        }
    }
    private func attribute(){
        self.view.backgroundColor = .black
        
        logoImg.image = UIImage(named: "logoImg")
        
        openningText.image = UIImage(named: "openLogo")
        
        kakaoLoginBtn.setImage(UIImage(named: "kakaoLoginBtn"), for: .normal)
        
        naverLoginBtn.setImage(UIImage(named: "naverLoginBtn"), for: .normal)
    }
    
    func bind(reactor: LoginReactor) {
        
    }
}
