//
//  MyPageViewController.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/10.
//

import Foundation
import UIKit
import ReactorKit
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser
//My
class MyPageViewController : UIViewController ,View{
    
    
    // 스크롤뷰
    let scrollView = UIScrollView()

    //프로필 컨테이너
    let profileContainer = UIView()
    let imageView = UIImageView()
    let nameText = UILabel()
    let sellCount = UILabel()
    let bidCount = UILabel()
    let sellCountTitle = UILabel()
    let bidCountTitle = UILabel()
    let changeBtn = UIButton()
    let sellRecordBtn = UIButton()
    let buyRecordBtn = UIButton()
    let zzimRecordBtn = UIButton()
    
    let separator1 = UIView()
    
    //계정 기본정보
    let infoContainer = UIView()
    let infoBtn = UIButton()
    let separator2 = UIView()
    
    //알림설정
    let alarmConainer = UIView()
    let alarmBtn = UIButton()
    let separator3 = UIView()
    
    // 앱버전
    let versionConainer = UIView()
    let versionTitle = UILabel()
    let versionText = UILabel()
    let separator4 = UIView()
     
    //개발자 정보
    let developerConainer = UIView()
    let developerTitle = UILabel()
    let developerText = UILabel()
    let separator5 = UIView()
    
    //개인정보 수집 및 이용 방침
    let privateContainer = UIView()
    let privateBtn = UIButton()
    let separator6 = UIView()
    // 서비스 이용약관
    let policyContainer = UIView()
    let policyBtn = UIButton()
   
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var disposeBag: DisposeBag  = DisposeBag()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
       
        
    }
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }
    
    
    private func layout(){
        
        self.view.backgroundColor = .systemBackground
        //스크롤뷰
        self.view.addSubview(scrollView)
        scrollView.snp.makeConstraints{
            $0.top.bottom.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview()
        }
        //프로필 컨테이너
        setProfileLayout()
        buttonLayout()
    }
    /*
     프로필 레이아웃
     */
    func setProfileLayout(){
        scrollView.addSubview(profileContainer)
        profileContainer.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.width.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.height.equalTo(252)
        }
        [imageView,nameText,
         sellCount,
         bidCount,
          sellCountTitle,
          bidCountTitle,
          changeBtn,
          sellRecordBtn,
          buyRecordBtn,
         zzimRecordBtn].forEach{
            profileContainer.addSubview($0)
        }
        imageView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(65)
            $0.leading.equalToSuperview().offset(44)
            $0.width.height.equalTo(56)
            
        }
        imageView.image = UIImage(named: "temp_profile")
        imageView.layer.cornerRadius = 100
        
        nameText.snp.makeConstraints{
            $0.centerX.equalTo(imageView.snp.centerX)
            $0.top.equalTo(imageView.snp.bottom)
            
        }
        nameText.text = "닉네임닉네임닉네임"
        
        sellCount.snp.makeConstraints{
            $0.top.equalTo(imageView.snp.top)
            $0.centerX.equalToSuperview()
        }
        sellCount.text = "300,000"
        sellCountTitle.snp.makeConstraints{
            $0.top.equalTo(sellCount.snp.bottom).offset(4)
            $0.centerX.equalTo(sellCount.snp.centerX)
        }
        
        sellCountTitle.text = "판매수"
        
        bidCount.snp.makeConstraints{
            $0.top.equalTo(sellCount.snp.top)
            $0.leading.equalTo(sellCount.snp.trailing).offset(53)
        }
        bidCount.text = "300,000"
        
        bidCountTitle.snp.makeConstraints{
            $0.top.equalTo(bidCount.snp.bottom).offset(4)
            $0.centerX.equalTo(bidCount.snp.centerX)
        }
        bidCountTitle.text = "낙찰수"
        
        changeBtn.snp.makeConstraints{
            $0.leading.equalTo(nameText.snp.trailing).offset(19)
            $0.top.equalTo(sellCountTitle.snp.bottom).offset(8)
            $0.width.equalTo(224)
            $0.trailing.equalToSuperview().inset(18)
            $0.height.equalTo(32)
        }
        changeBtn.setImage(UIImage(named: "profile_change_btn_img"), for: .normal)
        //판매내역
        sellRecordBtn.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(54)
            $0.width.equalTo(37)
            $0.height.equalTo(54)
            $0.top.equalTo(nameText.snp.bottom).offset(28)
        }
        sellRecordBtn.setImage(UIImage(named: "sell_record_img"), for: .normal)
        
        // 구매내역
        buyRecordBtn.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.width.equalTo(37)
            $0.height.equalTo(54)
            $0.top.equalTo(nameText.snp.bottom).offset(28)
        }
        
        buyRecordBtn.setImage(UIImage(named: "buy_record_img"), for: .normal)
        //찜한 상품
        zzimRecordBtn.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(54)
            $0.width.equalTo(37)
            $0.height.equalTo(54)
            $0.top.equalTo(nameText.snp.bottom).offset(28)
        }
        
        zzimRecordBtn.setImage(UIImage(named: "zzim_record_img"), for: .normal)
        
    }
    
    func buttonLayout(){
        //줄1
        scrollView.addSubview(separator1)
        separator1.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(profileContainer.snp.bottom)
            $0.height.equalTo(8)
            $0.width.equalToSuperview()
        }
        separator1.backgroundColor = UIColor(red: 0.962, green: 0.962, blue: 0.962, alpha: 1)
        
        //계정 기본정보
        scrollView.addSubview(infoContainer)
        infoContainer.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(separator1.snp.bottom)
            $0.height.equalTo(58)
            $0.width.equalToSuperview()
        }
        
        infoContainer.addSubview(infoBtn)
        infoBtn.snp.makeConstraints{
            
            $0.top.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalTo(200)
            //$0.height.equalTo(40)
        }
        infoBtn.setTitle("계정 기본정보", for: .normal)
        infoBtn.setTitleColor(.black, for: .normal)
        
        scrollView.addSubview(separator2)
        separator2.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(infoContainer.snp.bottom)
            $0.height.equalTo(1)
            $0.width.equalToSuperview()
        }
        separator2.backgroundColor = UIColor(red: 0.962, green: 0.962, blue: 0.962, alpha: 1)
        //알림설정
        scrollView.addSubview(alarmConainer)
        alarmConainer.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(separator2.snp.bottom)
            $0.height.equalTo(58)
            $0.width.equalToSuperview()
        }
        alarmConainer.addSubview(alarmBtn)
        alarmBtn.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalTo(200)
            //$0.height.equalTo(40)
        }
        alarmBtn.setTitle("알림 설정", for: .normal)
        alarmBtn.setTitleColor(.black, for: .normal)
        //줄3
        scrollView.addSubview(separator3)
        separator3.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(alarmConainer.snp.bottom)
            $0.height.equalTo(1)
            $0.width.equalToSuperview()
        }
        separator3.backgroundColor = UIColor(red: 0.962, green: 0.962, blue: 0.962, alpha: 1)
        
        //앱버전
        scrollView.addSubview(versionConainer)
        versionConainer.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(separator3.snp.bottom)
            $0.height.equalTo(58)
            $0.width.equalToSuperview()
        }
        versionConainer.addSubview(versionTitle)
        versionConainer.addSubview(versionText)
        versionTitle.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(18)
            
        }
        versionTitle.text = "앱버전"
        versionText.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(18)
        }
        versionText.text = "v1.0.0"
        
        //줄4
        scrollView.addSubview(separator4)
        separator4.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(versionConainer.snp.bottom)
            $0.height.equalTo(1)
            $0.width.equalToSuperview()
        }
        separator4.backgroundColor = UIColor(red: 0.962, green: 0.962, blue: 0.962, alpha: 1)
        
        //개발자정보
        scrollView.addSubview(developerConainer)
        developerConainer.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(separator4.snp.bottom)
            $0.height.equalTo(58)
            $0.width.equalToSuperview()
        }
        developerConainer.addSubview(developerTitle)
        developerConainer.addSubview(developerText)
        developerTitle.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(18)
            
        }
        developerTitle.text = "개발자정보"
        developerText.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(18)
        }
        developerText.text = "gmail@gmail.com"
        
        //줄5
        scrollView.addSubview(separator5)
        separator5.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(developerConainer.snp.bottom)
            $0.height.equalTo(1)
            $0.width.equalToSuperview()
        }
        separator5.backgroundColor = UIColor(red: 0.962, green: 0.962, blue: 0.962, alpha: 1)
        
        //개인정보 수집 및 이용방침
        scrollView.addSubview(privateContainer)
        privateContainer.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(separator5.snp.bottom)
            $0.height.equalTo(58)
            $0.width.equalToSuperview()
        }
        privateContainer.addSubview(privateBtn)
        privateBtn.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalTo(200)
            $0.height.equalTo(40)
        }
        privateBtn.setTitle("개인정보 수집 및 이용방침", for: .normal)
        privateBtn.setTitleColor(.black, for: .normal)
        //줄6
        scrollView.addSubview(separator6)
        separator6.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(privateContainer.snp.bottom)
            $0.height.equalTo(1)
            $0.width.equalToSuperview()
        }
        separator6.backgroundColor = UIColor(red: 0.962, green: 0.962, blue: 0.962, alpha: 1)
        
        //서비스 이용약관
        scrollView.addSubview(policyContainer)
        policyContainer.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(separator6.snp.bottom)
            $0.height.equalTo(58)
            $0.width.equalToSuperview()
        }
        policyContainer.addSubview(policyBtn)
        (policyBtn).snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalTo(200)
            $0.height.equalTo(40)
        }
        (policyBtn).setTitle("서비스 이용약관", for: .normal)
        (policyBtn).setTitleColor(.black, for: .normal)
    }
    
    func bind(reactor: MyPageReactor) {
        
        self.rx.viewDidLoad
              .mapVoid()
              .map(Reactor.Action.viewDidLoad)
              .bind(to: reactor.action)
              .disposed(by: self.disposeBag)
        
        var currentUser : User? = reactor.initialState.user
        
        //계정 기본 정보 클릭 이벤트
        self.infoBtn.rx.tap
            .subscribe(onNext : {
                let vc = UserInfoViewController()
                
                let reactorVC = UserInfoReactor(user: currentUser!)
                print("\(currentUser) 현재 유저")
                vc.reactor = reactorVC
               // vc.bind(reactor: listReactor)
                self.navigationController?.pushViewController(vc, animated: true)
            }).disposed(by: disposeBag)
        
        
        //알림 설정 클릭 이벤트
        self.alarmBtn.rx.tap
            .subscribe(onNext : {
                let vc = AlarmSettingVC()
                let reactor = AlarmSettingReactor()
                vc.reactor = reactor
               // vc.bind(reactor: listReactor)
                self.navigationController?.pushViewController(vc, animated: true)
            }).disposed(by: disposeBag)
        
        
        //프로필 수정 버튼 클릭 이벤트
        self.changeBtn.rx.tap
            .subscribe(onNext : {
                let vc = ProfileChangeVC()
                let reactor = ProfileChangeReactor(user: currentUser!)
                vc.reactor = reactor
               // vc.bind(reactor: listReactor)
                self.navigationController?.pushViewController(vc, animated: true)
            }).disposed(by: disposeBag)
        
        
        reactor.state
            .map { $0.user }
            .subscribe(onNext : { user in
                
                if user?.nickname != nil{
                    self.nameText.text = user?.nickname
                }else{
                    self.nameText.text  = "닉네임 필요"
                }
                
                currentUser = user
                
            })
            .disposed(by: self.disposeBag)
        
        
    }
    

    
    
}
