//
//  SalesHistoryVC.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/22.
//

import Foundation
import UIKit
import ReactorKit
import RxDataSources
//내 거래
//판매내역 뷰
class SalesHistoryVC : UIViewController, View{
    
    
    var disposeBag = DisposeBag()
    typealias Reactor = SalesHistoryReactor
   
    
    //테이블 뷰
    private let tableView = UITableView().then {
        $0.register(cellType: EndingSoonCell.self)
        $0.backgroundColor = .white
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
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        layout()
    }
    
    
    func bind(reactor: SalesHistoryReactor) {
        self.rx.viewDidLoad // 뷰 로드
            .mapVoid()
            .map(Reactor.Action.viewDidLoad)
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
        //테이블뷰 datasource 바인딩
        reactor.state
              .map { $0.itemSection }
              .bind(to: self.tableView.rx.items(dataSource: dataSource))
              .disposed(by: self.disposeBag)
        //테이블뷰 셀 클릭
        reactor.state.map{ $0.selectedIndexPath}
            .compactMap{$0}
            .subscribe(onNext : { [weak self] indexPath in
               
                guard let self = self else { return }
                print("cell clicked")
                //구매자 아이템 디테일 화면
                var itemDetailVC = ItemBuyDetailViewController()
                itemDetailVC.reactor = ItemBuyDetailReactor(item: reactor.itemList[indexPath.row]) //수정 필요
                print("\(reactor.itemList[indexPath.row]) indexpath is ")
                itemDetailVC.currItem = reactor.itemList[indexPath.row]
                self.tabBarController?.tabBar.isHidden = true
                self.navigationController?.navigationBar.isHidden = false
                self.navigationController?.pushViewController(itemDetailVC, animated: true)
                self.tableView.deselectRow(at: indexPath, animated: true)
            }).disposed(by: disposeBag)
    }
    

    private func layout(){
        //테이블뷰
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalToSuperview()
            
            $0.bottom.equalToSuperview()
        }
    }
    
}
