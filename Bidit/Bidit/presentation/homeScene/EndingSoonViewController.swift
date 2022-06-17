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

class EndingSoonViewController : UIViewController, View, UIScrollViewDelegate{
    
    var disposeBag: DisposeBag = DisposeBag()
    typealias Reactor = EndingSoonReactor
    
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        self.tableView.rx.setDelegate(self)
          .disposed(by: disposeBag)
    }
    
    private func layout(){
        view.addSubview(tableView)
        tableView.snp.makeConstraints{
            $0.top.trailing.leading.bottom.equalToSuperview()
            $0.height.equalTo(600)
        }
    }
    private func attribute(){
        
    }
    
    func bind(reactor: EndingSoonReactor) {
      //  Action
        self.rx.viewDidLoad
            .mapVoid()
            .map(Reactor.Action.viewDidLoad)
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
        
        tableView.rx.itemSelected //아이템 클릭
            .map{Reactor.Action.cellSelected($0)}
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        //State
        reactor.state
            .map { $0.itemSection }
            .bind(to: self.tableView.rx.items(dataSource: dataSource))
            .disposed(by: self.disposeBag)
        
        reactor.state.map{ $0.selectedIndexPath}
            .compactMap{$0}
            .subscribe(onNext : { [weak self] indexPath in
                let vc = ItemListViewController()
                let listReactor = ItemListReactor(initialState: ItemListReactor.State.init())
                vc.reactor = listReactor
               // vc.bind(reactor: listReactor)
                self?.navigationController?.pushViewController(vc, animated: true)
                guard let self = self else { return }
                self.tableView.deselectRow(at: indexPath, animated: true)
            }).disposed(by: disposeBag)
    }
    
//
    
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
