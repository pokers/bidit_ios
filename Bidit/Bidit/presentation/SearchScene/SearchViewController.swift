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
class SearchViewController : UIViewController, View{
    
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
    
    
    //최신순 인기순 마감임박
    
    let containerSearchResult = UIView()
    
    let filterTitle = UILabel()
    
    let leftFilterBtn = UIButton()
    
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
        
        
        
    }
    
    func layout(){
        
        //네비게이션바 쪽
        setSearchBar()
        setBackBtn()
        
        //스크롤뷰
        self.view.addSubview(scrollView)
        
        scrollView.snp.makeConstraints{
            $0.width.equalToSuperview()
            $0.top.bottom.equalToSuperview()
        }
        
        //최근검색어
        self.scrollView.addSubview(containerRecentKeyword)
        containerRecentKeyword.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview().inset(18)
            $0.top.equalToSuperview()
            $0.width.equalTo(scrollView.snp.width)
            $0.height.equalTo(163)
        }
        containerRecentKeyword.addSubview(recentKeywordTitle)
        recentKeywordTitle.snp.makeConstraints{ //최금검색어 타이틀
            $0.top.leading.equalToSuperview()
        }
        containerRecentKeyword.addSubview(recentKeyDeleteAll)
        recentKeyDeleteAll.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.trailing.equalTo(containerRecentKeyword.snp.trailing)
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
            $0.leading.equalToSuperview()
        }
        recentDeleteBtn1.snp.makeConstraints{
            $0.trailing.centerY.equalToSuperview()
            $0.width.height.equalTo(8)
        }
        
        
        recentKeyGroup2.addSubview(recentKeyBtn2)
        recentKeyGroup2.addSubview(recentDeleteBtn2)
        recentKeyBtn2.snp.makeConstraints{
            $0.top.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        recentDeleteBtn2.snp.makeConstraints{
            $0.trailing.centerY.equalToSuperview()
            $0.width.height.equalTo(8)
        }
        
        recentKeyGroup3.addSubview(recentKeyBtn3)
        recentKeyGroup3.addSubview(recentDeleteBtn3)
        recentKeyBtn3.snp.makeConstraints{
            $0.top.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        recentDeleteBtn3.snp.makeConstraints{
            $0.trailing.centerY.equalToSuperview()
            $0.width.height.equalTo(8)
        }
        
        //검색 결과
        self.scrollView.addSubview(containerSearchResult)
        self.containerSearchResult.addSubview(filterTitle)
        self.containerSearchResult.addSubview(leftFilterBtn)
        self.containerSearchResult.addSubview(resultTableView)
        
        containerSearchResult.snp.makeConstraints{// 컨테이너
            $0.leading.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(200)// 임시 -
            
            $0.top.equalTo(containerRecentKeyword.snp.bottom)
        }
        filterTitle.snp.makeConstraints{ //필터 타이틀
            $0.top.equalToSuperview().inset(18)
            $0.leading.equalToSuperview()
            
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
        
        //최근 검색 제품
        self.scrollView.addSubview(containerRecentProduct)
        self.containerRecentProduct.addSubview(recentProductTitle)
        self.containerRecentProduct.addSubview(recentProductTableView)
        
        containerRecentProduct.snp.makeConstraints{// 컨테이너
            $0.width.equalToSuperview()
            $0.height.equalTo(200)// 임시 -
            $0.leading.equalToSuperview()
            $0.top.equalTo(containerSearchResult.snp.bottom)
        }
        recentProductTitle.snp.makeConstraints{ //최근 검색 타이틀
            $0.top.equalToSuperview().inset(18)
            $0.leading.equalToSuperview()
            
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
        
    }
    
    
    
}
