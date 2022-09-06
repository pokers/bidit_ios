//
//  ModifyTimePickerVC.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/17.
//

import Foundation
import UIKit
import RxSwift

class ModifyTimePickerVC : UIViewController {
    
    
    let disposeBag = DisposeBag()
    let ampmPicker = UIPickerView() //AM PM
    let hourPicker = UIPickerView() //시
    let minutePicker = UIPickerView() //분
    
    let colon = UIImageView()
    var preVC : ModifyProductVC? = nil
    var selectedAMPM = 0
    var selectedHour = 0
    var selectedMinute = 0
    
    // 피커 뷰에 들어갈 내용 리스트
    var ampmList = ["오전", "오후"]
    var hourList = ["01", "02","03","04","05","06","07","08","09","10","11","12"]
    var minuteList = ["00", "10", "20", "30","40", "50"]
       
    //확인 버튼
    let checkBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        
        ampmPicker.dataSource = self
        ampmPicker.delegate = self
        
        hourPicker.dataSource = self
        hourPicker.delegate = self
        
        minutePicker.dataSource = self
        minutePicker.delegate = self
        

        bind()
        
    }
    
    func layout(){
        
        self.view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 20
       //피커 세개
        view.addSubview(ampmPicker)
        view.addSubview(hourPicker)
        view.addSubview(minutePicker)
        //AMPM
        ampmPicker.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(43)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(80)
            $0.height.equalTo(128)
        }
        //시
        hourPicker.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.width.equalTo(80)
            $0.height.equalTo(128)
        }
        //분
        minutePicker.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(43)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(80)
            $0.height.equalTo(128)
        }
        //콜론
        self.view.addSubview(colon)
        colon.snp.makeConstraints{
            $0.leading.equalTo(hourPicker.snp.trailing).offset(8)
            $0.centerY.equalTo(hourPicker.snp.centerY)
            $0.width.equalTo(10)
            $0.height.equalTo(23)
        }
        
        colon.image = UIImage(named: "colon_img")
        
        
        self.view.addSubview(checkBtn)
        checkBtn.snp.makeConstraints{
            $0.trailing.leading.equalToSuperview()
            $0.bottom.equalToSuperview().inset(16)
            $0.width.equalTo(340)
            $0.height.equalTo(40)
        }
        checkBtn.setImage(UIImage(named: "calendar_check_btn_img"), for: .normal)
    
    }
    
    
    func bind(){
        self.checkBtn.rx.tap
            .subscribe(onNext : {
                print(" 확인")
                // 값을 전달한다.
               
                var result = self.ampmList[self.selectedAMPM] + " " + self.hourList[self.selectedHour] + "시" + self.minuteList[self.selectedMinute] + "분"
                self.preVC?.dueTimeBtn.setTitle(result, for: .normal)
                self.preVC?.dueTimeBtn.setTitleColor(UIColor(red: 0.098, green: 0.098, blue: 0.098, alpha: 1), for: .normal)
                print(" 시간 선택 : \(result)")
                self.dismiss(animated: true)
            }).disposed(by: disposeBag )
    }
}
extension ModifyTimePickerVC : UIPickerViewDataSource, UIPickerViewDelegate{
    /* 필수 */
    //UIPickerViewDataSource
        // 도르륵을 몇개 넣을지
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
           
            
            return 1
        }
        
        // pickerView 안에 들어갈 항목의 개수를 반환
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            if pickerView == ampmPicker {
                return ampmList.count
            }else if pickerView == hourPicker{
                return hourList.count
            }else{
                return minuteList.count
            }
            
        }
//
//    //UIPickerViewDelegate
//    // 피커 뷰 행의 높이
//        func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
//            return 44
//        }
//
//        // 피커 뷰 행의 넓이
//        func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
//            return 200
//        }
//
        // 피커 뷰에서 특정 위치(row)를 가리킬 때, 그 위치에 해당하는 문자열을 반환
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            if pickerView == ampmPicker {
                return ampmList[row]
            }else if pickerView == hourPicker{
                return hourList[row]
            }else{
                return minuteList[row]
            }
            
        }
//
//        // row 타이틀(글씨)에 적용
//        func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
//            return NSAttributedString(string: pickerList[row], attributes: attributes)
//        }
//
//        // row 뷰에서 적용
//        func pickerView(UIPickerView, viewForRow: Int, forComponent: Int, reusing: UIView?) -> UIView {
//            return UIView
//        }
//
        // 피커 뷰에서 특정 위치(row)가 선택되었을 때, 할 행동을 정의
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            if pickerView == ampmPicker{
                self.selectedAMPM = row
                print("오전 오후 : \(selectedAMPM)")
            }else if pickerView == hourPicker{
                self.selectedHour = row
                print("시간 : \(selectedHour)")
            }else{
                self.selectedMinute = row
                print("분 : \(selectedMinute)")
            }

        }
}

