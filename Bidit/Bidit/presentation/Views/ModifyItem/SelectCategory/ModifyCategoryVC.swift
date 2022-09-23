//
//  ModifyCategoryVC.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/17.
//

import Foundation
import UIKit
import ReactorKit

//카테고리 선택
class ModifyCategoryVC : UIViewController{
    var selected = 0
    var disposeBag: DisposeBag  = DisposeBag()
    let scrollView = UIScrollView()
    let iphoneBtn = UIButton() //아이폰
    let separator1 = UIView() //
    let gallaxyBtn = UIButton() //갤럭시
    let separator2 = UIView() //
    let etcPhoneBtn = UIButton() //기타폰
    let separator3 = UIView() //
    let watchBtn = UIButton() //스마트워치
    let separator4 = UIView() //
    let laptopBtn = UIButton() //노트북PC
    let separator5 = UIView() //
    let tabletBtn = UIButton() //태블릿
    let separator6 = UIView() //
    let tvBtn = UIButton() //티비/모니터
    let separator7 = UIView() //
    let gameBtn = UIButton() //게임
    let separator8 = UIView() //
    let soundBtn = UIButton() //음향기기
    let separator9 = UIView() //
    let cameraBtn = UIButton() //카메라
    let separator10 = UIView() //
    let droneBtn = UIButton() //드론
    let separator11 = UIView() //
    let etcBtn = UIButton() //기타
    let separator12 = UIView() //
    
    var preVC : ModifyProductVC? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        layout()
        bind()
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

        self.navigationController?.isNavigationBarHidden = false
        self.title = "카테고리"
        
        self.tabBarController?.tabBar.isHidden = true
    }
    
    
    private func layout(){
        //스크롤뷰
        self.view.addSubview(scrollView)
        let screenWidth = UIScreen.main.bounds.width
        scrollView.snp.makeConstraints{
            $0.top.bottom.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.width.equalTo(screenWidth - 36)
        }
        //아이폰
        scrollView.addSubview(iphoneBtn)
        iphoneBtn.setTitle( "아이폰", for: .normal)
        iphoneBtn.setTitleColor(.black, for: .normal)
        iphoneBtn.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        iphoneBtn.contentHorizontalAlignment = .left //버튼 타이틀 정렬
        iphoneBtn.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(24)
            $0.top.equalToSuperview().offset(20)
        }
        
        scrollView.addSubview(separator1) //줄 1
        separator1.backgroundColor = .separator
        separator1.snp.makeConstraints{

            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(1)
            $0.top.equalTo(iphoneBtn.snp.bottom).offset(20)
        }
        
        //갤럭시
        scrollView.addSubview(gallaxyBtn)
        gallaxyBtn.setTitle("갤럭시", for: .normal)
        gallaxyBtn.setTitleColor(.black, for: .normal)
        gallaxyBtn.contentHorizontalAlignment = .left //버튼 타이틀 정렬
        gallaxyBtn.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        gallaxyBtn.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(24)
            $0.top.equalTo(separator1.snp.bottom).offset(20)
        }
        
        scrollView.addSubview(separator2) //줄 1
        separator2.backgroundColor = .separator
        separator2.snp.makeConstraints{

            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(1)
            $0.top.equalTo(gallaxyBtn.snp.bottom).offset(20)
        }
        
        //기타폰
        scrollView.addSubview(etcPhoneBtn)
        etcPhoneBtn.setTitle("기타폰", for: .normal)
        etcPhoneBtn.setTitleColor(.black, for: .normal)
        etcPhoneBtn.contentHorizontalAlignment = .left //버튼 타이틀 정렬
        etcPhoneBtn.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        etcPhoneBtn.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(24)
            $0.top.equalTo(separator2.snp.bottom).offset(20)
        }
        
        scrollView.addSubview(separator3) //줄 3
        separator3.backgroundColor = .separator
        separator3.snp.makeConstraints{

            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(1)
            $0.top.equalTo(etcPhoneBtn.snp.bottom).offset(20)
        }
        
        //스마트워치
        scrollView.addSubview(watchBtn)
        watchBtn.setTitle("스마트워치", for: .normal)
        watchBtn.setTitleColor(.black, for: .normal)
        watchBtn.contentHorizontalAlignment = .left //버튼 타이틀 정렬
        watchBtn.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        watchBtn.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(24)
            $0.top.equalTo(separator3.snp.bottom).offset(20)
        }
        
        scrollView.addSubview(separator4) //줄 4
        separator4.backgroundColor = .separator
        separator4.snp.makeConstraints{

            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(1)
            $0.top.equalTo(watchBtn.snp.bottom).offset(20)
        }
        
        //노트북/PC
        scrollView.addSubview(laptopBtn)
        laptopBtn.setTitle("노트북/PC", for: .normal)
        laptopBtn.setTitleColor(.black, for: .normal)
        laptopBtn.contentHorizontalAlignment = .left //버튼 타이틀 정렬
        laptopBtn.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        laptopBtn.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(24)
            $0.top.equalTo(separator4.snp.bottom).offset(20)
        }
        
        scrollView.addSubview(separator5) //줄 5
        separator5.backgroundColor = .separator
        separator5.snp.makeConstraints{

            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(1)
            $0.top.equalTo(laptopBtn.snp.bottom).offset(20)
        }
        
        //태블릿
        scrollView.addSubview(tabletBtn)
        tabletBtn.setTitle("태블릿", for: .normal)
        tabletBtn.setTitleColor(.black, for: .normal)
        tabletBtn.contentHorizontalAlignment = .left //버튼 타이틀 정렬
        tabletBtn.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        tabletBtn.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(24)
            $0.top.equalTo(separator5.snp.bottom).offset(20)
        }
        
        scrollView.addSubview(separator6) //줄 6
        separator6.backgroundColor = .separator
        separator6.snp.makeConstraints{

            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(1)
            $0.top.equalTo(tabletBtn.snp.bottom).offset(20)
        }
        
        
        //티비/모니터
        scrollView.addSubview(tvBtn)
        tvBtn.setTitle("티비/모니터", for: .normal)
        tvBtn.setTitleColor(.black, for: .normal)
        tvBtn.contentHorizontalAlignment = .left //버튼 타이틀 정렬
        tvBtn.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        tvBtn.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(24)
            $0.top.equalTo(separator6.snp.bottom).offset(20)
        }
        
        scrollView.addSubview(separator7) //줄 7
        separator7.backgroundColor = .separator
        separator7.snp.makeConstraints{

            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(1)
            $0.top.equalTo(tvBtn.snp.bottom).offset(20)
        }
        
        //게임
        scrollView.addSubview(gameBtn)
        gameBtn.setTitle("게임", for: .normal)
        gameBtn.setTitleColor(.black, for: .normal)
        gameBtn.contentHorizontalAlignment = .left //버튼 타이틀 정렬
        gameBtn.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        gameBtn.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(24)
            $0.top.equalTo(separator7.snp.bottom).offset(20)
        }
        
        scrollView.addSubview(separator8) //줄 7
        separator8.backgroundColor = .separator
        separator8.snp.makeConstraints{

            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(1)
            $0.top.equalTo(gameBtn.snp.bottom).offset(20)
        }
        
        //음향기기
        scrollView.addSubview(soundBtn)
        soundBtn.setTitle("음향기기", for: .normal)
        soundBtn.setTitleColor(.black, for: .normal)
        soundBtn.contentHorizontalAlignment = .left //버튼 타이틀 정렬
        soundBtn.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        soundBtn.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(24)
            $0.top.equalTo(separator8.snp.bottom).offset(20)
        }
        
        scrollView.addSubview(separator9) //줄 9
        separator9.backgroundColor = .separator
        separator9.snp.makeConstraints{

            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(1)
            $0.top.equalTo(soundBtn.snp.bottom).offset(20)
        }
        
        //카메라
        scrollView.addSubview(cameraBtn)
        cameraBtn.setTitle("카메라", for: .normal)
        cameraBtn.setTitleColor(.black, for: .normal)
        cameraBtn.contentHorizontalAlignment = .left //버튼 타이틀 정렬
        cameraBtn.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        cameraBtn.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(24)
            $0.top.equalTo(separator9.snp.bottom).offset(20)
        }
        
        scrollView.addSubview(separator10) //줄 10
        separator10.backgroundColor = .separator
        separator10.snp.makeConstraints{

            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(1)
            $0.top.equalTo(cameraBtn.snp.bottom).offset(20)
        }
        
        //드론
        scrollView.addSubview(droneBtn)
        droneBtn.setTitle("드론", for: .normal)
        droneBtn.setTitleColor(.black, for: .normal)
        droneBtn.contentHorizontalAlignment = .left //버튼 타이틀 정렬
        droneBtn.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        droneBtn.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(24)
            $0.top.equalTo(separator10.snp.bottom).offset(20)
        }
        
        scrollView.addSubview(separator11) //줄 10
        separator11.backgroundColor = .separator
        separator11.snp.makeConstraints{

            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(1)
            $0.top.equalTo(droneBtn.snp.bottom).offset(20)
        }
        
        //기타
        scrollView.addSubview(etcBtn)
        etcBtn.setTitle("기타", for: .normal)
        etcBtn.setTitleColor(.black, for: .normal)
        etcBtn.contentHorizontalAlignment = .left //버튼 타이틀 정렬
        etcBtn.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        etcBtn.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(24)
            $0.top.equalTo(separator11.snp.bottom).offset(20)
        }
        
        scrollView.addSubview(separator12) //줄 12
        separator12.backgroundColor = .separator
        separator12.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(1)
            $0.top.equalTo(etcBtn.snp.bottom).offset(20)
            $0.bottom.equalToSuperview().inset(20)
        }
        
        
        
    }
    
    func bind(){
        
        
        let btnList = [iphoneBtn, gallaxyBtn, etcPhoneBtn,watchBtn, laptopBtn, tabletBtn, tvBtn, gameBtn, soundBtn, cameraBtn, droneBtn, etcBtn]
        
        self.iphoneBtn.rx.tap.subscribe(onNext : {
            btnList[self.selected].setTitleColor(UIColor(red: 0.098, green: 0.098, blue: 0.098, alpha: 1), for: .normal)
            self.selected = 0
            btnList[self.selected].setTitleColor(UIColor(red: 0.059, green: 0.259, blue: 0.957, alpha: 1), for: .normal)
            print("색상변경")
        }).disposed(by: disposeBag)
        
        self.gallaxyBtn.rx.tap.subscribe(onNext : {
            btnList[self.selected].setTitleColor(UIColor(red: 0.098, green: 0.098, blue: 0.098, alpha: 1), for: .normal)
            self.selected = 1
            btnList[self.selected].setTitleColor(UIColor(red: 0.059, green: 0.259, blue: 0.957, alpha: 1), for: .normal)
        }).disposed(by: disposeBag)
        
        self.etcPhoneBtn.rx.tap.subscribe(onNext : {
            btnList[self.selected].setTitleColor(UIColor(red: 0.098, green: 0.098, blue: 0.098, alpha: 1), for: .normal)
            self.selected = 2
            btnList[self.selected].setTitleColor(UIColor(red: 0.059, green: 0.259, blue: 0.957, alpha: 1), for: .normal)
        }).disposed(by: disposeBag)
        
        self.watchBtn.rx.tap.subscribe(onNext : {
            btnList[self.selected].setTitleColor(UIColor(red: 0.098, green: 0.098, blue: 0.098, alpha: 1), for: .normal)
            self.selected = 3
            btnList[self.selected].setTitleColor(UIColor(red: 0.059, green: 0.259, blue: 0.957, alpha: 1), for: .normal)
        }).disposed(by: disposeBag)
        
        self.laptopBtn.rx.tap.subscribe(onNext : {
            btnList[self.selected].setTitleColor(UIColor(red: 0.098, green: 0.098, blue: 0.098, alpha: 1), for: .normal)
            self.selected = 4
            btnList[self.selected].setTitleColor(UIColor(red: 0.059, green: 0.259, blue: 0.957, alpha: 1), for: .normal)
        }).disposed(by: disposeBag)
        
        self.tabletBtn.rx.tap.subscribe(onNext : {
            btnList[self.selected].setTitleColor(UIColor(red: 0.098, green: 0.098, blue: 0.098, alpha: 1), for: .normal)
            self.selected = 5
            btnList[self.selected].setTitleColor(UIColor(red: 0.059, green: 0.259, blue: 0.957, alpha: 1), for: .normal)
        }).disposed(by: disposeBag)
        
        self.tvBtn.rx.tap.subscribe(onNext : {
            btnList[self.selected].setTitleColor(UIColor(red: 0.098, green: 0.098, blue: 0.098, alpha: 1), for: .normal)
            self.selected = 6
            btnList[self.selected].setTitleColor(UIColor(red: 0.059, green: 0.259, blue: 0.957, alpha: 1), for: .normal)
        }).disposed(by: disposeBag)
        
        self.gameBtn.rx.tap.subscribe(onNext : {
            btnList[self.selected].setTitleColor(UIColor(red: 0.098, green: 0.098, blue: 0.098, alpha: 1), for: .normal)
            self.selected = 7
            btnList[self.selected].setTitleColor(UIColor(red: 0.059, green: 0.259, blue: 0.957, alpha: 1), for: .normal)
        }).disposed(by: disposeBag)
        
        self.soundBtn.rx.tap.subscribe(onNext : {
            btnList[self.selected].setTitleColor(UIColor(red: 0.098, green: 0.098, blue: 0.098, alpha: 1), for: .normal)
            self.selected = 8
            btnList[self.selected].setTitleColor(UIColor(red: 0.059, green: 0.259, blue: 0.957, alpha: 1), for: .normal)
        }).disposed(by: disposeBag)
        
        self.cameraBtn.rx.tap.subscribe(onNext : {
            btnList[self.selected].setTitleColor(UIColor(red: 0.098, green: 0.098, blue: 0.098, alpha: 1), for: .normal)
            self.selected = 9
            btnList[self.selected].setTitleColor(UIColor(red: 0.059, green: 0.259, blue: 0.957, alpha: 1), for: .normal)
        }).disposed(by: disposeBag)
        
        self.droneBtn.rx.tap.subscribe(onNext : {
            btnList[self.selected].setTitleColor(UIColor(red: 0.098, green: 0.098, blue: 0.098, alpha: 1), for: .normal)
            self.selected = 10
            btnList[self.selected].setTitleColor(UIColor(red: 0.059, green: 0.259, blue: 0.957, alpha: 1), for: .normal)
        }).disposed(by: disposeBag)
        
        self.etcBtn.rx.tap.subscribe(onNext : {
            btnList[self.selected].setTitleColor(UIColor(red: 0.098, green: 0.098, blue: 0.098, alpha: 1), for: .normal)
            self.selected = 11
            btnList[self.selected].setTitleColor(UIColor(red: 0.059, green: 0.259, blue: 0.957, alpha: 1), for: .normal)
        }).disposed(by: disposeBag)
        
        //닫을 때 이벤트
        self.rx.viewWillDisappear
            .subscribe(onNext : {result in
                // 값을 전달한다.
                self.preVC!.categoryBtn.setTitle(btnList[self.selected].currentTitle, for: .normal)
                self.preVC!.categoryBtn.setTitleColor(UIColor(red: 0.098, green: 0.098, blue: 0.098, alpha: 1), for: .normal)
                print(" 카테고리 선택 : \(btnList[self.selected].currentTitle)")
            }).disposed(by: disposeBag)
    }
}

