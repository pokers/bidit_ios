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


//판매글 올리기 뷰컨트롤러
class UploadProductViewController : UIViewController, View, UIScrollViewDelegate{
    
    //선택한 이미지를 담아둘 변수
    var selectedAssets : [PHAsset] = []
    var userSelectedImages : [UIImage] = [UIImage()]
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
    let uploadBtn = UIButton() //판매글 등록 버튼
    let descriptionField = UITextView() //게시글 내용.
    
    
    
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
        //판매글 등록 버튼
        scrollView.addSubview(uploadBtn)
        uploadBtn.setImage(UIImage(named: "upload_btn_img"), for: .normal)
        uploadBtn.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.width.equalTo(340)
            $0.height.equalTo(42)
            $0.top.equalTo(dueTimeBtn.snp.bottom).offset(16)
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
                if(titleField.text ==
                            "글 제목"
                            ){
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
            if(descriptionField.text == """
                        경매에 올릴 게시글 내용을 10자 이상 작성해주세요.
                        (가품 및 판매금지품목은 게시가 제한될 수 있습니다.)
                        """ ){
                descriptionField.text = nil
                descriptionField.textColor = UIColor(red: 0.62, green: 0.62, blue: 0.62, alpha: 1)        //글자 색도 진한 색으로 바꿔줘야한다!
                
            }
                
            }).disposed(by: disposeBag)
        
    descriptionField.rx.didEndEditing
            .subscribe(onNext: { [self] in
            if(descriptionField.text == nil || descriptionField.text == ""){
                descriptionField.text = """
                                                경매에 올릴 게시글 내용을 10자 이상 작성해주세요.
                                                (가품 및 판매금지품목은 게시가 제한될 수 있습니다.)
                        """
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
                   
                
                    var temp = self.userSelectedImages.filter{ $0 != result.element!}
                    self.userSelectedImages = temp
                    
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
        
        
        //판매글 등록 버튼 이벤트
        self.uploadBtn.rx.tap.filter{
            !(self.imgCollectionView.numberOfItems(inSection: 0) < 2
                || self.titleField.text == "" || self.titleField.text == "글 제목"
                || self.categoryBtn.titleLabel?.text == "카테고리"
                || self.sPriceField.text == "비딩 시작가" || self.sPriceField.text == "0"
                || self.buyNowPriceField.text == "즉시 구매가" || self.buyNowPriceField.text == "0"
                || self.dueDateBtn.titleLabel?.text == "경매 마감 날짜"
                || self.dueTimeBtn.titleLabel?.text == "경매 마감 시간")
        }.map{Reactor.Action.tapUpload(
            imgs: [],
            status: 1,
            buyNow : 1000,
            title: "임시 타이틀",
            categoryId: 0,
            sPrice: 2222,
            name: "노키아폰",
            dueDate: "2022-07-26T23:58:00.000Z", 
            deliveryType: 0,
            sCondition: 1,
            aCondition: 1,
            description: "판매글 등록 테스트")
        }.bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        
        self.rx.viewDidLoad
              .mapVoid()
              .map(Reactor.Action.viewDidLoad)
              .bind(to: reactor.action)
              .disposed(by: self.disposeBag)
        
        //카테고리 선택 화면으로 이동.
        self.categoryBtn.rx.tap.subscribe(onNext : {result in
            print("카테고리 선택 화면 이동")
            let selectCategory = SellectCategoryVC()
           
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
       
//        imgCollectionView.rx.itemSelected.filter{$0.row == 0} //카메라 버튼만 이벤트 허용
//              .map{Reactor.Action.cellSelected($0)}
//              .bind(to: reactor.action)
//              .disposed(by: disposeBag)
        
        //State
   
        reactor.state
            .map { $0.imageSection }
            .bind(to: imgCollectionView.rx.items(dataSource: dataSource))
            .disposed(by: self.disposeBag)
        
        
        
    }
    
    
    private func addProductImg(){
        let imagePicker = ImagePickerController()
            imagePicker.settings.selection.max = 5
            imagePicker.settings.fetch.assets.supportedMediaTypes = [.image]
                
        let vc = self//.window?.rootViewController
                
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
                self.selectedAssets = []
//                self.userSelectedImages = []
                 //self.delegate?.didPickImagesToUpload(images: self.userSelectedImages)
             })
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
                    
                    let data = thumbnail.jpegData(compressionQuality: 0.7)
                    let newImage = UIImage(data: data!)
                    //updateList(newImage! as UIImage)
                    self.userSelectedImages.append(newImage! as UIImage)
                    

                }
            }
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

