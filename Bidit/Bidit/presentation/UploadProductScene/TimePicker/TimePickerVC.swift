//
//  TimePickerVC.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/10.
//

import Foundation
import UIKit
class TimePickerVC : UIViewController {
    
    let timePicker = UIDatePicker()
    let pickerView = UIPickerView()
    
    //확인 버튼
    let checkBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        timePicker.datePickerMode = .time
        
        
//        if #available(iOS 13.4, *) {
//            timePicker.preferredDatePickerStyle = .wheels
//        } else {
//            // Fallback on earlier versions
//            timePicker.datePickerStyle = .wheels
//
//        }
        
        
    }
    
    func layout(){
        
        self.view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 20
        view.addSubview(timePicker)
        
        timePicker.snp.makeConstraints{
            $0.top.equalToSuperview().offset(60)
            $0.leading.trailing.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(80)
            
        }
        
        
        self.view.addSubview(checkBtn)
        checkBtn.snp.makeConstraints{
            $0.trailing.leading.equalToSuperview()
            $0.top.equalTo(timePicker.snp.bottom).offset(16)
            $0.width.equalTo(340)
            $0.height.equalTo(40)
        }
        checkBtn.setImage(UIImage(named: "calendar_check_btn_img"), for: .normal)
    
    }
}
