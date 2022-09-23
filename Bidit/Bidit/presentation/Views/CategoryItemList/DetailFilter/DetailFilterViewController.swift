//
//  DetailFilterViewController.swift
//  Bidit
//
//

import Foundation
import UIKit

import ReactorKit

import RxSwift
import RxViewController
import RxCocoa
import SideMenu



class DetailFilterViewController : UIViewController, View, UIScrollViewDelegate{
    typealias Reactor = DetailFilterReactor
    
    //필터 설정 정보
    var availPost = false
    var availDirect = false
    var preVC : ItemListViewController? = nil
    
    var disposeBag: DisposeBag  = DisposeBag()
    
    var scrollView = UIScrollView()
    var containerView = UIView() //스크롤뷰 안의 컨테이너 뷰
    
    var buttonContainer = UIView() //필터초기화, 적용하기 버튼 컨테이너 뷰
    var initFilterButton = UIButton()
    var applyButton = UIButton()
    
    var subToolbarContainer = UIView()// 필터, X버튼 컨테이너
    var titleText = UILabel()
    var exitButton = UIButton()
    //품목
    var kindContainerView = UIStackView() //품목 컨테이너뷰
    var kindTitleLabel = UILabel()
    
    var radioContainer1 = UIView()
    var radioButton1 = UIButton()
    var radioTitleLabel1 = UILabel()
    
    var radioContainer2 = UIView()
    var radioButton2 = UIButton()
    var radioTitleLabel2 = UILabel()
    
    var radioContainer3 = UIView()
    var radioButton3 = UIButton()
    var radioTitleLabel3 = UILabel()
    //용량 컨테이너 뷰
    var volumeContainerView = UIStackView()
    var volumeTitleLabel = UILabel()
    
    var radioVolumeContainer1 = UIView()
    var radioVolumeButton1 = UIButton()
    var radioVolumeLabel1 = UILabel()
    
    var radioVolumeContainer2 = UIView()
    var radioVolumeButton2 = UIButton()
    var radioVolumeLabel2 = UILabel()
    
    var radioVolumeContainer3 = UIView()
    var radioVolumeButton3 = UIButton()
    var radioVolumeLabel3 = UILabel()
    //거래방법
    var howDealContainer = UIView()
    var howDealLabel = UILabel()
    var postDealButton = UIButton()
    var directDealButton = UIButton()
    // 사용기간
    var periodContainer = UIView()
    var periodTitle = UILabel()
    var minPeriodText = UITextField()
    var maxPeriodText = UITextField()
    var unitPeriodLabel1 = UILabel()
    var unitPeriodLabel2 = UILabel()
    //시작가
    var startPriceContainer = UIView()
    var startPriceTitle = UILabel()
    var minStartPrice = UITextField()
    var maxStartPrice = UITextField()
    var unitStartPrice1 = UILabel()
    var unitStartPrice2 = UILabel()
    //즉시 구매가
    var instantPriceContainer = UIView()
    var instantPriceTitle = UILabel()
    var minInstantPrice = UITextField()
    var maxInstantPrice = UITextField()
    var unitInstantPrice1 = UILabel()
    var unitInstantPrice2 = UILabel()
    
    //물결 표시
    var waveCh1 = UILabel()
    var waveCh2 = UILabel()
    var waveCh3 = UILabel()
    var waveCh4 = UILabel()
    
    //입력 조건 요청
    var fillCheck1 = UILabel()
    var fillCheck2 = UILabel()
    var fillCheck3 = UILabel()
    
    var periodCheck = true
    var sPriceCheck = true
    var buyNowCheck = true

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
//        layout()
//        attribute()
        layout()
        attribute()
        extraBind()
        
    }
    
    func extraBind(){
        self.postDealButton.rx.tap
            .subscribe(onNext : {
                print("택배거래 버튼 클릭")
            }).disposed(by: disposeBag)
        
        self.directDealButton.rx.tap
            .subscribe(onNext : {
                print("직거래 버튼 클릭")
            }).disposed(by: disposeBag)
        
        self.applyButton.rx.tap
            .subscribe(onNext : {
                print("적용하기 클릭")
                //입력 조건이 모두 정상일때만 필터 적용.
                if self.periodCheck && self.sPriceCheck && self.buyNowCheck {
                    self.preVC!.appliedFilter = true
                }else {
                    self.preVC!.appliedFilter = false
                }
                //guard let presentingVC = self.presentingViewController else { return }
                self.dismiss(animated: true){
                    
                }
            }).disposed(by: disposeBag)
    }
    
   
    
    func layout(){
        scrollView.delegate = self
        
        self.view.addSubview(scrollView)
        scrollView.snp.makeConstraints{
            //$0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.top.equalToSuperview()
            $0.width.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        
        
        view.addSubview(containerView)
        containerView.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.width.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        //상단 툴바 추가.
        containerView.addSubview(subToolbarContainer)
        subToolbarContainer.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.width.equalToSuperview()
            $0.height.equalTo(80)
        }
        //필터 타이틀
        subToolbarContainer.addSubview(titleText)
        titleText.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(20)
            $0.top.equalToSuperview().offset(36)
        }//닫기 버튼
        subToolbarContainer.addSubview(exitButton)
        exitButton.snp.makeConstraints{
            $0.width.height.equalTo(20)
            $0.top.equalToSuperview().offset(36)
            $0.leading.equalTo(titleText.snp.trailing).offset(208)
        }
//        //품목
//        containerView.addSubview(kindContainerView)
//        kindContainerView.axis = .vertical //스택뷰 축 설정.
//        kindContainerView.snp.makeConstraints{
//            $0.top.equalTo(subToolbarContainer.snp.bottom)
//            $0.trailing.equalToSuperview()
//            $0.leading.equalToSuperview().offset(20)
//            $0.height.equalTo(116)
//        }
//        kindContainerView.addSubview(kindTitleLabel) //품목 이름 추가.
//        kindTitleLabel.snp.makeConstraints{
//            $0.leading.equalToSuperview()
//            $0.top.equalToSuperview()
//        }
//        kindContainerView.addSubview(radioContainer1)
//        radioContainer1.snp.makeConstraints{
//            $0.top.equalTo(kindTitleLabel.snp.bottom).offset(20)
//            $0.width.equalTo(55)
//            $0.height.equalTo(20)
//        }
//
//        radioContainer1.addSubview(radioButton1)
//        radioButton1.snp.makeConstraints{
//            $0.leading.equalToSuperview()
//            $0.top.bottom.equalToSuperview()
//            $0.width.height.equalTo(20)
//        }
//        radioContainer1.addSubview(radioTitleLabel1)
//        radioTitleLabel1.snp.makeConstraints{
//            $0.leading.equalTo(radioButton1.snp.trailing).offset(12)
//            $0.top.bottom.equalToSuperview()
//        }
//
//        kindContainerView.addSubview(radioContainer2)
//        radioContainer2.snp.makeConstraints{
//            $0.top.equalTo(radioContainer1.snp.bottom).offset(12)
//            $0.width.equalTo(55)
//            $0.height.equalTo(20)
//        }
//
//        radioContainer2.addSubview(radioButton2)
//        radioButton2.snp.makeConstraints{
//            $0.leading.equalToSuperview()
//            $0.top.bottom.equalToSuperview()
//            $0.width.height.equalTo(20)
//        }
//        radioContainer2.addSubview(radioTitleLabel2)
//        radioTitleLabel2.snp.makeConstraints{
//            $0.leading.equalTo(radioButton2.snp.trailing).offset(12)
//            $0.top.bottom.equalToSuperview()
//        }
//
//
//        kindContainerView.addSubview(radioContainer3)
//        radioContainer3.snp.makeConstraints{
//            $0.top.equalTo(radioContainer2.snp.bottom).offset(12)
//            $0.width.equalTo(55)
//            $0.height.equalTo(20)
//        }
//
//        radioContainer3.addSubview(radioButton3)
//        radioButton3.snp.makeConstraints{
//            $0.leading.equalToSuperview()
//            $0.top.bottom.equalToSuperview()
//            $0.width.height.equalTo(20)
//        }
//        radioContainer3.addSubview(radioTitleLabel3)
//        radioTitleLabel3.snp.makeConstraints{
//            $0.leading.equalTo(radioButton3.snp.trailing).offset(12)
//            $0.top.bottom.equalToSuperview()
//        }
//
//        //용량
//        containerView.addSubview(volumeContainerView)
//        volumeContainerView.axis = .vertical //스택뷰 축 설정.
//        volumeContainerView.snp.makeConstraints{
//            $0.top.equalTo(kindContainerView.snp.bottom).offset(48)
//            $0.trailing.equalToSuperview()
//            $0.leading.equalToSuperview().offset(20)
//            $0.height.equalTo(116)
//        }
//        volumeContainerView.addSubview(volumeTitleLabel) //품목 이름 추가.
//        volumeTitleLabel.snp.makeConstraints{
//            $0.leading.equalToSuperview()
//            $0.top.equalToSuperview()
//        }
//        //용량 컨테이너에 라디오 컨테이너뷰 추가.
//        volumeContainerView.addSubview(radioVolumeContainer1)
//        radioVolumeContainer1.snp.makeConstraints{
//            $0.top.equalTo(volumeTitleLabel.snp.bottom).offset(20)
//            $0.width.equalTo(55)
//            $0.height.equalTo(20)
//        }
//
//        radioVolumeContainer1.addSubview(radioVolumeButton1)
//        radioVolumeButton1.snp.makeConstraints{
//            $0.leading.equalToSuperview()
//            $0.top.bottom.equalToSuperview()
//            $0.width.height.equalTo(20)
//        }
//        radioVolumeContainer1.addSubview(radioVolumeLabel1)
//        radioVolumeLabel1.snp.makeConstraints{
//            $0.leading.equalTo(radioVolumeButton1.snp.trailing).offset(12)
//            $0.top.bottom.equalToSuperview()
//        }
//        //
//        volumeContainerView.addSubview(radioVolumeContainer2)
//        radioVolumeContainer2.snp.makeConstraints{
//            $0.top.equalTo(radioVolumeContainer1.snp.bottom).offset(20)
//            $0.width.equalTo(55)
//            $0.height.equalTo(20)
//        }
//
//        radioVolumeContainer2.addSubview(radioVolumeButton2)
//        radioVolumeButton2.snp.makeConstraints{
//            $0.leading.equalToSuperview()
//            $0.top.bottom.equalToSuperview()
//            $0.width.height.equalTo(20)
//        }
//        radioVolumeContainer2.addSubview(radioVolumeLabel2)
//        radioVolumeLabel2.snp.makeConstraints{
//            $0.leading.equalTo(radioVolumeButton2.snp.trailing).offset(12)
//            $0.top.bottom.equalToSuperview()
//        }
//        //
//        volumeContainerView.addSubview(radioVolumeContainer3)
//        radioVolumeContainer3.snp.makeConstraints{
//            $0.top.equalTo(radioVolumeContainer2.snp.bottom).offset(20)
//            $0.width.equalTo(55)
//            $0.height.equalTo(20)
//        }
//
//        radioVolumeContainer3.addSubview(radioVolumeButton3)
//        radioVolumeButton3.snp.makeConstraints{
//            $0.leading.equalToSuperview()
//            $0.top.bottom.equalToSuperview()
//            $0.width.height.equalTo(20)
//        }
//        radioVolumeContainer3.addSubview(radioVolumeLabel3)
//        radioVolumeLabel3.snp.makeConstraints{
//            $0.leading.equalTo(radioVolumeButton3.snp.trailing).offset(12)
//            $0.top.bottom.equalToSuperview()
//        }
//
        //거래 방법
        containerView.addSubview(howDealContainer)
        howDealContainer.snp.makeConstraints{
            $0.top.equalTo(subToolbarContainer.snp.bottom)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(263)
            $0.height.equalTo(66)
        }
        howDealContainer.addSubview(howDealLabel) //거래방법 이름 추가.
        howDealLabel.snp.makeConstraints{
            $0.leading.equalToSuperview()
            $0.top.equalToSuperview()
        }
        howDealContainer.addSubview(postDealButton)
        postDealButton.snp.makeConstraints{
            $0.width.equalTo(118)
            $0.height.equalTo(34)
            $0.leading.equalToSuperview()
            $0.top.equalTo(howDealLabel.snp.bottom).offset(20)
        }
        
        howDealContainer.addSubview(directDealButton)
        directDealButton.snp.makeConstraints{
            $0.width.equalTo(118)
            $0.height.equalTo(34)
            $0.leading.equalTo(postDealButton.snp.trailing).offset(27)
            $0.top.equalTo(howDealLabel.snp.bottom).offset(20)
        }
        
        //사용기간
        containerView.addSubview(periodContainer)
        periodContainer.snp.makeConstraints{
            $0.width.equalTo(263)
            $0.height.equalTo(66)
            $0.top.equalTo(howDealContainer.snp.bottom).offset(48)
            $0.leading.equalToSuperview().offset(20)
        }
        periodContainer.addSubview(periodTitle) //사용기간 이름 추가.
        periodTitle.snp.makeConstraints{
            $0.leading.equalToSuperview()
            $0.top.equalToSuperview()
        }
        periodContainer.addSubview(unitPeriodLabel1)
        periodContainer.addSubview(minPeriodText) //최소기간 추가.
        minPeriodText.snp.makeConstraints{
            $0.width.equalTo(118)
            $0.height.equalTo(34)
            $0.leading.equalToSuperview()
            $0.top.equalTo(periodTitle.snp.bottom).offset(20)
        }
        
        minPeriodText.isEnabled = true
        unitPeriodLabel1.snp.makeConstraints{
            $0.top.bottom.equalTo(minPeriodText)
            $0.trailing.equalTo(minPeriodText.snp.trailing).inset(8)
        }
        
        periodContainer.addSubview(maxPeriodText) //최대기간 추가.
        maxPeriodText.snp.makeConstraints{
            $0.width.equalTo(118)
            $0.height.equalTo(34)
            $0.leading.equalTo(minPeriodText.snp.trailing).offset(35)
            $0.top.equalTo(periodTitle.snp.bottom).offset(20)
        }
        periodContainer.addSubview(unitPeriodLabel2)
        unitPeriodLabel2.snp.makeConstraints{
            $0.top.bottom.equalTo(maxPeriodText)
            $0.trailing.equalTo(maxPeriodText.snp.trailing).inset(8)
        }
        periodContainer.addSubview(waveCh1) // 사용기간 물결 표시
        waveCh1.snp.makeConstraints{
            $0.centerY.equalTo(minPeriodText.snp.centerY)
            $0.leading.equalTo(minPeriodText.snp.trailing)
            $0.trailing.equalTo(maxPeriodText.snp.leading)
        }
        waveCh1.text = "~"
        waveCh1.textAlignment = .center
        waveCh1.font = .systemFont(ofSize: 16, weight: .regular)
        
        periodContainer.addSubview(fillCheck1) //최대기간 추가.
        fillCheck1.snp.makeConstraints{
            $0.top.equalTo(maxPeriodText.snp.bottom).offset(8)
            $0.leading.equalTo(maxPeriodText.snp.leading)
        }
        fillCheck1.text = "가격 범위가 올바르지 않습니다."
        fillCheck1.textColor = UIColor(red: 0.957, green: 0.263, blue: 0.212, alpha: 1)
        fillCheck1.font = .systemFont(ofSize: 9, weight: .regular)
        
        //시작가
        containerView.addSubview(startPriceContainer)
        startPriceContainer.snp.makeConstraints{
            $0.width.equalTo(263)
            $0.height.equalTo(66)
            $0.top.equalTo(periodContainer.snp.bottom).offset(48)
            $0.leading.equalToSuperview().offset(20)
        }
        startPriceContainer.addSubview(startPriceTitle) //시작가 이름 추가.
        startPriceTitle.snp.makeConstraints{
            $0.leading.equalToSuperview()
            $0.top.equalToSuperview()
        }
        
        startPriceContainer.addSubview(minStartPrice) //최소금액 추가.
        minStartPrice.snp.makeConstraints{
            $0.width.equalTo(118)
            $0.height.equalTo(34)
            $0.leading.equalToSuperview()
            $0.top.equalTo(startPriceTitle.snp.bottom).offset(20)
        }
        startPriceContainer.addSubview(unitStartPrice1)
        unitStartPrice1.snp.makeConstraints{
            $0.top.bottom.equalTo(minStartPrice)
            $0.trailing.equalTo(minStartPrice.snp.trailing).inset(8)
        }
        
        startPriceContainer.addSubview(maxStartPrice) //최대금액 추가.
        maxStartPrice.snp.makeConstraints{
            $0.width.equalTo(118)
            $0.height.equalTo(34)
            $0.leading.equalTo(minStartPrice.snp.trailing).offset(35)
            $0.top.equalTo(startPriceTitle.snp.bottom).offset(20)
        }
        startPriceContainer.addSubview(unitStartPrice2)
        unitStartPrice2.snp.makeConstraints{
            $0.top.bottom.equalTo(maxStartPrice)
            $0.trailing.equalTo(maxStartPrice.snp.trailing).inset(8)
        }
        startPriceContainer.addSubview(waveCh2) // 시작가 물결 표시
        waveCh2.snp.makeConstraints{
            $0.centerY.equalTo(minStartPrice.snp.centerY)
            $0.leading.equalTo(minStartPrice.snp.trailing)
            $0.trailing.equalTo(maxStartPrice.snp.leading)
        }
        waveCh2.text = "~"
        waveCh2.font = .systemFont(ofSize: 16, weight: .regular)
        waveCh2.textAlignment = .center
        //입력 조건 요청
        startPriceContainer.addSubview(fillCheck2) //최대기간 추가.
        fillCheck2.snp.makeConstraints{
            $0.top.equalTo(maxStartPrice.snp.bottom).offset(8)
            $0.leading.equalTo(maxStartPrice.snp.leading)
        }
        fillCheck2.text = "가격 범위가 올바르지 않습니다."
        fillCheck2.textColor = UIColor(red: 0.957, green: 0.263, blue: 0.212, alpha: 1)
        fillCheck2.font = .systemFont(ofSize: 9, weight: .regular)
        
        //즉시구매가
        containerView.addSubview(instantPriceContainer)
        instantPriceContainer.snp.makeConstraints{
            $0.width.equalTo(263)
            $0.height.equalTo(66)
            
            $0.top.equalTo(startPriceContainer.snp.bottom).offset(48)
            $0.leading.equalToSuperview().offset(20)
            //$0.bottom.equalToSuperview().inset(80)
        }

        instantPriceContainer.addSubview(instantPriceTitle) //즉시구매가 이름 추가.
        instantPriceTitle.snp.makeConstraints{
            $0.leading.equalToSuperview()
            $0.top.equalToSuperview()
        }
        

        
        instantPriceContainer.addSubview(minInstantPrice) //최소금액 추가.
        minInstantPrice.snp.makeConstraints{
            $0.width.equalTo(118)
            $0.height.equalTo(34)
            $0.leading.equalToSuperview()
            $0.top.equalTo(instantPriceTitle.snp.bottom).offset(20)
        }
        instantPriceContainer.addSubview(unitInstantPrice1)
        unitInstantPrice1.snp.makeConstraints{
            $0.top.bottom.equalTo(minInstantPrice)
            $0.trailing.equalTo(minInstantPrice.snp.trailing).inset(8)
        }
        instantPriceContainer.addSubview(unitInstantPrice2)
        instantPriceContainer.addSubview(maxInstantPrice) //최대금액 추가.
        maxInstantPrice.snp.makeConstraints{
            $0.width.equalTo(118)
            $0.height.equalTo(34)
            $0.leading.equalTo(minInstantPrice.snp.trailing).offset(35)
            $0.top.equalTo(instantPriceTitle.snp.bottom).offset(20)
        }
        
        unitInstantPrice2.snp.makeConstraints{
            $0.top.bottom.equalTo(maxInstantPrice)
            $0.trailing.equalTo(maxInstantPrice.snp.trailing).inset(8)
        }
        
        instantPriceContainer.addSubview(waveCh3) // 시작가 물결 표시
        waveCh3.snp.makeConstraints{
            $0.centerY.equalTo(minInstantPrice.snp.centerY)
            $0.leading.equalTo(minInstantPrice.snp.trailing)
            $0.trailing.equalTo(maxInstantPrice.snp.leading)
        }
        waveCh3.text = "~"
        waveCh3.font = .systemFont(ofSize: 16, weight: .regular)
        waveCh3.textAlignment = .center
        
        //입력 조건 요청
        instantPriceContainer.addSubview(fillCheck3) //최대기간 추가.
        fillCheck3.snp.makeConstraints{
            $0.top.equalTo(maxInstantPrice.snp.bottom).offset(8)
            $0.leading.equalTo(maxInstantPrice.snp.leading)
        }
        fillCheck3.text = "가격 범위가 올바르지 않습니다."
        fillCheck3.textColor = UIColor(red: 0.957, green: 0.263, blue: 0.212, alpha: 1)
        fillCheck3.font = .systemFont(ofSize: 9, weight: .regular)
        
        self.view.addSubview(buttonContainer)
        buttonContainer.snp.makeConstraints{
            //$0.top.equalToSuperview().offset(self.view.frame.height - 80)
            $0.bottom.equalToSuperview().inset(18)
            $0.trailing.leading.equalToSuperview()
            $0.height.equalTo(62)
        }
        buttonContainer.addSubview(initFilterButton)
        initFilterButton.snp.makeConstraints{
            $0.width.equalTo(72)
            $0.height.equalTo(12)
            $0.leading.equalToSuperview().offset(28)
            $0.centerY.equalToSuperview()
        }
        buttonContainer.addSubview(applyButton)
        applyButton.snp.makeConstraints{
            $0.width.equalTo(166)
            $0.height.equalTo(42)
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(initFilterButton.snp.trailing).offset(19)
        }
        

    }
    
    func attribute(){
        
        self.navigationController?.navigationBar.isHidden = true
        
        subToolbarContainer.tintColor = .white
        titleText.text = "필터"
        titleText.font = .systemFont(ofSize: 16, weight: .bold)
        
        exitButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        exitButton.tintColor = .gray
        
        initFilterButton.setImage(UIImage(named: "refreshFilterImg"), for: .normal)
        applyButton.setImage(UIImage(named: "applyBtnImg"), for: .normal)
        
        kindTitleLabel.text = "품목"
        kindTitleLabel.font = .systemFont(ofSize: 12, weight: .bold)
        
        radioButton1.setImage(UIImage(named: "uncheckedRadioImg" ), for: .normal)
        radioButton2.setImage(UIImage(named: "uncheckedRadioImg" ), for: .normal)
        radioButton3.setImage(UIImage(named: "uncheckedRadioImg" ), for: .normal)
        
        radioTitleLabel1.text = "미니"
        radioTitleLabel1.font = .systemFont(ofSize: 12, weight: .medium)
        radioTitleLabel2.text = "일반"
        radioTitleLabel2.font = .systemFont(ofSize: 12, weight: .medium)
        radioTitleLabel3.text = "프로"
        radioTitleLabel3.font = .systemFont(ofSize: 12, weight: .medium)
        
        volumeTitleLabel.text = "용량"
        volumeTitleLabel.font = .systemFont(ofSize: 12, weight: .bold)
        
        radioVolumeButton1.setImage(UIImage(named: "uncheckedRadioImg" ), for: .normal)
        radioVolumeButton2.setImage(UIImage(named: "uncheckedRadioImg" ), for: .normal)
        radioVolumeButton3.setImage(UIImage(named: "uncheckedRadioImg" ), for: .normal)
        
        radioVolumeLabel1.text = "64GB"
        radioVolumeLabel1.font = .systemFont(ofSize: 12, weight: .medium)
        radioVolumeLabel2.text = "128GB"
        radioVolumeLabel2.font = .systemFont(ofSize: 12, weight: .medium)
        radioVolumeLabel3.text = "512GB"
        radioVolumeLabel3.font = .systemFont(ofSize: 12, weight: .medium)
        
        howDealLabel.text = "거래방법"
        howDealLabel.font = .systemFont(ofSize: 12, weight: .bold)
        
        postDealButton.setImage(UIImage(named: "uncheckedPostDeal"), for: .normal)
        directDealButton.setImage(UIImage(named: "uncheckDirectDeal"), for: .normal)
        
        periodTitle.text = "사용기간"
        periodTitle.font = .systemFont(ofSize: 12, weight: .bold)
        
        minPeriodText.addLeftPadding()
        minPeriodText.layer.borderWidth = 1
        minPeriodText.layer.borderColor = UIColor.separator.cgColor
        minPeriodText.layer.cornerRadius = 5
        minPeriodText.placeholder = "최소기간"
        minPeriodText.font = .systemFont(ofSize: 12)
        minPeriodText.keyboardType = .numberPad
        
        unitPeriodLabel1.text = "개월"
        unitPeriodLabel1.font = .systemFont(ofSize: 12, weight: .medium)
        unitPeriodLabel2.text = "개월"
        unitPeriodLabel2.font = .systemFont(ofSize: 12, weight: .medium)
        
        maxPeriodText.layer.borderWidth = 1
        maxPeriodText.layer.borderColor = UIColor.separator.cgColor
        maxPeriodText.layer.cornerRadius = 5
        maxPeriodText.placeholder = "최대기간"
        maxPeriodText.font = .systemFont(ofSize: 12)
        maxPeriodText.keyboardType = .numberPad
        maxPeriodText.addLeftPadding()
        maxPeriodText.keyboardType = .numberPad
        
        startPriceTitle.text = "시작가"
        startPriceTitle.font = .systemFont(ofSize: 12, weight: .bold)
        
        minStartPrice.layer.borderWidth = 1
        minStartPrice.layer.borderColor = UIColor.separator.cgColor
        minStartPrice.layer.cornerRadius = 5
        minStartPrice.placeholder = "최소금액"
        minStartPrice.font = .systemFont(ofSize: 12)
        minStartPrice.keyboardType = .numberPad
        minStartPrice.addLeftPadding()
        
        unitStartPrice1.text = "원"
        unitStartPrice1.font = .systemFont(ofSize: 12, weight: .medium)
        unitStartPrice2.text = "원"
        unitStartPrice2.font = .systemFont(ofSize: 12, weight: .medium)
        
        maxStartPrice.layer.borderWidth = 1
        maxStartPrice.layer.borderColor = UIColor.separator.cgColor
        maxStartPrice.layer.cornerRadius = 5
        maxStartPrice.placeholder = "최대금액"
        maxStartPrice.font = .systemFont(ofSize: 12)
        maxStartPrice.addLeftPadding()
        
        
        
        instantPriceTitle.text = "즉시구매가"
        instantPriceTitle.font = .systemFont(ofSize: 12, weight: .bold)
        
        minInstantPrice.layer.borderWidth = 1
        minInstantPrice.layer.borderColor = UIColor.separator.cgColor
        minInstantPrice.layer.cornerRadius = 5
        minInstantPrice.placeholder = "최소금액"
        minInstantPrice.font = .systemFont(ofSize: 12)
        minInstantPrice.keyboardType = .numberPad
        minInstantPrice.addLeftPadding()
        
        unitInstantPrice1.text = "원"
        unitInstantPrice1.font = .systemFont(ofSize: 12, weight: .medium)
        unitInstantPrice2.text = "원"
        unitInstantPrice2.font = .systemFont(ofSize: 12, weight: .medium)
        
        maxInstantPrice.layer.borderWidth = 1
        maxInstantPrice.layer.borderColor = UIColor.separator.cgColor
        maxInstantPrice.layer.cornerRadius = 5
        maxInstantPrice.placeholder = "최대금액"
        maxInstantPrice.font = .systemFont(ofSize: 12)
        maxInstantPrice.keyboardType = .numberPad
        maxInstantPrice.addLeftPadding()
        
    }
    
    
    func bind(reactor: DetailFilterReactor) {
        
//        Action
        self.rx.viewDidLoad // 뷰 로드
            .map{ Reactor.Action.viewDidLoad }
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
        
        //Action
        self.exitButton.rx.tap // 닫기 클릭 액션
            .map{ Reactor.Action.tapExitBtn } //처음에 가려진 상태 -> 열리지 않음(false)전달
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
        
        //최소 사용기간 입력 이벤트
        var minPeriod = 0 //최소
        var maxPeriod = 0 //최대
        self.minPeriodText.rx.text.subscribe(onNext : {
            minPeriod = Int($0?.description ?? "0") ?? 0
            if minPeriod > maxPeriod {
                //요청 사항 보여주기
                self.maxPeriodText.layer.borderColor = UIColor(red: 0.957, green: 0.263, blue: 0.212, alpha: 1).cgColor
                self.periodCheck = false
                self.fillCheck1.isHidden = false
            }else {
                self.fillCheck1.isHidden = true
                self.maxPeriodText.layer.borderColor = UIColor.separator.cgColor
                self.periodCheck = true
                
            }
        }).disposed(by: disposeBag)
        //최대 사용기간 입력 이벤트
        self.maxPeriodText.rx.text.subscribe(onNext : {text in
            maxPeriod = Int(text?.description ?? "0") ?? 0
            if minPeriod > maxPeriod {
                self.fillCheck1.isHidden = false
                self.periodCheck = false
                self.maxPeriodText.layer.borderColor = UIColor(red: 0.957, green: 0.263, blue: 0.212, alpha: 1).cgColor //경고 빨강
                
            }else {
                
                self.maxPeriodText.layer.borderColor = UIColor.separator.cgColor
                self.fillCheck1.isHidden = true
                self.periodCheck = true
            }
        }).disposed(by: disposeBag)
        
        //최소 시작가 이벤트
        var minSPrice = 0 //최소
        var maxSPrice = 0 //최대
        self.minStartPrice.rx.text.subscribe(onNext : {
            minPeriod = Int($0?.description ?? "0") ?? 0
            if minSPrice > maxSPrice {
                //요청 사항 보여주기
                self.sPriceCheck = false
                self.maxStartPrice.layer.borderColor = UIColor(red: 0.957, green: 0.263, blue: 0.212, alpha: 1).cgColor
                self.fillCheck2.isHidden = false
            }else {
                self.sPriceCheck = true
                self.fillCheck2.isHidden = true
                self.maxStartPrice.layer.borderColor = UIColor.separator.cgColor
                
            }
        }).disposed(by: disposeBag)
        //최대 시작가 이벤트
        self.maxStartPrice.rx.text.subscribe(onNext : {text in
            maxPeriod = Int(text?.description ?? "0") ?? 0
            if minSPrice > maxSPrice {
                self.fillCheck2.isHidden = false
                self.sPriceCheck = false
                self.maxStartPrice.layer.borderColor = UIColor(red: 0.957, green: 0.263, blue: 0.212, alpha: 1).cgColor
                
            }else {
                
                self.maxStartPrice.layer.borderColor = UIColor.separator.cgColor
                self.sPriceCheck = true
                self.fillCheck2.isHidden = true
            }
        }).disposed(by: disposeBag)
        
        
        //최소 즉구가 이벤트
        var minBuyNow = 0 //최소
        var maxBuyNow = 0 //최대
        self.minInstantPrice.rx.text.subscribe(onNext : {
            minBuyNow = Int($0?.description ?? "0") ?? 0
            if minSPrice > maxBuyNow {
                //요청 사항 보여주기
                self.maxStartPrice.layer.borderColor = UIColor(red: 0.957, green: 0.263, blue: 0.212, alpha: 1).cgColor
                self.fillCheck3.isHidden = false
                self.buyNowCheck = false
            }else {
                self.fillCheck3.isHidden = true
                self.maxStartPrice.layer.borderColor = UIColor.separator.cgColor
                self.buyNowCheck = true
                
            }
        }).disposed(by: disposeBag)
        //최대 즉구가 이벤트
        self.maxInstantPrice.rx.text.subscribe(onNext : {text in
            maxBuyNow = Int(text?.description ?? "0") ?? 0
            if minBuyNow > maxBuyNow {
                self.fillCheck3.isHidden = false
                self.maxStartPrice.layer.borderColor = UIColor(red: 0.957, green: 0.263, blue: 0.212, alpha: 1).cgColor
                
            }else {
                
                self.maxStartPrice.layer.borderColor = UIColor.separator.cgColor
                self.fillCheck3.isHidden = true
            }
        }).disposed(by: disposeBag)
        
        
//        //State
//        reactor.state
//
//            .subscribe(onNext : {_ in
//
//                self.dismiss(animated: true)
//
//
//            }).disposed(by: self.disposeBag)
        
    
//
        
        self.exitButton.rx.tap // 닫기 클릭 액션
            .subscribe(onNext : {
                print("닫기 클릭")
                self.dismiss(animated: true)
            })
            .disposed(by: self.disposeBag)
        
        //택배거래 버튼 이벤트
        self.postDealButton.rx.tap
            .subscribe(onNext : {
                if self.availPost == false{
                    self.availPost = true
                    self.postDealButton.setImage(UIImage(named: "post_btn_checked"), for: .normal)
                    print("post 활성화")
                }else if self.availPost == true{
                    self.availPost = false
                    self.postDealButton.setImage(UIImage(named: "post_btn_uncheck"), for: .normal)
                    print("post 비활성화")
                }
            }).disposed(by: disposeBag)
        
        self.directDealButton.rx.tap
            .subscribe(onNext : {
                if self.availDirect == false{
                    self.availDirect = true
                    self.directDealButton.setImage(UIImage(named: "direct_btn_checked"), for: .normal)
                }else{
                    self.availDirect = false
                    self.directDealButton.setImage(UIImage(named: "direct_btn_uncheck"), for: .normal)
                }
            }).disposed(by: disposeBag)
        
//        self.periodField.rx.text.subscribe(onNext : { text in
//            self.periodResult = Int(text!.description) ?? 0
//        }).disposed(by: disposeBag)
        
        
    }
    
    
}
extension DetailFilterViewController{
    func sideMenuWillAppear(menu: SideMenuNavigationController, animated: Bool) {
           print("SideMenu Appearing! (animated: \(animated))")
       }

       func sideMenuDidAppear(menu: SideMenuNavigationController, animated: Bool) {
           print("SideMenu Appeared! (animated: \(animated))")
           
       }

       func sideMenuWillDisappear(menu: SideMenuNavigationController, animated: Bool) {
           print("SideMenu Disappearing! (animated: \(animated))")
       }

       func sideMenuDidDisappear(menu: SideMenuNavigationController, animated: Bool) {
           print("SideMenu Disappeared! (animated: \(animated))")
          
        
       }
    
    //키보드 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
        
    }
}
