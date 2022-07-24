//
//  PurchaseHistoryVC.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/22.
//

import Foundation
import UIKit
import ReactorKit
import RxDataSources
//구매내역 뷰
class PurchaseHistoryVC : UIViewController, View{
    
    
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
            cell.selectionStyle = .none
            return cell
        }
        
    }
    //아이템 없을 때 이미지
    var emptyImage = UIImageView()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var disposeBag: DisposeBag  = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        layout()
        attribute()
    }
    
    
    func bind(reactor: PurchaseHistoryReactor) {
        
    }
    

    private func layout(){
        //테이블뷰
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalToSuperview().offset(72)
            $0.bottom.equalToSuperview()
        }
        
        tableView.addSubview(emptyImage)
        emptyImage.snp.makeConstraints{ //빈 리스트 이미지
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.width.equalTo(120)
            $0.height.equalTo(110)
        }
    }
    
    private func attribute(){
//        self.emptyImage.isHidden = true
        self.emptyImage.image =  UIImage(named: "blackhole_img")
    }
    
}
