//
//  ItemDetailBiddingListCell.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/06/25.
//

import Foundation
import ReactorKit
import Reusable
import RxDataSources


//입찰 내역 뷰
class ItemDetailBiddingListCell : UITableViewCell, View, Reusable, UIScrollViewDelegate{
    typealias Reactor = ItemDetailBiddingListCellReactor
    
    // MARK: - Property
    var disposeBag = DisposeBag()
    
    let cellTitle = UILabel()
    
    private let tableView = UITableView().then {
        $0.register(cellType: BiddingListCellOfCell.self)
        $0.backgroundColor = .systemBackground
        $0.rowHeight = 64
        
    }
    var dataSource = RxTableViewSectionedReloadDataSource<BiddingListSection> { dataSource, tableView, indexPath, sectionItem in
        switch sectionItem {
    
        case .item(let reactor):
            let cell = tableView.dequeueReusableCell(for: indexPath) as BiddingListCellOfCell
            cell.reactor = reactor
            return cell
        }
        
    }
    
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        

        layout()
        attribute()
        
        self.tableView.rx.setDelegate(self)
          .disposed(by: disposeBag)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func layout(){
        
        self.contentView.addSubview(cellTitle)
        cellTitle.snp.makeConstraints{
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(18)
        }
        self.contentView.addSubview(tableView)
        tableView.snp.makeConstraints{
            $0.top.equalTo(cellTitle.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(370)
        }
    }
    
    private func attribute(){
        cellTitle.text = "입찰내역"
        cellTitle.textColor = UIColor(red: 0.62, green: 0.62, blue: 0.62, alpha: 1)
        cellTitle.font = .systemFont(ofSize: 12, weight: .medium)
        
    }
    func bind(reactor: ItemDetailBiddingListCellReactor) {
        //Action
        
//        self.rx.layoutSubviews // 뷰 로드
//            .map{_ in Reactor.Action.viewDidLoad}
//            .bind(to: reactor.action)
//            .disposed(by: self.disposeBag)
        
            //State
        //State
        reactor.state
            .map { $0.itemSection }
          .bind(to: self.tableView.rx.items(dataSource: dataSource))
          .disposed(by: self.disposeBag)
        
//        reactor.state
//            .filter{$0.itemSection.count > 0}
//            .map{$0.itemSection}
//            .subscribe(onNext : { section in
//                self.contentView.snp.makeConstraints{
//                    $0.height.equalTo(70 * section[0].items.count + 40)
//                }
//                self.tableView.snp.makeConstraints{
//                    $0.top.equalTo(self.cellTitle.snp.bottom).offset(16)
//                    $0.leading.trailing.equalToSuperview()
//                    $0.bottom.equalToSuperview()
//                    $0.height.equalTo(70 * section[0].items.count)
//                }
//            }).disposed(by: disposeBag)
        
    }
}


enum BiddingListSection{
    case first([BiddingListSectionItem])
}
enum BiddingListSectionItem{
    case item(BiddingListCellOfCellReactor)
}

extension BiddingListSection : SectionModelType{
    var items : [BiddingListSectionItem]{
        switch self{
        case .first(let items) : return items
        }
    }
    init(original: BiddingListSection, items: [BiddingListSectionItem]) {
        switch original {
        case .first : self = .first(items)
        }
    }
    
}
