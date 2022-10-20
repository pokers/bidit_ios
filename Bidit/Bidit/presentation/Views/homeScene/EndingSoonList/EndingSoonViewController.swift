//
//  EndingSoonViewController.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/06/16.
//

import Foundation
import UIKit
import ReactorKit
import Differentiator
import RxDataSources
import RxSwift
import RxCocoa


class EndingSoonViewController : UIViewController, View, UIScrollViewDelegate{
    
    var disposeBag: DisposeBag = DisposeBag()
    typealias Reactor = EndingSoonReactor
    var homeVC : HomeViewController? = nil
    
//    var isEnableScroll = PublishRelay<Bool>() //view -> ViewModel //로그인 통과 여부 .

   
    
    
    let tableView = UITableView().then {

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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
        self.navigationController?.navigationBar.isHidden = false
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        self.tableView.rx.setDelegate(self)
          .disposed(by: disposeBag)
        
        //extendBind()
        tableView.isScrollEnabled = false
        
    }
    
    private func layout(){
        view.addSubview(tableView)
        tableView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(40)
            $0.trailing.leading.bottom.equalToSuperview()
            $0.height.equalTo(1000)
        }
    }
    private func attribute(){
        
    }

    
    
    
    
    func bind(reactor: EndingSoonReactor) {
      //  Action
        
        self.rx.viewDidAppear
            .map{_ in Reactor.Action.viewDidLoad}
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
        
        self.rx.viewWillAppear.subscribe(onNext : {_ in
            self.tableView.reloadData()
        }).disposed(by: disposeBag)
        
        
        tableView.rx.itemSelected //아이템 클릭
            .map{Reactor.Action.cellSelected($0)}
            .bind(to: reactor.action)
            .disposed(by: disposeBag)

        //State
        reactor.state
            .map {
                var count = 0
                if $0.itemSection.count > 0 {
                    count = $0.itemSection[0].items.count
                    //테이블뷰 컨테이너 크기 재조정
                    self.homeVC?.tabbarContainer.snp.makeConstraints{
                        $0.top.equalToSuperview().offset(535)
                        $0.leading.trailing.equalToSuperview()
                        $0.width.equalToSuperview()
                        $0.height.equalTo(140 * count + 120)
                        $0.bottom.equalToSuperview()
                    }
                    //테이블뷰 크기 재조정.
                    self.tableView.snp.makeConstraints{
                        $0.top.equalToSuperview().offset(40)
                        $0.trailing.leading.bottom.equalToSuperview()
                        $0.height.equalTo(140 * count)
                    }
                }
                return $0.itemSection
            }
            .bind(to: self.tableView.rx.items(dataSource: dataSource))
            .disposed(by: self.disposeBag)
        
        reactor.state.map{ $0.selectedIndexPath}
            .compactMap{$0}
            .subscribe(onNext : { [weak self] indexPath in
                let vc = ItemBuyDetailViewController()//ItemListViewController()
                
                let detailReactor = ItemBuyDetailReactor(itemId: reactor.itemList[indexPath.row].id) // 수정 전 
                
                vc.currItem = Item()
                vc.reactor = detailReactor
               
                self?.tabBarController?.tabBar.isHidden = true
                self?.navigationController?.navigationBar.isHidden = false
                self?.navigationController?.pushViewController(vc, animated: true)
                guard let self = self else { return }
                self.tableView.deselectRow(at: indexPath, animated: true)
            }).disposed(by: disposeBag)
        
        
    }
}



enum ProductListSection{
    case first([ProductListSectionItem])
}
enum ProductListSectionItem{
    case item(EndingSoonCellReactor)
}

extension ProductListSection : SectionModelType{
    var items : [ProductListSectionItem]{
        switch self{
        case .first(let items) : return items
        }
    }
    
    init(original: ProductListSection, items: [ProductListSectionItem]) {
        switch original {
        case .first : self = .first(items)
        }
    }
}
