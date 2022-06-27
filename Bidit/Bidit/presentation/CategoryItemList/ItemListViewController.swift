//
//  ItemListViewController.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/06/16.
//

import Foundation
import UIKit
import ReactorKit
import RxDataSources
import SideMenu

class ItemListViewController : UIViewController, View, UIScrollViewDelegate{
    
    var disposeBag = DisposeBag()
    
    typealias Reactor = ItemListReactor
    
    var subToolBarContainer = UIView() //상단 툴바
    var sortLabel = UILabel() // 최신순 글자.
    var sortButton = UIButton() // 정렬 기준 버튼
    var filterButton = UIButton()// 필터 버튼
    
    var sortList = UIImageView(image: UIImage(named: "balloonFilterImg"))
    
   // let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(back))
    
    
    var popularityBtn = UIButton()
    var endingSoonBtn = UIButton()
    var latestBtn = UIButton()
    
    private let tableView = UITableView().then {
        $0.register(cellType: EndingSoonCell.self)
        $0.backgroundColor = .systemBackground
        $0.rowHeight = 140
    }
    
    var dataSource = RxTableViewSectionedReloadDataSource<ProductListSection> { dataSource, tableView, indexPath, sectionItem in
        switch sectionItem {
    
        case .item(let reactor):
            let cell = tableView.dequeueReusableCell(for: indexPath) as EndingSoonCell
            cell.reactor = reactor
            return cell
        }
        
    }
    
    //사이드 필터
    var filterVC = DetailFilterViewController()
    var reactorOfFilter = DetailFilterReactor()
    //filterVC.reactor = DetailFilterReactor()
    var menu : SideMenuNavigationController? = nil
    
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        filterVC.reactor = reactorOfFilter
        menu = SideMenuNavigationController(rootViewController: filterVC)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        attribute()
        layout()
        
        
        
        
        
        
    }
    
    
    private func layout(){
        self.view.addSubview(subToolBarContainer)
        //상단 툴바
        subToolBarContainer.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalToSuperview().offset(100)
            $0.height.equalTo(47)
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
        
        subToolBarContainer.addSubview(filterButton)
        filterButton.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(18)
            $0.top.equalToSuperview().offset(21)
            $0.width.height.equalTo(20)
        }
        //테이블뷰
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(subToolBarContainer.snp.bottom)
            $0.bottom.equalToSuperview()
        }
        
        self.view.addSubview(sortList)
        sortList.snp.makeConstraints{
            $0.top.equalTo(subToolBarContainer.snp.bottom)
            $0.width.equalTo(120)
            $0.height.equalTo(100)
            $0.leading.equalToSuperview().offset(44)
        }
        //말풍선 필터에 버튼 추가.
        [popularityBtn, endingSoonBtn, latestBtn].forEach{
            sortList.addSubview($0)
        }
        
        popularityBtn.snp.makeConstraints{
            $0.top.equalToSuperview().offset(10)
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
        
        
        
        
        
        
    }
    
    
    private func attribute(){
       
        //self.navigationItem.leftBarButtonItem = backButton
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = . gray
        self.navigationController?.navigationBar.isHidden = false
        self.title = "카테고리"
        
        self.tabBarController?.tabBar.isHidden = true
        
        sortLabel.text = "최신순"
        sortLabel.font = .systemFont(ofSize: 16, weight: .bold)
        
        //sortButton.imageView?.image -> 잘못된 이미지 설정
        sortButton.setImage( UIImage(systemName: "chevron.down"), for: .normal)
        sortButton.tintColor = .black
        filterButton.setImage(UIImage(named: "filterImg"), for: .normal)
        
        sortList.isHidden = false // 정렬필터 누르기 전 가리기.
        
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
        
        //오른쪽 사이드 메뉴 추가.
        SideMenuManager.default.rightMenuNavigationController = menu
        menu!.menuWidth = 300 //사이드 메뉴 너비 설정
    
        
    }
    
    func bind(reactor: ItemListReactor) {
        
        self.tableView.rx.setDelegate(self)
          .disposed(by: disposeBag)
        
        //  Action
          self.rx.viewDidLoad // 뷰 로드
              .mapVoid()
              .map(Reactor.Action.viewDidLoad)
              .bind(to: reactor.action)
              .disposed(by: self.disposeBag)
        
        tableView.rx.itemSelected //아이템 클릭 액션
            .map{Reactor.Action.cellSelected($0)}
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        self.sortButton.rx.tap // 정렬 필터 클릭 액션
            .map(Reactor.Action.tapSortButton(isOpened: !self.sortList.isHidden)) //처음에 가려진 상태 -> 열리지 않음(false)전달
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
          
        self.popularityBtn.rx.tap //인기순 버튼 클릭
            .map(Reactor.Action.tapPopularityBtn)
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
        
        self.endingSoonBtn.rx.tap //마감직전 버튼 클릭
            .map(Reactor.Action.tapEndingSoonBtn)
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
        self.latestBtn.rx.tap //최신순 버튼 클릭
            .map(Reactor.Action.tapLatestBtn)
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
        
        self.filterButton.rx.tap //상세 필터 버튼클릭
            .map(Reactor.Action.tapFilterBtn)
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
        
        self.menu!.rx.viewWillDisappear
            .map(Reactor.Action.disappearFilter)
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
        
        
        //State
          
        reactor.state
              .map { $0.itemSection }
              .bind(to: self.tableView.rx.items(dataSource: dataSource))
              .disposed(by: self.disposeBag)
        
        reactor.state.map{ $0.selectedIndexPath}
            .compactMap{$0}
            .subscribe(onNext : { [weak self] indexPath in
               
                guard let self = self else { return }
                self.tableView.deselectRow(at: indexPath, animated: true)
            }).disposed(by: disposeBag)
        
        reactor.state
            .map{ $0.isSortListOpened}
            .subscribe(onNext : { isOpened in

                self.sortList.isHidden = !self.sortList.isHidden
                if self.sortList.isHidden == true {
                    self.sortButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
                }else{
                    
                    self.sortButton.setImage(UIImage(systemName: "chevron.up"), for: .normal)
                }
                
                
            })
            .disposed(by: disposeBag)
        
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
        
        reactor.state
            .map{$0.isFilterOpened}
            .subscribe(onNext : { isOpened in
                if isOpened == true{
                    self.present(self.menu!, animated: true, completion: nil)
                }
                
            }).disposed(by: self.disposeBag)
    }
     
    
   // @objc func back(){
   //     self.navigationController?.popViewController(animated: true)
   // }
}
