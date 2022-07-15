//
//  DetailFilterVC.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/13.
//

import Foundation
import UIKit

class DetailFilter : UIViewController{
    
    //확인 버튼
    let checkBtn = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        
        self.view.addSubview(checkBtn)
        checkBtn.snp.makeConstraints{
            $0.trailing.leading.equalToSuperview()
            $0.bottom.equalToSuperview().inset(36)
            $0.width.equalTo(340)
            $0.height.equalTo(40)
        }
        checkBtn.setImage(UIImage(named: "complete_btn_img"), for: .normal)
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
        self.title = "상세필터"
        
        self.tabBarController?.tabBar.isHidden = true
    }
    
    
}
