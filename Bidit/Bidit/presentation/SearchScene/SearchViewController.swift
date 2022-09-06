//
//  SearchViewController.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/06/28.
//

import Foundation
import UIKit
import ReactorKit
import RxDataSources
import SideMenu

//검색 화면 뷰 컨
class SearchViewController : UIViewController, View, UIScrollViewDelegate{
    
    var commitTestVar = 0
    //검색바
    let searchBar = UISearchBar()
    //백 버튼
    let backButtonView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 20))
    let backButton = UIButton()
    
    let scrollView = UIScrollView()
    
    //최근 검색어
    let containerRecentKeyword = UIView()
    let recentKeywordTitle = UILabel()
    let recentKeyDeleteAll = UIButton()
    let recentKeywordStackView = UIStackView()
    
    let recentKeyBtn1 = UIButton()
    let recentDeleteBtn1 = UIButton()
    let recentKeyGroup1 = UIView()
    
    let recentKeyBtn2 = UIButton()
    let recentDeleteBtn2 = UIButton()
    let recentKeyGroup2 = UIView()
    
    let recentKeyBtn3 = UIButton()
    let recentDeleteBtn3 = UIButton()
    let recentKeyGroup3 = UIView()
    
    //최근 검색 제품
    let containerRecentProduct = UIView()
    let recentProductTitle = UILabel()
    let recentProductTableView = UITableView().then {
        $0.register(cellType: EndingSoonCell.self)
        $0.backgroundColor = .white
        $0.rowHeight = 140
    }
    
    var recentDataSource = RxTableViewSectionedReloadDataSource<ProductListSection> { dataSource, tableView, indexPath, sectionItem in
        switch sectionItem {
    
        case .item(let reactor):
            let cell = tableView.dequeueReusableCell(for: indexPath) as EndingSoonCell
            cell.reactor = reactor
            return cell
        }
    }
    
    
    //최신순 인기순 마감임박 / 검색결과
    
    let containerSearchResult = UIView()
    
    var subToolBarContainer = UIView() //상단 툴바
    var sortLabel = UILabel() // 최신순 글자.
    var sortButton = UIButton() // 정렬 기준 버튼
    var filterButton = UIButton()// 필터 버튼
    
    //정렬
    //var sortBackgroundBtn = UIButton() //정렬 버튼 배경 버튼
    var sortContainer = UIView()
    var sortList = UIImageView(image: UIImage(named: "balloonFilterImg"))
    var popularityBtn = UIButton() //인기순
    var endingSoonBtn = UIButton() //마감순
    var latestBtn = UIButton() // 최신순
    
    //임시
    let filterTitle = UILabel()
    let leftFilterBtn = UIButton()
    //비어있을 때 이미지
    let emptyImage = UIImageView()
    
    let resultTableView = UITableView().then {
        $0.register(cellType: EndingSoonCell.self)
        $0.backgroundColor = .systemBackground
        $0.rowHeight = 140
    }

    
    var resultDataSource = RxTableViewSectionedReloadDataSource<ProductListSection> { dataSource, tableView, indexPath, sectionItem in
        switch sectionItem {
    
        case .item(let reactor):
            let cell = tableView.dequeueReusableCell(for: indexPath) as EndingSoonCell
            cell.reactor = reactor
            return cell
        }
    }
    
    //사이드 필터
    var filterVC = SearchDetailFilterVC()
    
    var reactorOfFilter = DetailFilterReactor()
    //filterVC.reactor = DetailFilterReactor()
    var menu : SideMenuNavigationController? = nil
    var appliedFilter = false //상세필터 적용 여부
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.view.backgroundColor = .white
        
        filterVC.reactor = reactorOfFilter
        filterVC.preVC = self
        menu = SideMenuNavigationController(rootViewController: filterVC)
        menu?.menuWidth = 300 //사이드 메뉴 너비 설정
        menu?.presentationStyle = .menuSlideIn
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var disposeBag: DisposeBag  = DisposeBag()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
        attribute()
        //테이블뷰 딜리게이트
        self.recentProductTableView.rx.setDelegate(self)
          .disposed(by: disposeBag)
        self.resultTableView.rx.setDelegate(self)
          .disposed(by: disposeBag)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        layout()
        attribute()
    }
    //레이아웃
    func layout(){
        
        //네비게이션바 쪽
        setSearchBar()
        setBackBtn()
        
        //스크롤뷰
        self.view.addSubview(scrollView)
        
        scrollView.snp.makeConstraints{
            $0.width.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.bottom.equalToSuperview()
        }
        scrollView.showsVerticalScrollIndicator = false
        
        //최근검색어
        self.scrollView.addSubview(containerRecentKeyword)
        containerRecentKeyword.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.width.equalToSuperview()
            $0.top.equalToSuperview().offset(18)
            
            $0.height.equalTo(163)
        }
        containerRecentKeyword.addSubview(recentKeywordTitle)
        recentKeywordTitle.snp.makeConstraints{ //최근검색어 타이틀
            $0.leading.equalToSuperview().offset(18)
            $0.top.equalToSuperview()
        }
        containerRecentKeyword.addSubview(recentKeyDeleteAll)
        recentKeyDeleteAll.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview().inset(18)
        }
        containerRecentKeyword.addSubview(recentKeywordStackView)
        recentKeywordStackView.snp.makeConstraints{
            $0.top.equalTo(recentKeywordTitle.snp.bottom).offset(28)
            $0.width.equalToSuperview()
            $0.height.equalTo(120)
        }
        recentKeywordStackView.axis = .vertical
        recentKeywordStackView.spacing = 24
        recentKeywordStackView.alignment = .top
        recentKeywordStackView.distribution = .equalSpacing
        //스택뷰 크기 불변
        
        recentKeywordStackView.addArrangedSubview(recentKeyGroup1)
        recentKeywordStackView.addArrangedSubview(recentKeyGroup2)
        recentKeywordStackView.addArrangedSubview(recentKeyGroup3)
        
        recentKeyGroup1.snp.makeConstraints{
            $0.width.equalToSuperview()
            $0.height.equalTo(21)
        
        }
        recentKeyGroup2.snp.makeConstraints{
            $0.width.equalToSuperview()
            $0.height.equalTo(21)
        }
        recentKeyGroup3.snp.makeConstraints{
            $0.width.equalToSuperview()
            $0.height.equalTo(21)
        }
        //최근검색어 123
        recentKeyGroup1.addSubview(recentKeyBtn1)
        recentKeyGroup1.addSubview(recentDeleteBtn1)
        recentKeyBtn1.snp.makeConstraints{
            $0.top.bottom.equalToSuperview()
            $0.leading.equalToSuperview().offset(18)
        }
        recentDeleteBtn1.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(18)
            $0.width.height.equalTo(8)
        }
        
        
        recentKeyGroup2.addSubview(recentKeyBtn2)
        recentKeyGroup2.addSubview(recentDeleteBtn2)
        recentKeyBtn2.snp.makeConstraints{
            $0.top.bottom.equalToSuperview()
            $0.leading.equalToSuperview().offset(18)
        }
        recentDeleteBtn2.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(18)
            $0.width.height.equalTo(8)
        }
        
        recentKeyGroup3.addSubview(recentKeyBtn3)
        recentKeyGroup3.addSubview(recentDeleteBtn3)
        recentKeyBtn3.snp.makeConstraints{
            $0.top.bottom.equalToSuperview()
            $0.leading.equalToSuperview().offset(18)
        }
        recentDeleteBtn3.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(18)
            $0.width.height.equalTo(8)
        }
        
        //검색 결과
        self.scrollView.addSubview(containerSearchResult)
        
        self.containerSearchResult.addSubview(filterTitle)
        self.containerSearchResult.addSubview(leftFilterBtn)
        self.containerSearchResult.addSubview(resultTableView)
        self.containerSearchResult.addSubview(emptyImage)
        
        containerSearchResult.snp.makeConstraints{// 컨테이너 설정
            $0.leading.equalToSuperview()
            $0.width.equalToSuperview()
//            $0.height.equalTo(200)// 임시 -
            
            $0.top.equalTo(containerRecentKeyword.snp.bottom)
        }
        
        self.containerSearchResult.addSubview(subToolBarContainer)
        //상단 툴바
        subToolBarContainer.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalToSuperview()
            $0.height.equalTo(36)
        }
        
        
        
        //정렬 텍스트
        subToolBarContainer.addSubview(sortLabel)
        sortLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(18)
            $0.top.equalToSuperview().offset(18)
        }
        //정렬 버튼
        subToolBarContainer.addSubview(sortButton)
        sortButton.snp.makeConstraints{
            $0.leading.equalTo(sortLabel.snp.trailing).offset(8)
            $0.top.equalTo(sortLabel)
            $0.width.height.equalTo(20)
        }
        //정렬리스트 컨테이너
        self.scrollView.addSubview(sortContainer)
        sortContainer.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalToSuperview().offset(-120)
            $0.height.equalTo(UIScreen.main.bounds.height)
        }
        self.sortContainer.addSubview(sortList)
        sortList.snp.makeConstraints{
            $0.top.equalToSuperview().offset(180)
            $0.width.equalTo(120)
            $0.height.equalTo(108)
            $0.leading.equalToSuperview().offset(53)
        }
        //필터 버튼
        subToolBarContainer.addSubview(filterButton)
        filterButton.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(18)
            $0.top.equalToSuperview().offset(21)
            $0.width.height.equalTo(20)
        }
        //sortList.isHidden = true
        //말풍선 필터에 버튼 추가.
        [popularityBtn, endingSoonBtn, latestBtn].forEach{
            sortList.addSubview($0)
        }
        
        popularityBtn.snp.makeConstraints{
            $0.top.equalToSuperview().offset(14)
            $0.width.equalTo(34)
            $0.height.equalTo(18)
            $0.leading.equalToSuperview().offset(12)
            
        }
        endingSoonBtn.snp.makeConstraints{
            $0.top.equalTo(popularityBtn.snp.bottom).offset(12)
            $0.width.equalTo(42)
            $0.height.equalTo(18)
            $0.leading.equalToSuperview().offset(12)
        }
        latestBtn.snp.makeConstraints{
            $0.top.equalTo(endingSoonBtn.snp.bottom).offset(12)
            $0.width.equalTo(34)
            $0.height.equalTo(18)
            $0.leading.equalToSuperview().offset(12)
        }
        
        sortLabel.text = "최신순"
        sortLabel.font = .systemFont(ofSize: 16, weight: .bold)
        
        //sortButton.imageView?.image -> 잘못된 이미지 설정
        sortButton.setImage( UIImage(systemName: "chevron.down"), for: .normal)
        sortButton.tintColor = .black
        filterButton.setImage(UIImage(named: "filterImg"), for: .normal)
        
        //sortList.isHidden = true // 정렬필터 누르기 전 가리기.
        
//        self.tabBarController?.tabBar.isHidden = true
        sortList.isUserInteractionEnabled = true
        popularityBtn.setTitle("인기순", for: .normal)
        popularityBtn.titleLabel?.font = .systemFont(ofSize: 12, weight: .medium)
        popularityBtn.setTitleColor(.gray, for: .normal)
        popularityBtn.isUserInteractionEnabled = true
        endingSoonBtn.setTitle("마감임박", for: .normal)
        endingSoonBtn.titleLabel?.font = .systemFont(ofSize: 12, weight: .medium)
        endingSoonBtn.setTitleColor(.gray, for: .normal)
        endingSoonBtn.isUserInteractionEnabled = true
        latestBtn.setTitle("최신순", for: .normal)
        latestBtn.titleLabel?.font = .systemFont(ofSize: 12, weight: .medium)
        latestBtn.setTitleColor(.gray, for: .normal)
        
        latestBtn.isUserInteractionEnabled = true
        
        
//        //적용 전 필터
//        filterTitle.snp.makeConstraints{ //필터 타이틀
//            $0.top.equalToSuperview().inset(18)
//            $0.leading.equalToSuperview().inset(18)
//
//        }
//        leftFilterBtn.snp.makeConstraints{
//            $0.leading.equalTo(filterTitle.snp.trailing).offset(6)
//            $0.width.equalTo(10)
//            $0.height.equalTo(5)
//            $0.centerY.equalTo(filterTitle.snp.centerY)
//        }
        
        resultTableView.snp.makeConstraints{
            $0.top.equalTo(subToolBarContainer.snp.bottom).offset(8)
            $0.width.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        emptyImage.snp.makeConstraints{ //빈 리스트 이미지
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(60)
            $0.width.equalTo(120)
            $0.height.equalTo(110)
        }
        
        //최근 검색 제품
        self.scrollView.addSubview(containerRecentProduct)
        self.containerRecentProduct.addSubview(recentProductTitle)
        self.containerRecentProduct.addSubview(recentProductTableView)
        
        containerRecentProduct.snp.makeConstraints{// 컨테이너
            $0.width.equalToSuperview()
            $0.height.equalTo(200)// 임시 -
            $0.leading.equalToSuperview()
            $0.top.equalTo(containerSearchResult.snp.bottom)
            $0.bottom.equalToSuperview()
        }
        containerRecentProduct.isHidden = true
        recentProductTitle.snp.makeConstraints{ //최근 검색 타이틀
            $0.top.equalToSuperview().inset(18)
            $0.leading.equalToSuperview().inset(18)
            
        }
        recentProductTableView.snp.makeConstraints{
            $0.top.equalTo(recentProductTitle.snp.bottom).offset(8)
            $0.width.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
    }
    
    @objc func sortBackgroundTapped(sender: UITapGestureRecognizer) {
        sortContainer.isHidden = true
        self.sortButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
     
    }
    
    func attribute(){
        
        //정렬 리스트 배경 불투명화
        sortContainer.backgroundColor = .gray
        //sortList.backgroundColor = .white
        sortContainer.alpha = 0.2
        sortContainer.isHidden = true
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(sortBackgroundTapped))
        sortContainer.addGestureRecognizer(tapGestureRecognizer)
        
        
        
        self.recentKeywordTitle.text = "최근 검색어"
        self.recentKeywordTitle.font = .systemFont(ofSize: 16, weight: .bold)
        
        //모두 지우기 버튼
        recentKeyDeleteAll.setTitle("모두 지우기", for: .normal)
        recentKeyDeleteAll.titleLabel?.font = .systemFont(ofSize: 10, weight: .medium)
        recentKeyDeleteAll.setTitleColor(.gray, for: .normal)
        
        
        //최근검색어123
        recentKeyBtn1.setTitle("최근검색어1", for: .normal)
        recentKeyBtn1.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        recentKeyBtn1.isHidden = true
        recentDeleteBtn1.setImage(UIImage(systemName: "xmark"), for: .normal)
        recentDeleteBtn1.isHidden = true
        recentDeleteBtn1.tintColor = .gray
        recentKeyBtn1.setTitleColor( .black, for: .normal)
        
        recentKeyBtn2.setTitle("최근검색어2", for: .normal)
        recentKeyBtn2.isHidden = true
        recentDeleteBtn2.setImage(UIImage(systemName: "xmark"), for: .normal)
        recentDeleteBtn2.isHidden = true
        recentKeyBtn2.setTitleColor( .black, for: .normal)
        recentKeyBtn2.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        recentDeleteBtn2.tintColor = .gray
        
        recentKeyBtn3.setTitle("최근검색어3", for: .normal)
        recentKeyBtn3.isHidden = true
        recentDeleteBtn3.setImage(UIImage(systemName: "xmark"), for: .normal)
        recentKeyBtn3.setTitleColor( .black, for: .normal)
        recentDeleteBtn3.isHidden = true
        recentKeyBtn3.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        recentDeleteBtn3.tintColor = .gray
        
        //검색 결과
        containerSearchResult.isHidden = true
        filterTitle.text = "최신순"
        self.filterTitle.font = .systemFont(ofSize: 16, weight: .bold)
        leftFilterBtn.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        
        leftFilterBtn.tintColor = .black
        emptyImage.image = UIImage(named: "blackhole_img")
        emptyImage.isHidden = true
        
        //최근 검색 젶
        recentProductTitle.text = "최근 검색 제품"
        self.recentProductTitle.font = .systemFont(ofSize: 16, weight: .bold)
        
    }
    
    func setSearchBar(){
        //검색바
        
        searchBar.placeholder = "검색어를 입력해주세요"
        self.navigationItem.titleView = searchBar
    }
    
    func setBackBtn(){
        //왼쪽 백버튼
        
        backButtonView.addSubview(backButton)
        backButton.snp.makeConstraints{
           
            $0.trailing.leading.equalToSuperview()
            $0.top.bottom.equalToSuperview()
        }
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.tintColor = .gray
        let barButtonItem = UIBarButtonItem(customView: backButtonView)
        self.navigationItem.leftBarButtonItem = barButtonItem
    }
    
    func bind(reactor: SearchReactor) {

        //Action
            //첫화면 불러왔을 때 -> 최근 검색어 및 검색제품 불러오기
        self.rx.viewWillAppear
              .mapVoid()
              .map{Reactor.Action.viewDidLoad}
              .bind(to: reactor.action)
              .disposed(by: self.disposeBag)
   
        self.filterButton.rx.tap //상세필터 열기
            .subscribe(onNext : {
                self.navigationController?.present(self.menu!, animated: true, completion: nil)
            }).disposed(by: self.disposeBag)
        
            //넘겨줄 입력값
        var inputKeyword = "dddd"
        
        self.searchBar.rx.text.map{
            $0?.description ?? ""
        }.subscribe(onNext : { result  in
            inputKeyword = result
            print("inputKeyword : \(inputKeyword)")
        }).disposed(by: disposeBag)
        
            //검색결과 불러오기
        self.searchBar.rx.searchButtonClicked
            .map{Reactor.Action.tapSearchBtn(keyword: inputKeyword)}
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
        

        self.sortButton.rx.tap // 정렬 필터 클릭 액션
            .subscribe(onNext : {
//                self.sortList.isHidden = !self.sortList.isHidden
                self.sortContainer.isHidden = !self.sortContainer.isHidden
                if self.sortContainer.isHidden == true {
                    self.sortButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
                }else{
                    
                    self.sortButton.setImage(UIImage(systemName: "chevron.up"), for: .normal)
                }
            }).disposed(by: disposeBag)
        
        self.popularityBtn.rx.tap //인기순 버튼 클릭
            .map{Reactor.Action.tapPopularityBtn(keyword: inputKeyword)}
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
        
        self.popularityBtn.rx.tap
            .subscribe(onNext : {
                self.sortContainer.isHidden = !self.sortContainer.isHidden
                if self.sortContainer.isHidden == true {
                    self.sortButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
                }else{
                    
                    self.sortButton.setImage(UIImage(systemName: "chevron.up"), for: .normal)
                }
            }).disposed(by: disposeBag)
        
        self.endingSoonBtn.rx.tap //마감직전 버튼 클릭
            .map{Reactor.Action.tapEndingSoonBtn(keyword: inputKeyword)}
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
        self.endingSoonBtn.rx.tap
            .subscribe(onNext : {
                self.sortContainer.isHidden = !self.sortContainer.isHidden
                if self.sortContainer.isHidden == true {
                    self.sortButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
                }else{
                    
                    self.sortButton.setImage(UIImage(systemName: "chevron.up"), for: .normal)
                }
            }).disposed(by: disposeBag)
        
        self.latestBtn.rx.tap //최신순 버튼 클릭
            .map{Reactor.Action.tapLatestBtn(keyword: inputKeyword)}
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
        
        self.latestBtn.rx.tap
            .subscribe(onNext : {
                self.sortContainer.isHidden = !self.sortContainer.isHidden
                if self.sortContainer.isHidden == true {
                    self.sortButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
                }else{
                    
                    self.sortButton.setImage(UIImage(systemName: "chevron.up"), for: .normal)
                }
            }).disposed(by: disposeBag)
        
        //필터 적용 시점.(필터 활성화 appliedFilter)
        //필터 닫힐때
        self.menu!.rx.viewDidDisappear
            .filter{_ in self.appliedFilter}
            .map{_ in
               
                var deliveryType = 0
                if self.filterVC.availDirect == true && self.filterVC.availPost == true {
                    deliveryType = 2
                }else if self.filterVC.availPost == false && self.filterVC.availDirect == true{
                    deliveryType = 0
                }else if self.filterVC.availPost == true && self.filterVC.availDirect == false{
                    deliveryType = 1
                }else if self.filterVC.availPost == false && self.filterVC.availDirect == false{
                    deliveryType = 4 //없음.
                }
                print("필터 적용 \(deliveryType)")
                let minPeriod = Int(self.filterVC.minPeriodText.text!) ?? 0
                let maxPeriod = Int(self.filterVC.maxPeriodText.text!) ?? 0
                let minStartPrice = Int(self.filterVC.minStartPrice.text!) ?? 0
                let maxStartPrice = Int(self.filterVC.maxStartPrice.text!) ?? 0
                let minInstantPrice = Int(self.filterVC.minInstantPrice.text!) ?? 0
                let maxInstantPrice = Int(self.filterVC.maxInstantPrice.text!) ?? 0
                let keyStr = self.searchBar.text ?? "" //키워드
                
                self.appliedFilter = false //필터 활성화 다시 꺼두기
                
                return Reactor.Action.disappearFilter(deliveryType: deliveryType,
                                                      minPeriod: minPeriod,
                                                      maxPeriod: maxPeriod,
                                                      minStartPrice: minStartPrice,
                                                      maxStartPrice: maxStartPrice,
                                                      minInstantPrice: minInstantPrice,
                                                      maxInstantPrice: maxInstantPrice,
                                                      keyword: keyStr
                )
                
            }
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
        
        
        
        
        
//        reactor.state
//            .map{ $0.isSortListOpened}
//            .subscribe(onNext : { isOpened in
//
//                self.sortList.isHidden = !self.sortList.isHidden
//                if self.sortList.isHidden == true {
//                    self.sortButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
//                }else{
//
//                    self.sortButton.setImage(UIImage(systemName: "chevron.up"), for: .normal)
//                }
//
//
//            })
//            .disposed(by: disposeBag)
        
        reactor.state
            .map{$0.sortState}
            .subscribe(onNext : { sortState in
                
                switch(sortState){
                case .null:
                    self.sortLabel.text = ""
                case .popularity :
                    self.sortLabel.text = "인기순"
                case .endingSoon :
                    self.sortLabel.text = "마감직전"
                case .latest :
                    self.sortLabel.text = "최신순"
                }
                
            }).disposed(by: self.disposeBag)
        
        
        self.backButton.rx.tap
            .subscribe(onNext : {
                self.tabBarController?.selectedIndex = 2 // 홈화면으로 이동.
            }).disposed(by: disposeBag)
        
        //모두 지우기
        self.recentKeyDeleteAll.rx.tap
            .subscribe(onNext : {
                let isDeleted = CoreDataManager.shared.deleteAll(request: RecentSearchTerm.fetchRequest())
                self.recentKeywordStackView.isHidden = true
                print("삭제 여부 \(isDeleted)")
            }).disposed(by: disposeBag)
        //최근 검색 키워드 클릭 이벤트
        self.recentKeyBtn1.rx.tap
            .map{Reactor.Action.tapSearchBtn(keyword: self.recentKeyBtn1.titleLabel!.text ?? "")}
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
        self.recentKeyBtn1.rx.tap.subscribe(onNext : {
            self.searchBar.text = self.recentKeyBtn1.titleLabel!.text
        }).disposed(by: disposeBag)
        
        self.recentKeyBtn2.rx.tap
            .map{Reactor.Action.tapSearchBtn(keyword: self.recentKeyBtn2.titleLabel!.text ?? "")}
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
        self.recentKeyBtn2.rx.tap.subscribe(onNext : {
            self.searchBar.text = self.recentKeyBtn2.titleLabel!.text
        }).disposed(by: disposeBag)
        
        self.recentKeyBtn3.rx.tap
            .map{Reactor.Action.tapSearchBtn(keyword: self.recentKeyBtn3.titleLabel!.text ?? "")}
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
        self.recentKeyBtn3.rx.tap.subscribe(onNext : {
            self.searchBar.text = self.recentKeyBtn3.titleLabel!.text
        }).disposed(by: disposeBag)
        
        var keywordCount = 0
        
        
        
        //최근 검색 키워드 삭제
        self.recentDeleteBtn1.rx.tap
            .subscribe(onNext : {
                let keyword = self.recentKeyBtn1.titleLabel?.text ?? ""
                let isDeleted = CoreDataManager.shared.delete(keyword : keyword, request: RecentSearchTerm.fetchRequest())
                
                self.recentKeyGroup1.isHidden = true
                keywordCount-=1
                self.recentKeywordStackView.snp.makeConstraints{
                    $0.top.equalTo(self.recentKeywordTitle.snp.bottom).offset(28)
                    $0.width.equalToSuperview()
                    $0.height.equalTo(keywordCount * 40)
                }
                
                print("삭제 여부 \(isDeleted)")
//                self.recentKeywordStackView.snp.makeConstraints{
//                    $0.height.equalTo(self.recentKeywordStackView.snp.height).inset(21)
//                }
            }).disposed(by: disposeBag)
        
        self.recentDeleteBtn2.rx.tap
            .subscribe(onNext : {
                let keyword = self.recentKeyBtn2.titleLabel?.text ?? ""
                let isDeleted = CoreDataManager.shared.delete(keyword : keyword, request: RecentSearchTerm.fetchRequest())
                
                self.recentKeyGroup2.isHidden = true
                keywordCount-=1
                self.recentKeywordStackView.snp.makeConstraints{
                    $0.top.equalTo(self.recentKeywordTitle.snp.bottom).offset(28)
                    $0.width.equalToSuperview()
                    $0.height.equalTo(keywordCount * 40)
                }
                
                print("삭제 여부 \(isDeleted)")
//                self.recentKeywordStackView.snp.makeConstraints{
//                    $0.height.equalTo(self.recentKeywordStackView.snp.height).inset(21)
//                }
            }).disposed(by: disposeBag)
        
        self.recentDeleteBtn3.rx.tap
            .subscribe(onNext : {
                let keyword = self.recentKeyBtn3.titleLabel?.text ?? ""
                let isDeleted = CoreDataManager.shared.delete(keyword : keyword, request: RecentSearchTerm.fetchRequest())
             
                self.recentKeyGroup3.isHidden = true
                keywordCount-=1
                self.recentKeywordStackView.snp.makeConstraints{
                    $0.top.equalTo(self.recentKeywordTitle.snp.bottom).offset(28)
                    $0.width.equalToSuperview()
                    $0.height.equalTo(keywordCount * 40)
                }
                
//                self.recentKeywordStackView.snp.makeConstraints{
//                    $0.height.equalTo(self.recentKeywordStackView.snp.height).inset(21)
//                }
                
                print("삭제 여부 \(isDeleted)")
            }).disposed(by: disposeBag)
        
        
        
        //State
            //최근 검색제품 리스트
        reactor.state
            .map { $0.recentItemSection }
            .bind(to: self.recentProductTableView.rx.items(dataSource: recentDataSource))
            .disposed(by: self.disposeBag)
        
            //검색 결과 리스트
        reactor.state
            .map { $0.resultItemSection}
            .bind(to: self.resultTableView.rx.items(dataSource: resultDataSource))
            .disposed(by: self.disposeBag)
//        //아무것도 없을 때
//        reactor.state
//            .filter{ $0.resultItemSection.count == 0}
//            .map{ $0.resultItemSection }
//            .subscribe(onNext : { result in
//                self.containerSearchResult.isHidden = true
//                self.emptyImage.isHidden = false // 빈 화면 이미지 보여주기
//
//            }).disposed(by: disposeBag)
        
        reactor.state
            .filter{ $0.resultItemSection.count > 0 }
            .map{ $0.resultItemSection }
            .subscribe(onNext : { result in
                
                print("itemList : \(reactor.itemList.count)개")
                
                self.containerSearchResult.isHidden = false // 검색결과 보이기
                if reactor.itemList.count > 0{

                    self.emptyImage.isHidden = true
                    self.containerRecentKeyword.isHidden = true
                    
                    self.containerRecentKeyword.snp.makeConstraints{
                        $0.height.equalTo(0)
                    }
                    self.containerRecentProduct.isHidden = true
                    self.containerRecentProduct.snp.makeConstraints{
                        $0.height.equalTo(0)
                    }
                    self.containerSearchResult.snp.makeConstraints{
                        
                        $0.leading.equalToSuperview()
                        $0.width.equalToSuperview()
                        $0.top.equalTo(self.containerRecentKeyword.snp.bottom)
                        $0.height.equalTo(result[0].items.count * 140 + 60)
                        $0.bottom.equalToSuperview()
                    }

                    self.resultTableView.snp.makeConstraints{
                        $0.height.equalTo(result[0].items.count * 140)
                        $0.top.equalTo(self.subToolBarContainer.snp.bottom).offset(8)
                        $0.width.equalToSuperview()
                        $0.bottom.equalToSuperview()
                    }
                    
                    print("result.count : \(result.count)")
                    print("result[0].items.count : \(result[0].items.count)")
                }else {
                    //아이템이 없을 때
                    self.emptyImage.isHidden = false
                
                    self.containerRecentKeyword.isHidden = true
                    self.containerRecentKeyword.snp.makeConstraints{
                        $0.height.equalTo(0)
                    }
                    self.containerSearchResult.isHidden = false // 검색결과 보이기
                    self.containerSearchResult.snp.makeConstraints{
                        
                        $0.leading.equalToSuperview()
                        $0.width.equalToSuperview()
                        $0.top.equalTo(self.containerRecentKeyword.snp.bottom)
                        //$0.height.equalTo(260)
                        $0.bottom.equalToSuperview()
                    }

//                    self.resultTableView.snp.makeConstraints{
//                        $0.height.equalTo(0)
//                    }
                    
                }
                
            }).disposed(by: disposeBag)
        
        //최근 검색 키워드
        reactor.state
            .map { $0.recentKeyword }
            .subscribe(onNext : {result in
                if result.count != 0 {
                    keywordCount = result.count
                    let keyTextArray = [self.recentKeyBtn1,self.recentKeyBtn2, self.recentKeyBtn3 ]
                    let deleteBtnArray = [self.recentDeleteBtn1,self.recentDeleteBtn2,self.recentDeleteBtn3]
                    for i in 0...result.count {
                        if i > 2 {
                            break
                        }else if i == result.count {
                            break
                        }
                        
                        keyTextArray[i].setTitle(result[result.count - i - 1]  , for: .normal)
                        keyTextArray[i].isHidden = false
                        deleteBtnArray[i].isHidden = false
                       
                    }
                }
                
                
            })
            .disposed(by: self.disposeBag)
        
        
        
        
        
        //아이템 클릭
        self.resultTableView.rx.itemSelected
            .map{Reactor.Action.cellSelected($0)}
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        reactor.state.map{ $0.selectedIndexPath}
            .compactMap{$0}
            .subscribe(onNext : { [weak self] indexPath in
                let vc = ItemBuyDetailViewController()//ItemListViewController()
                //let listReactor = ItemListReactor(initialState: ItemListReactor.State.init())
                let detailReactor = ItemBuyDetailReactor(item: reactor.itemList[indexPath.row])
                print("\(reactor.itemList[indexPath.row]) indexpath is ")
                vc.currItem = reactor.itemList[indexPath.row]
                vc.reactor = detailReactor
               // vc.bind(reactor: listReactor)
                self?.tabBarController?.tabBar.isHidden = true
                self?.navigationController?.navigationBar.isHidden = false
                self?.navigationController?.pushViewController(vc, animated: true)
                guard let self = self else { return }
                self.resultTableView.deselectRow(at: indexPath, animated: true)
            }).disposed(by: disposeBag)
        
        
    }
    
    
    
}
