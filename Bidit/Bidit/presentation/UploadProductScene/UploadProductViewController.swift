//
//  UploadProductViewController.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/09.
//

import Foundation
import UIKit
import ReactorKit
import RxDataSources
import RxCocoa
import Photos
import BSImagePicker
import MaterialComponents.MaterialBottomSheet
import AWSS3

//판매글 올리기 뷰컨트롤러
class UploadProductViewController : UIViewController, View, UIScrollViewDelegate{
    let categoryList = ["디지털","아이폰", "갤럭시", "기타폰","스마트워치","노트북/PC",
                         "태블릿","티비/모니터","게임","음향기기","카메라","드론","기타"]
    let bucketName = PrivateKey().BUCKET_NAME
    let accessKey = PrivateKey().ACCESS_KEY
    let secretKey = PrivateKey().SECRET_KEY
    let utilityKey = PrivateKey().UTILITY_KEY
    
    
    //선택한 이미지를 담아둘 변수
    var selectedAssets : [PHAsset] = []
    var userSelectedImages : [UIImage] = [UIImage()]
    
    var userSelectedUrls : [String] = [String]()
    var urls  : [UIImage : String] = [UIImage : String]()
    
    let scrollView = UIScrollView()
    
    
    
    //고른 사진 컬렉션 뷰
    let imgCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        //layout.minimumLineSpacing = 20
        layout.scrollDirection = .horizontal
       // layout.sectionInset = UIEdgeInsets(top: 32, left: 16, bottom: 32, right: 16)
        layout.itemSize = CGSize(width: 80, height: 80)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(PickedImageCell.self, forCellWithReuseIdentifier: "PickedImageCell")
            return cv
    }()
    
    let imageCountLabel = UILabel()
    
    
    //RxCollectionViewDataSourceType
    let dataSource = RxCollectionViewSectionedReloadDataSource<UploadAlbumSection>{dataSource, collectionView, indexPath, item in
        switch item {
        case .album(let reactor):
            let cell = collectionView.dequeueReusableCell(for: indexPath) as PickedImageCell
            cell.reactor = reactor
            
            cell.imgDelete = {
                print("누른 index.row = \(indexPath.row)")
                
                //collectionView.deleteItems(at: [indexPath])
                collectionView.reloadData()
                
            }
            
            
            if indexPath.row == 0 {
                cell.photoContainer.isHidden = true
                cell.deleteButton.isHidden = true
                cell.addContainer.isHidden = false
                cell.numberText.isHidden = true //추후 수정
                
                
            }else{
                cell.photoContainer.isHidden = false
                cell.deleteButton.isHidden = false
                cell.addContainer.isHidden = true
            }
            
            if indexPath.row != 1{
                cell.representer.isHidden = true
            }else{
                cell.representer.isHidden = false
            }
            
            
            print("category create")
              return cell
        }
    }
    
    
    let separator1 = UIView()
    let titleField = UITextView() //글제목
    let separator2 = UIView()
    let categoryBtn = UIButton() // 카테고리
    let separator3 = UIView()
    let sPriceBtn = UIButton() // 비딩 시작가
    let sPriceField = UITextField()
    let separator4 = UIView()
    let buyNowPriceBtn = UIButton() // 즉시 구매가
    let buyNowPriceField = UITextField()
    let separator5 = UIView()
    let dueDateBtn = UIButton() // 경매 마감 날짜
    let separator6 = UIView()
    let dueTimeBtn = UIButton() // 경매 마감 시간
    let separator7 = UIView()
    let detailFilter = UIButton() //상세필터
    let detailSeparator = UIView() // 상세필터 추가하면서 생긴 줄
    let uploadBtn = UIButton() //판매글 등록 버튼
    let descriptionField = UITextView() //게시글 내용.
    
    //임시 상세필터 데이터
    var deliveryType = 0 //0 : 직접, 1 : 택배거래 , 2: 둘다.
    var periodResult = 0
    
    let df = DateFormatter()
    
    
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
        
        self.imgCollectionView.rx.setDelegate(self)
          .disposed(by: disposeBag)
        
        extendBind()
        textSetUp()
        //checkCameraPermission()
        checkAlbumPermission()
        
        let credentialsProvider = AWSStaticCredentialsProvider(accessKey: accessKey, secretKey: secretKey)
        
        let configuration = AWSServiceConfiguration(region:.APNortheast2, credentialsProvider:credentialsProvider)
        
        AWSServiceManager.default().defaultServiceConfiguration = configuration
        
        let tuConf = AWSS3TransferUtilityConfiguration()
        tuConf.isAccelerateModeEnabled = false
        
        AWSS3TransferUtility.register(
            with: configuration!,
            transferUtilityConfiguration: tuConf,
            forKey: utilityKey
        )
        
        
        
        
    }
    
    func layout(){
        //스크롤뷰
        self.view.addSubview(scrollView)
        let screenWidth = UIScreen.main.bounds.width
        scrollView.snp.makeConstraints{
            $0.top.bottom.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.width.equalTo(screenWidth - 36)
        }
        //이미지 뷰 컬렉션뷰
        scrollView.addSubview(imgCollectionView)
        imgCollectionView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(98)
            $0.width.equalToSuperview()
        }
        //이미지 개수
        scrollView.addSubview(imageCountLabel)
        imageCountLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(76)
            $0.leading.equalToSuperview().offset(26)
        }
        imageCountLabel.font = .systemFont(ofSize: 12, weight: .medium)
        imageCountLabel.textColor = UIColor(red: 0.62, green: 0.62, blue: 0.62, alpha: 1)
        self.imageCountLabel.text = "\(self.userSelectedImages.count - 1)/10"
        scrollView.addSubview(separator1) //줄 1
        separator1.backgroundColor = .separator
        separator1.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(1)
            $0.top.equalTo(imgCollectionView.snp.bottom)
        }
        
        //타이틀
        scrollView.addSubview(titleField)
        titleField.text = "글 제목"
        titleField.textColor = UIColor(red: 0.62, green: 0.62, blue: 0.62, alpha: 1)
        titleField.font = .systemFont(ofSize: 14, weight: .regular)
        // titleField.contentHorizontalAlignment = .left //버튼 타이틀 정렬
        titleField.snp.makeConstraints{
            $0.trailing.equalToSuperview()
            $0.leading.equalTo(16)
            $0.width.equalToSuperview()
            $0.height.equalTo(24)
            $0.top.equalTo(separator1.snp.bottom).offset(20)
        }
        
        scrollView.addSubview(separator2) //줄 2
        separator2.backgroundColor = .separator
        separator2.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(1)
            $0.top.equalTo(titleField.snp.bottom).offset(20)
        }
        //카테고리
        scrollView.addSubview(categoryBtn)
        categoryBtn.setTitle("카테고리", for: .normal)
        categoryBtn.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        categoryBtn.setTitleColor(.separator, for: .normal)
        categoryBtn.contentHorizontalAlignment = .left //버튼 타이틀 정렬
        categoryBtn.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(16)
            $0.top.equalTo(separator2.snp.bottom).offset(20)
            $0.height.equalTo(24)
            $0.width.equalTo(72)
        }
        
        scrollView.addSubview(separator3) //줄 3
        separator3.backgroundColor = .separator
        separator3.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(1)
            $0.top.equalTo(categoryBtn.snp.bottom).offset(20)
        }
        
        //startPrice
        scrollView.addSubview(sPriceBtn)
        scrollView.addSubview(sPriceField)
        sPriceBtn.setTitle("₩", for: .normal)
        sPriceBtn.setTitleColor(.separator, for: .normal)
        sPriceBtn.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        sPriceBtn.contentHorizontalAlignment = .left //버튼 타이틀 정렬
        sPriceBtn.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(16)
            $0.width.equalTo(20)
            $0.top.equalTo(separator3.snp.bottom).offset(20)
            $0.height.equalTo(28)
        }
        sPriceField.snp.makeConstraints{
            $0.leading.equalTo(sPriceBtn.snp.trailing)
            $0.centerY.equalTo(sPriceBtn.snp.centerY)
        }
        sPriceField.placeholder = "비딩 시작가"
        sPriceField.font = .systemFont(ofSize: 14, weight: .regular)
        sPriceField.keyboardType = .numberPad
        
        
        
        scrollView.addSubview(separator4) //줄 4
        separator4.backgroundColor = .separator
        separator4.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(1)
            $0.top.equalTo(sPriceBtn.snp.bottom).offset(20)
        }
        
        //buyNowPrice
        scrollView.addSubview(buyNowPriceBtn)
        scrollView.addSubview(buyNowPriceField)
        buyNowPriceBtn.setTitle("₩", for: .normal)
        buyNowPriceBtn.setTitleColor(.separator, for: .normal)
        buyNowPriceBtn.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        buyNowPriceBtn.contentHorizontalAlignment = .left //버튼 타이틀 정렬
        buyNowPriceBtn.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(16)
            $0.width.equalTo(20)
            $0.top.equalTo(separator4.snp.bottom).offset(20)
            $0.height.equalTo(28)
        }
        buyNowPriceField.snp.makeConstraints{
            $0.leading.equalTo(buyNowPriceBtn.snp.trailing)
            $0.centerY.equalTo(buyNowPriceBtn.snp.centerY)
        }
        buyNowPriceField.placeholder = "즉시 구매가"
        buyNowPriceField.font = .systemFont(ofSize: 14, weight: .regular)
        buyNowPriceField.keyboardType = .numberPad
        
        
        scrollView.addSubview(separator5) //줄 5
        separator5.backgroundColor = .separator
        separator5.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(1)
            $0.top.equalTo(buyNowPriceBtn.snp.bottom).offset(20)
        }
        
        //경매 마감 날짜
        scrollView.addSubview(dueDateBtn)
        dueDateBtn.setTitle("경매 마감 날짜", for: .normal)
        dueDateBtn.setTitleColor(.separator, for: .normal)
        dueDateBtn.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        dueDateBtn.contentHorizontalAlignment = .left //버튼 타이틀 정렬
        dueDateBtn.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(16)
            $0.width.equalTo(200)
            $0.top.equalTo(separator5.snp.bottom).offset(20)
            $0.height.equalTo(28)
            
        }
        
        scrollView.addSubview(separator6) //줄 6
        separator6.backgroundColor = .separator
        separator6.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(1)
            $0.top.equalTo(dueDateBtn.snp.bottom).offset(20)
        }
        
        //경매 마감 시간
        scrollView.addSubview(dueTimeBtn)
        dueTimeBtn.setTitle("경매 마감 시간", for: .normal)
        
        dueTimeBtn.setTitleColor(.separator, for: .normal)
        dueTimeBtn.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        dueTimeBtn.contentHorizontalAlignment = .left //버튼 타이틀 정렬
        dueTimeBtn.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(16)
            $0.width.equalTo(200)
            $0.top.equalTo(separator6.snp.bottom).offset(20)
            $0.height.equalTo(28)
            
        }
        
        scrollView.addSubview(detailSeparator) //줄 6
        detailSeparator.backgroundColor = .separator
        detailSeparator.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(1)
            $0.top.equalTo(dueTimeBtn.snp.bottom).offset(20)
        }
        detailSeparator.backgroundColor = .separator
        
        //상세필터 버튼
        scrollView.addSubview(detailFilter)
        
        detailFilter.setTitle("싱세필터", for: .normal)
        
        detailFilter.setTitleColor(.separator, for: .normal)
        detailFilter.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        detailFilter.contentHorizontalAlignment = .left //버튼 타이틀 정렬
        detailFilter.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(16)
            $0.width.equalTo(200)
            $0.top.equalTo(detailSeparator.snp.bottom).offset(20)
            $0.height.equalTo(28)
        }
        
        
        //판매글 등록 버튼
        scrollView.addSubview(uploadBtn)
        uploadBtn.setImage(UIImage(named: "upload_btn_img"), for: .normal)
        uploadBtn.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.width.equalTo(340)
            $0.height.equalTo(42)
            $0.top.equalTo(detailFilter.snp.bottom).offset(16)
        }
        
        scrollView.addSubview(separator7) //줄 7
        separator7.backgroundColor = .separator
        separator7.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(1)
            $0.top.equalTo(uploadBtn.snp.bottom).offset(20)
        }
        
        //게시글 내용
        scrollView.addSubview(descriptionField)
        descriptionField.text = "경매에 올릴 게시글 내용을 10자 이상 작성해주세요. (가품 및 판매금지 품목은 게시가 제한될 수 있습니다.)"
        descriptionField.textColor = UIColor(red: 0.62, green: 0.62, blue: 0.62, alpha: 1)
        descriptionField.font = .systemFont(ofSize: 14, weight: .regular)
        
        
        descriptionField.snp.makeConstraints{
            
            $0.width.equalTo(324)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(300)
            $0.top.equalTo(separator7.snp.bottom).offset(20)
            $0.bottom.equalToSuperview().inset(18)
        }
        
        
        
    }
    /*
     권한 체크
     */
    
    func checkCameraPermission(){
          AVCaptureDevice.requestAccess(for: .video, completionHandler: { (granted: Bool) in
              if granted {
                  print("Camera: 권한 허용")
              } else {
                  print("Camera: 권한 거부")
              }
          })
       }
    func checkAlbumPermission(){
            PHPhotoLibrary.requestAuthorization( { status in
                switch status{
                case .authorized:
                    print("Album: 권한 허용")
                case .denied:
                    print("Album: 권한 거부")
                case .restricted, .notDetermined:
                    print("Album: 선택하지 않음")
                default:
                    break
                }
            })
        }
    
    func attribute(){
        
    }
    //placeHolder Textview
    func textSetUp(){
            
            titleField.rx.didBeginEditing
                .subscribe(onNext: { [self] in
                if(titleField.text == "글 제목"){
                    titleField.text = nil
                    titleField.textColor = UIColor(red: 0.62, green: 0.62, blue: 0.62, alpha: 1)        //글자 색도 진한 색으로 바꿔줘야한다!
                    
                }}).disposed(by: disposeBag)
            
        titleField.rx.didEndEditing
                .subscribe(onNext: { [self] in
                if(titleField.text == nil || titleField.text == ""){
                    titleField.text = " 글 제목 "
                    titleField.textColor = UIColor(red: 0.62, green: 0.62, blue: 0.62, alpha: 1)      //다시 placeholder 글자색으로(연한색)
                    
                }else{
                    titleField.textColor = .black
                }
                    
                }).disposed(by: disposeBag)
        
        
        descriptionField.rx.didBeginEditing
            .subscribe(onNext: { [self] in
           
                print("설명글 작성 시작")
                if(descriptionField.text == "경매에 올릴 게시글 내용을 10자 이상 작성해주세요. (가품 및 판매금지 품목은 게시가 제한될 수 있습니다.)"){
                    descriptionField.text = ""
                }
                
                descriptionField.textColor = UIColor(red: 0.62, green: 0.62, blue: 0.62, alpha: 1)        //글자 색도 진한 색으로 바꿔줘야한다!
                
            
                
            }).disposed(by: disposeBag)
        
    descriptionField.rx.didEndEditing
            .subscribe(onNext: { [self] in
            if(descriptionField.text == nil || descriptionField.text == ""){
                descriptionField.text = "경매에 올릴 게시글 내용을 10자 이상 작성해주세요. (가품 및 판매금지 품목은 게시가 제한될 수 있습니다.)"
//                        """
//                        경매에 올릴 게시글 내용을 10자 이상 작성해주세요.
//                        (가품 및 판매금지품목은 게시가 제한될 수 있습니다.)
//                        """
                descriptionField.textColor = UIColor(red: 0.62, green: 0.62, blue: 0.62, alpha: 1)      //다시 placeholder 글자색으로(연한색)
                
            }else{
                descriptionField.textColor = .black
            }
                
                
                
            }).disposed(by: disposeBag)
        }
    /*
     이미지 삭제 및 추가. binding
     */
        func extendBind(){
            
            listRelay.asDriver(onErrorJustReturn: []).asObservable().map{Reactor.Action.addImage($0)}
                .bind(to: reactor!.action)
                .disposed(by: disposeBag)
            
            reactor?.deleteImgRelay.asDriver(onErrorJustReturn: UIImage()).asObservable()
                .subscribe{
                result in
                   
                
                    let temp = self.userSelectedImages.filter{ $0 != result.element!}
                    self.userSelectedImages = temp
                    
                    let tempURL = self.urls.filter{$0.key != result.element!}
                    self.userSelectedUrls.removeAll()
                    
                    tempURL.keys.forEach{str in
                        self.userSelectedUrls.append(str.description)
                    }
                    
                    self.updateList(self.userSelectedImages)
                
            }.disposed(by: disposeBag)
            
        
//            listRelay.asDriver(onErrorJustReturn: []).drive(onNext : {result in
//                let numbering = self.dataSource.sectionModels[0].items.count ?? 0
//                print("숫자 \(numbering)")
//                if numbering > 0 {
//                    print("숫자 수정")
//                }
//
//            }).disposed(by: disposeBag)
                    
        }
    
    
    /*
     바텀시트 캘린더 뷰  설정
     */
    private func setBottomSheet(){
        // 바텀 시트로 쓰일 뷰컨트롤러 생성
        let vc = CalendarVC()
        vc.preVC = self
        //vc.reactor = BottomSheetReactor(item: item)
        // MDC 바텀 시트로 설정
        let bottomSheet: MDCBottomSheetController = MDCBottomSheetController(contentViewController: vc)
        //bottomSheet.dismissOnDraggingDownSheet = false
        
        
        // 높이
        bottomSheet.mdc_bottomSheetPresentationController?.preferredSheetHeight = 360
        // 보여주기
        present(bottomSheet, animated: true, completion: nil)
        
        
    }
    /*
     시간 설정.
     */
    private func setTimeBottomSheet(){
        // 바텀 시트로 쓰일 뷰컨트롤러 생성
        let vc = TimePickerVC()
        vc.preVC = self
        //vc.reactor = BottomSheetReactor(item: item)
        // MDC 바텀 시트로 설정
        let bottomSheet: MDCBottomSheetController = MDCBottomSheetController(contentViewController: vc)
        //bottomSheet.dismissOnDraggingDownSheet = false
        
        
        // 높이
        bottomSheet.mdc_bottomSheetPresentationController?.preferredSheetHeight = 250
        // 보여주기
        present(bottomSheet, animated: true, completion: nil)
        
        
    }
    
    
    var itemList : [UIImage] = []
    var listRelay = PublishRelay<[UIImage]>() //view -> ViewModel //로그인 통과 여부 .

    func updateList(_ objects : [UIImage]){

        listRelay.accept(objects)

    }

    
    
    private func setNavigationBar(){
        //self.navigationItem.leftBarButtonItem = backButton
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = . gray
        self.navigationController?.navigationBar.isHidden = false
        self.title = "판매글 올리기"
        
    
        self.tabBarController?.tabBar.isHidden = true
    }
    
    
    func bind(reactor: UploadProductReactor) {
        //  Action
          
          
          self.rx.viewDidLoad
              .mapVoid()
              .map(Reactor.Action.viewDidLoad)
              .bind(to: reactor.action)
              .disposed(by: self.disposeBag)
        
          // 사진 추가.
        self.rx.viewWillAppear.mapVoid()
            .map(Reactor.Action.addImage(userSelectedImages))
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        //임시 테스트
        self.rx.viewDidLoad.subscribe(onNext : {
            print("viewDidLoad")
        }).disposed(by: disposeBag)
        
        self.rx.viewWillAppear.subscribe(onNext : {_ in
            self.updateList(self.userSelectedImages)
           // self.imgCollectionView.reloadData()
        }).disposed(by: disposeBag)
        
        df.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        df.locale = Locale(identifier: "ko_KR")
        //입력된 가격 형식으로 변환
        self.sPriceField.rx.text.changed.subscribe(onNext :{ inputPrice in
            let number = inputPrice?.components(separatedBy: [","]).joined()
            let largeNumber = Int(number!) ?? 0
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            let formattedNumber = numberFormatter.string(from: NSNumber(value:largeNumber))
            self.sPriceField.text = formattedNumber
        
            self.sPriceBtn.titleLabel?.textColor = .black
        }).disposed(by: disposeBag)
        
        
        //입력된 가격 형식으로 변환
        self.buyNowPriceField.rx.text.changed.subscribe(onNext :{ inputPrice in
            let number = inputPrice?.components(separatedBy: [","]).joined()
            let largeNumber = Int(number!) ?? 0
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            let formattedNumber = numberFormatter.string(from: NSNumber(value:largeNumber))
            self.buyNowPriceField.text = formattedNumber
            self.buyNowPriceBtn.titleLabel?.textColor = .black
        }).disposed(by: disposeBag)
        
    
        
        
        self.uploadBtn.rx.tap
            .subscribe(onNext : {
                if (self.imgCollectionView.numberOfItems(inSection: 0) < 2
                    || self.titleField.text == "" || self.titleField.text == "글 제목"
                    || self.categoryBtn.titleLabel?.text == "카테고리"
                    || self.sPriceField.text == "비딩 시작가" || self.sPriceField.text == "0"
                    || self.buyNowPriceField.text == "즉시 구매가" || self.buyNowPriceField.text == "0"
                    || self.dueDateBtn.titleLabel?.text == "경매 마감 날짜"
                    || self.dueTimeBtn.titleLabel?.text == "경매 마감 시간"){
                    //아직 작성되지 않은 항목이 있어요.팝업창 띄우기
                    let warningVC = WarningBlankVC()
                    
                    self.present(warningVC, animated: false)
                }
            })
        
        
        
        
        //판매글 등록 버튼 이벤트
        self.uploadBtn.rx.tap.filter{
            !(self.imgCollectionView.numberOfItems(inSection: 0) < 2
                || self.titleField.text == "" || self.titleField.text == "글 제목"
                || self.categoryBtn.titleLabel?.text == "카테고리"
                || self.sPriceField.text == "비딩 시작가" || self.sPriceField.text == "0"
                || self.buyNowPriceField.text == "즉시 구매가" || self.buyNowPriceField.text == "0"
                || self.dueDateBtn.titleLabel?.text == "경매 마감 날짜"
                || self.dueTimeBtn.titleLabel?.text == "경매 마감 시간")
        }.map{
            // yyyy년 --월 --일
            //년
            var year_str = self.dueDateBtn.titleLabel?.text ?? "2022_22222222"
            var startIndex = year_str.index(year_str.startIndex, offsetBy: 0)// 사용자지정 시작인덱스
            var endIndex = year_str.index(year_str.startIndex, offsetBy: 4)// 사용자지정 끝인덱스
            var sliced_year = year_str[startIndex ..< endIndex]
            print(sliced_year)
            
            //월
            var month_str = self.dueDateBtn.titleLabel?.text ?? "2022_22222222"
            startIndex = month_str.index(month_str.startIndex, offsetBy: 6)// 사용자지정 시작인덱스
            endIndex = month_str.index(month_str.startIndex, offsetBy: 8)// 사용자지정 끝인덱스
            var sliced_month = month_str[startIndex ..< endIndex]
            print(sliced_month)
            
            //일
            var day_str = self.dueDateBtn.titleLabel?.text ?? "2022_22222222"
            startIndex = day_str.index(day_str.startIndex, offsetBy: 10)// 사용자지정 시작인덱스
            endIndex = day_str.index(day_str.startIndex, offsetBy: 12)// 사용자지정 끝인덱스
            var sliced_day = day_str[startIndex ..< endIndex]
            print(sliced_day)
            
            
            //오전오후
            var day_ampm = self.dueTimeBtn.titleLabel?.text ?? "2022_22222222"
            startIndex = day_ampm.index(day_ampm.startIndex, offsetBy: 0)// 사용자지정 시작인덱스
            endIndex = day_ampm.index(day_ampm.startIndex, offsetBy: 2)// 사용자지정 끝인덱스
            var sliced_ampm = day_ampm[startIndex ..< endIndex]
            print(sliced_ampm)
            //오전 00시 00분
            //시간
            var day_hour = self.dueTimeBtn.titleLabel?.text ?? "2022_22222222"
            startIndex = day_hour.index(day_hour.startIndex, offsetBy: 3)// 사용자지정 시작인덱스
            endIndex = day_hour.index(day_hour.startIndex, offsetBy: 5)// 사용자지정 끝인덱스
            var sliced_hour = day_hour[startIndex ..< endIndex]
            var result_hour = sliced_hour.description
            if sliced_ampm == "오후"{
                result_hour = (Int(sliced_hour.description)! + 12 ).description
            }
            print(result_hour)
            
            //분
            var day_minute = self.dueTimeBtn.titleLabel?.text ?? "2022_22222222"
            startIndex = day_minute.index(day_minute.startIndex, offsetBy: 6)// 사용자지정 시작인덱스
            endIndex = day_minute.index(day_minute.startIndex, offsetBy: 8)// 사용자지정 끝인덱스
            var sliced_minute = day_minute[startIndex ..< endIndex]
            print(sliced_minute)
            
            let buyNowPrice  = self.buyNowPriceField.text?.components(separatedBy: [","]).joined()
            let sPrice  = self.sPriceField.text?.components(separatedBy: [","]).joined()
            print("업로드 마감 날짜 \(sliced_year)-\(sliced_month)-\(sliced_day)T\(result_hour):\(sliced_minute):00.000Z")
            
            return Reactor.Action.tapUpload(
            imgs: self.userSelectedUrls,
            status: 0,
            buyNow : Int(buyNowPrice!)! ,
            title: self.titleField.text,
            categoryId: self.categoryList.firstIndex(of: self.categoryBtn.titleLabel?.text ?? "아이폰")! + 1,
            sPrice: Int(sPrice!)!,
            name: self.categoryBtn.titleLabel!.text!,
            dueDate: "\(sliced_year)-\(sliced_month)-\(sliced_day)T\(result_hour):\(sliced_minute):00.000Z", // "2022-07-29T23:58:00.000Z",
                //"\(sliced_year)-\(sliced_month)-\(sliced_day)T\(result_hour):\(sliced_minute):00.000Z", //"2022-07-26T23:58:00.000Z"
            deliveryType: self.deliveryType,
            sCondition: 1,
            aCondition: 1,
            description: self.descriptionField.text.description,
            detail : self.periodResult
        
        )
        }.bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        //카테고리 선택 화면으로 이동.
        self.categoryBtn.rx.tap.subscribe(onNext : {result in
            print("카테고리 선택 화면 이동")
            let selectCategory = SellectCategoryVC()
            selectCategory.preVC = self
            selectCategory.saveImageList = self.userSelectedImages
            self.navigationController?.pushViewController(selectCategory, animated: true)
        }).disposed(by: disposeBag)
        //이미지 추가 버튼 이벤트
        imgCollectionView.rx.itemSelected.filter{$0.row == 0} //카메라 버튼만 이벤트 허용
            .subscribe(onNext : { result in
                self.addProductImg()
                
            }).disposed(by: disposeBag)
        
        //마감 기한 선택 이벤트
        self.dueDateBtn.rx.tap.subscribe(onNext : {
            self.setBottomSheet()
        }).disposed(by: disposeBag)
        //마감 시간 선택 이벤트
        self.dueTimeBtn.rx.tap.subscribe(onNext : {
            self.setTimeBottomSheet()
        }).disposed(by: disposeBag)
        //상세필터 버튼 이벤트
        self.detailFilter.rx.tap.subscribe(onNext : {
            print("상세필터 선택 화면 이동")
            let detailFilterVC = DetailFilterVC()
            detailFilterVC.preVC = self
            self.navigationController?.pushViewController(detailFilterVC, animated: true)
        }).disposed(by: disposeBag)
       
//        imgCollectionView.rx.itemSelected.filter{$0.row == 0} //카메라 버튼만 이벤트 허용
//              .map{Reactor.Action.cellSelected($0)}
//              .bind(to: reactor.action)
//              .disposed(by: disposeBag)
        //State
   
        reactor.state
            .map {
                return $0.imageSection }
            .bind(to: imgCollectionView.rx.items(dataSource: dataSource))
            .disposed(by: self.disposeBag)
        
        
    //이미지 개수 갱신
    reactor.state
        .map{$0.imageSection}
        .subscribe(onNext : {
            self.imageCountLabel.text = "\(self.userSelectedImages.count - 1)/10"
        }).disposed(by: disposeBag)
        //업로드 결과
        self.reactor?.state
            .map{$0.uploadState}
            .subscribe(onNext : { uploadResult in
                
                if uploadResult {
                    
                    //상품이 정상적으로 등록되었습니다. 메시지
                    self.navigationController?.presentingViewController?.showToast(message: "상품이 정상적으로 등록되었습니다.")
                    self.navigationController?.popViewController(animated: true)
                    self.navigationController?.topViewController?.showToast(message: "상품이 정상적으로 등록되었습니다.")
                    
                }
                
            }).disposed(by: disposeBag)
    }
   
    
    
    
    private func addProductImg(){
        let imagePicker = ImagePickerController()
            imagePicker.settings.selection.max = 5
            imagePicker.settings.fetch.assets.supportedMediaTypes = [.image]
                
        let vc = self //.window?.rootViewController
                
        vc.presentImagePicker(imagePicker, select: { (asset) in
                    // User selected an asset. Do something with it. Perhaps begin processing/upload?
            }, deselect: { (asset) in
                    // User deselected an asset. Cancel whatever you did when asset was selected.
            }, cancel: { (assets) in
                    // User canceled selection.

            }, finish: { (assets) in
                    // User finished selection assets.
                    
                for i in 0..<assets.count {
                    self.selectedAssets.append(assets[i])
                 }
                
                self.convertAssetToImages()
                self.updateList(self.userSelectedImages)
//                self.imageCountLabel.text = "\(self.userSelectedImages.count - 1)/10"
                self.selectedAssets = []
//                self.userSelectedImages = []
                 //self.delegate?.didPickImagesToUpload(images: self.userSelectedImages)
             })
    }
    //키보드 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
          self.view.endEditing(true)
        
    }
    
    
    @objc func convertAssetToImages() {
            print("convertAssetToImages()")
            if selectedAssets.count != 0 {
                
                for i in 0..<selectedAssets.count {
                    
                    let imageManager = PHImageManager.default()
                    let option = PHImageRequestOptions()
                    option.isSynchronous = true
                    var thumbnail = UIImage()
                    
                    imageManager.requestImage(for: selectedAssets[i],
                                              targetSize: CGSize(width: 200, height: 200),
                                              contentMode: .aspectFit,
                                              options: option) { (result, info) in
                        thumbnail = result!
                        
                    }
                    
                    let data = thumbnail.jpegData(compressionQuality: 1.0)
                    let newImage = UIImage(data: data!)
                    //updateList(newImage! as UIImage)
                    self.userSelectedImages.append(newImage! as UIImage)
                    getURL(image: newImage!)
                    //S3
                    //print("resultURL : \(resultURL) " )
                    //S3Manager.shared.getURL(image: newImage!)
                    //self.userSelectedUrls.append()
                    //self.urls[newImage!] = S3Manager.shared.getURL(image: newImage!)
                    
                }
            }
        }
    
    //변환
    func stringConvertToDateTime(time : String) -> String {
        let date = Date()
        
           let stringFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
           let formatter = DateFormatter()
           formatter.dateFormat = stringFormat
           formatter.locale = Locale(identifier: "ko")
           guard let tempDate = formatter.date(from: time) else {
               return ""
           }
        print("not yet transform time is \(tempDate)")
           formatter.dateFormat = "yyyy"
        
        //print("not yet transform time is \(tempDate)")
         
        
           return formatter.string(from: tempDate)
       }
    
    func getURL(image : UIImage) -> String {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyyMMdd/"
        
        var fileKey = PrivateKey().FILE_KEY
        
        fileKey += dateFormat.string(from: Date())
        fileKey += String(Int64(Date().timeIntervalSince1970)) + "_"
        fileKey += UUID().uuidString + " \(Date().description)" + ".png"
        
        var photoUrl = ""
        guard let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: utilityKey)
        else
        {
            return ""
        }
        
        let expression = AWSS3TransferUtilityUploadExpression()
        expression.setValue("public-read", forRequestHeader: "x-amz-acl") //URL로 이미지 읽을 수 있도록 권한 설정 (이 헤더 없으면 못읽음)
        expression.progressBlock = {(task, progress) in
            print("progress \(progress.fractionCompleted)")
        }
        
        
        var completionHandler: AWSS3TransferUtilityUploadCompletionHandlerBlock?
        completionHandler = { [weak self] (task, error) -> Void in
            guard let self = self else { return }
            print("task finished")
            //??????
            let url = AWSS3.default().configuration.endpoint.url
            //
            let publicURL = url?.appendingPathComponent(self.bucketName).appendingPathComponent(fileKey)
            if let absoluteString = publicURL?.absoluteString {
                print("image url ↓↓")
                print(absoluteString)
            }
            
            if let query = task.request?.url?.query,
               var removeQueryUrlString = task.request?.url?.absoluteString.replacingOccurrences(of: query, with: "") {
                removeQueryUrlString.removeLast() // 맨 뒤 물음표 삭제
                print("업로드 리퀘스트에서 쿼리만 제거한 url ↓↓") //이 주소도 파일 열림
                print(" 업로드 URL : \(removeQueryUrlString)")
                //print(removeQueryUrlString)
                photoUrl =  removeQueryUrlString
                self.userSelectedUrls.append(photoUrl)
                self.urls[image] = photoUrl
                print("photoURL is \(photoUrl)")
            }
        }
        
        
        
        //올릴 사진
        guard let data = image.pngData() //UIImage(named: "testImg")?.pngData()
        else
        {
            return photoUrl
        }
        
        
        transferUtility.uploadData(data as Data, bucket: bucketName, key: fileKey, contentType: "image/png", expression: expression,
                                   completionHandler: completionHandler).continueWith
        {
            (task) -> AnyObject? in
            if let error = task.error {
                print("Error: \(error.localizedDescription)")
                
            }
            
            if let _ = task.result {
                print ("upload successful.")
            }
            return photoUrl as AnyObject
        }
        return photoUrl
    }
}

enum UploadAlbumSection {
    case album([UploadAlbumSectionItem])
}

enum UploadAlbumSectionItem {
    case album(PickedImageReactor)
    
}
//rxDataSource의 모델로 사용하기 위해 프로토콜 준수
extension UploadAlbumSection: SectionModelType {
    
    
  var items: [UploadAlbumSectionItem] {
    switch self {
    case .album(let image) : return image

    }
  }
    
  init(original: UploadAlbumSection, items: [UploadAlbumSectionItem]) {
    switch original {
    case .album: self = .album(items)
    }
  }
}

