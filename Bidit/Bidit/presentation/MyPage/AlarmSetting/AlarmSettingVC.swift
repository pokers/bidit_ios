//
//  AlarmSettingVC.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/10.
//

import Foundation
import UIKit
import ReactorKit

class AlarmSettingVC : UIViewController, View{
    
    //전체 푸시알림
    let allPushContainer = UIView()
    let allPushTitle = UILabel()
    let allPushSwitch = UISwitch()
    
    //상세알림
    let detailNoticeContainer = UIView()
    let detailNoticeTitle = UILabel()
    
    //메시지 알림
    let messagePushContainer  = UIView()
    let messagePushTitle = UILabel()
    let messageSwitch = UISwitch()
    
    //낙찰 알림
    let biddingPushContinaer = UIView()
    let biddingPushTitle = UILabel()
    let biddingPushSwitch = UISwitch()
    
    //시간 마감 알림
    let endPushContinaer = UIView()
    let endPushTitle = UILabel()
    let endPushSwitch = UISwitch()
    
    //시간 마감 임박 알림
    let endingSoonPushContinaer = UIView()
    let endingSoonPushTitle = UILabel()
    let endingSoonPushSwitch = UISwitch()
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.view.backgroundColor = .systemBackground
        
        
    }
    
    
    
    private func layout(){
        //전체 푸시알림
        view.addSubview(allPushContainer)
        allPushContainer.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalToSuperview().offset(80)
            $0.height.equalTo(62)
            $0.width.equalToSuperview()
        }
        allPushContainer.addSubview(allPushTitle)
        allPushContainer.addSubview(allPushSwitch)
        allPushTitle.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(18)
            
        }
        allPushTitle.text = "전체 푸시 알림"
        allPushSwitch.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(18)
        }
        // Display the border of Swicth.
        allPushSwitch.tintColor = UIColor(red: 0.059, green: 0.259, blue: 0.957, alpha: 1)
        //상세 알림
        view.addSubview(detailNoticeContainer)
        detailNoticeContainer.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(allPushContainer.snp.bottom)
            $0.height.equalTo(52)
            $0.width.equalToSuperview()
        }
        detailNoticeContainer.addSubview(detailNoticeTitle)
        (detailNoticeTitle).snp.makeConstraints{
            $0.leading.equalToSuperview().offset(16)
            $0.bottom.equalToSuperview().inset(6)
        }
        detailNoticeTitle.text = "상세 알림"
        detailNoticeContainer.backgroundColor = UIColor(red: 0.962, green: 0.962, blue: 0.962, alpha: 1)
        
        
        //메시지 알림
        view.addSubview(messagePushContainer)
        messagePushContainer.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(detailNoticeContainer.snp.bottom)
            $0.height.equalTo(62)
            $0.width.equalToSuperview()
        }
        messagePushContainer.addSubview(messagePushTitle)
        messagePushContainer.addSubview(messageSwitch)
        messagePushTitle.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(18)
            
        }
        messagePushTitle.text = "매시지 알림"
        (messageSwitch).snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(18)
        }
        // Display the border of Swicth.
        messageSwitch.tintColor = UIColor(red: 0.059, green: 0.259, blue: 0.957, alpha: 1)
        
        //낙찰 알림
        view.addSubview(biddingPushContinaer)
        biddingPushContinaer.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(messagePushContainer.snp.bottom)
            $0.height.equalTo(62)
            $0.width.equalToSuperview()
        }
        biddingPushContinaer.addSubview(biddingPushTitle)
        biddingPushContinaer.addSubview(biddingPushSwitch)
        biddingPushTitle.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(18)
            
        }
        biddingPushTitle.text = "낙찰 알림"
        (biddingPushSwitch).snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(18)
        }
        // Display the border of Swicth.
        biddingPushSwitch.tintColor = UIColor(red: 0.059, green: 0.259, blue: 0.957, alpha: 1)
        
        //시간 마감 알림
        view.addSubview(endPushContinaer)
        endPushContinaer.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(biddingPushContinaer.snp.bottom)
            $0.height.equalTo(62)
            $0.width.equalToSuperview()
        }
        endPushContinaer.addSubview(endPushTitle)
        endPushContinaer.addSubview(endPushSwitch)
        endPushTitle.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(18)
            
        }
        endPushTitle.text = "시간 마감 알림"
        (endPushSwitch).snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(18)
        }
        // Display the border of Swicth.
        endPushSwitch.tintColor = UIColor(red: 0.059, green: 0.259, blue: 0.957, alpha: 1)
        
        //시간 마감 임박 알림
        view.addSubview(endingSoonPushContinaer)
        endingSoonPushContinaer.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(endPushContinaer.snp.bottom)
            $0.height.equalTo(62)
            $0.width.equalToSuperview()
        }
        endingSoonPushContinaer.addSubview(endingSoonPushTitle)
        endingSoonPushContinaer.addSubview(endingSoonPushSwitch)
        endingSoonPushTitle.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(18)
            
        }
        endingSoonPushTitle.text = "시간 마감 임박 알림"
        (endingSoonPushSwitch).snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(18)
        }
        // Display the border of Swicth.
        endingSoonPushSwitch.tintColor = UIColor(red: 0.059, green: 0.259, blue: 0.957, alpha: 1)
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var disposeBag: DisposeBag  = DisposeBag()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        layout()
        
    }
    
    
    /*
     알림설정 네비게이션 바
     */
    private func setNavigationBar(){
        //self.navigationItem.leftBarButtonItem = backButton
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = . gray
        self.navigationController?.navigationBar.isHidden = false
        self.title = "알림 설정"

        self.tabBarController?.tabBar.isHidden = true
    }
    
    
    func bind(reactor: AlarmSettingReactor) {
        
    }
    


}
