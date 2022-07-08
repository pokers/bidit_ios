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
        $0.backgroundColor = .systemBackground
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
    
    let filterTitle = UILabel()
    
    let leftFilterBtn = UIButton()
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
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.view.backgroundColor = .systemBackground
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
            $0.height.equalTo(111)
        }
        recentKeywordStackView.axis = .vertical
        recentKeywordStackView.spacing = 24
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
        
        containerSearchResult.snp.makeConstraints{// 컨테이너
            $0.leading.equalToSuperview()
            $0.width.equalToSuperview()
//            $0.height.equalTo(200)// 임시 -
            
            $0.top.equalTo(containerRecentKeyword.snp.bottom)
        }
        filterTitle.snp.makeConstraints{ //필터 타이틀
            $0.top.equalToSuperview().inset(18)
            $0.leading.equalToSuperview().inset(18)
            
        }
        leftFilterBtn.snp.makeConstraints{
            $0.leading.equalTo(filterTitle.snp.trailing).offset(6)
            $0.width.equalTo(10)
            $0.height.equalTo(5)
            $0.centerY.equalTo(filterTitle.snp.centerY)
        }
        
        resultTableView.snp.makeConstraints{
            $0.top.equalTo(filterTitle.snp.bottom).offset(8)
            $0.width.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        emptyImage.snp.makeConstraints{ //빈 리스트 이미지
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(53)
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
    
    func attribute(){
        self.recentKeywordTitle.text = "최근 검색어"
        self.recentKeywordTitle.font = .systemFont(ofSize: 16, weight: .bold)
        
        //모두 지우기 버튼
        recentKeyDeleteAll.setTitle("모두 지우기", for: .normal)
        recentKeyDeleteAll.titleLabel?.font = .systemFont(ofSize: 10, weight: .medium)
        recentKeyDeleteAll.setTitleColor(.gray, for: .normal)
        
        
        //최근검색어123
        recentKeyBtn1.setTitle("최근검색어1", for: .normal)
        recentKeyBtn1.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        recentDeleteBtn1.setImage(UIImage(systemName: "xmark"), for: .normal)
        recentDeleteBtn1.tintColor = .gray
        recentKeyBtn1.setTitleColor( .black, for: .normal)
        
        recentKeyBtn2.setTitle("최근검색어2", for: .normal)
        recentDeleteBtn2.setImage(UIImage(systemName: "xmark"), for: .normal)
        recentKeyBtn2.setTitleColor( .black, for: .normal)
        recentKeyBtn2.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        recentDeleteBtn2.tintColor = .gray
        
        recentKeyBtn3.setTitle("최근검색어3", for: .normal)
        recentDeleteBtn3.setImage(UIImage(systemName: "xmark"), for: .normal)
        recentKeyBtn3.setTitleColor( .black, for: .normal)
        recentKeyBtn3.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        recentDeleteBtn3.tintColor = .gray
        
        //검색 결과
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
        let barButtonItem = UIBarButtonItem(customView: backButtonView)
        self.navigationItem.leftBarButtonItem = barButtonItem
    }
    
    func bind(reactor: SearchReactor) {

        //Action
            //첫화면 불러왔을 때 -> 최근 검색어 및 검색제품 불러오기
        self.rx.viewDidLoad
              .mapVoid()
              .map(Reactor.Action.viewDidLoad)
              .bind(to: reactor.action)
              .disposed(by: self.disposeBag)
        
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
            .map(Reactor.Action.tapSearchBtn(inputKeyword))
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
        
        
        
        
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
        
        reactor.state
            .filter{ $0.resultItemSection.count > 0}
            .map{ $0.resultItemSection }
            .subscribe(onNext : { result in
                
                
                if result[0].items.count > 0{
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
                    }
                    
                    print("result.count : \(result.count)")
                    print("result[0].items.count : \(result[0].items.count)")
                }else {
                    //아이템이 없을 때
                    self.emptyImage.isHidden = false
                    
                    self.containerSearchResult.snp.makeConstraints{
                        
                        $0.leading.equalToSuperview()
                        $0.width.equalToSuperview()
                        $0.top.equalTo(self.containerRecentKeyword.snp.bottom)
                        $0.height.equalTo(260)
                        $0.bottom.equalToSuperview()
                    }

                    self.resultTableView.snp.makeConstraints{
                        $0.height.equalTo(0)
                    }
                    
                }
                
            }).disposed(by: disposeBag)
        
        reactor.state
            .map { $0.recentKeyword }
            .subscribe(onNext : {result in
                if result.count != 0 {
                    let keyTextArray = [self.recentKeyBtn1,self.recentKeyBtn2, self.recentKeyBtn3 ]
                    for i in 0...result.count {
                        if i > 2 {
                            break
                        }
                        keyTextArray[i].setTitle(result[i]  , for: .normal)
                       
                    }
                }
                
                
            })
            .disposed(by: self.disposeBag)
        
        
    }
    
    
    
}
