//
//  ProfileChangeVC.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/11.
//

import Foundation
import UIKit
import ReactorKit

class ProfileChangeVC : UIViewController, View{
    
    let profileImg = UIImageView()
    let imgButton  = UIButton()
    let nameField = UITextField()
    
    let checkBtn = UIButton()
    
    
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
        self.view.addSubview(profileImg)
        profileImg.snp.makeConstraints{
            $0.top.equalToSuperview().offset(104)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(128)
            
        }
        profileImg.image = UIImage(named: "profile_basic_img")
        self.profileImg.addSubview(imgButton)
        imgButton.snp.makeConstraints{
            $0.bottom.equalToSuperview().inset(6)
            $0.trailing.equalToSuperview().inset(6)
        }
        imgButton.setImage(UIImage(named: "profile_camera_btn_img"), for: .normal)
        
        self.view.addSubview(nameField)
        nameField.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(18)
            $0.height.equalTo(44)
            $0.top.equalTo(profileImg.snp.bottom).offset(32)
            
        }
        nameField.placeholder = "닉네임을 작성해주세요 (8자 이하)"
        nameField.layer.borderWidth = 1
        nameField.layer.borderColor = UIColor(red: 0.741, green: 0.741, blue: 0.741, alpha: 1).cgColor
        nameField.textAlignment = .center
        nameField.font = .systemFont(ofSize: 14, weight: .regular)
        
        
        self.view.addSubview(checkBtn)
        checkBtn.snp.makeConstraints{
            $0.bottom.equalToSuperview().inset(24)
            $0.leading.trailing.equalToSuperview().inset(18)
            
        }
        checkBtn.setImage(UIImage(named: "check_btn_profile_img"), for: .normal)
    }
    
    
    func bind(reactor: ProfileChangeReactor) {
        
    }
    
    /*
      네비게이션 바
     */
    private func setNavigationBar(){
        //self.navigationItem.leftBarButtonItem = backButton
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = . gray
        self.navigationController?.navigationBar.isHidden = false
        self.title = "프로필 수정"

        self.tabBarController?.tabBar.isHidden = true
    }
    

    
    
}
