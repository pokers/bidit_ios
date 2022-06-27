//
//  ItemBuyDetailViewController.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/06/25.
//

import Foundation
import UIKit
import ReactorKit
import RxDataSources

//물건 상세 페이지(구매자)
class ItemBuyDetailViewController : UIViewController, View, UIScrollViewDelegate{
    
    
    
    
    
    //테이블 뷰
    
    
    private let tableView = UITableView().then {
        $0.register(cellType: ItemDetailImageCell.self)
        $0.register(cellType: ItemDetailTitleCell.self)
        $0.register(cellType: ItemDetailContentCell.self)
        $0.register(cellType: ItemDetailBiddingListCell.self)
        $0.backgroundColor = .systemBackground
        $0.separatorColor = .separator
        $0.separatorStyle = .singleLine
        $0.separatorInset = .init(top: 18, left: 0, bottom: 18, right: 0)
        
        //$0.rowHeight = 300
        
        //$0.estimatedRowHeight = 500
    }
    
    let dataSource = RxTableViewSectionedReloadDataSource<ItemDetailSection.DetailSectionModel> { dataSource, tableView, indexPath, item in
        switch item {
        case.photo :
            let cell = tableView.dequeueReusableCell(for: indexPath) as ItemDetailImageCell
            //tableView.rowHeight = 320
            return cell
            
        case.title :
            let cell = tableView.dequeueReusableCell(for: indexPath) as ItemDetailTitleCell
            //tableView.rowHeight = 306
            return cell
            
        case.content :
            let cell = tableView.dequeueReusableCell(for: indexPath) as ItemDetailContentCell
            //tableView.rowHeight = 216
            return cell
            
        case.bidding :
            let cell = tableView.dequeueReusableCell(for: indexPath) as ItemDetailBiddingListCell
            cell.reactor = ItemDetailBiddingListCellReactor(initialState: ItemDetailBiddingListCellReactor.State( itemSection: getBiddingListMock()))
            //tableView.rowHeight = 500
            
            return cell
            
        
        }
        
    }
    
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var disposeBag: DisposeBag  = DisposeBag()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        attribute()
        self.tableView.rx.setDelegate(self)
          .disposed(by: disposeBag)
        self.view.backgroundColor = .gray
    }
    
    private func layout(){
        setNavigationBarButton()
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(-52)
            $0.trailing.leading.bottom.equalToSuperview()
        }
    }
    
    private func attribute(){
        
        self.view.backgroundColor = .systemBackground
        
       
       // let zzimBtn = UIBarButtonItem(customView: zzimView)
        //let shareBtn = UIBarButtonItem(customView: shareView)
        
        
        
    }
    //네비게이션바 세팅
    private func setNavigationBarButton(){
        //네비게이션 바 투명하게
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.backgroundColor = .clear
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = . white
        self.navigationController?.navigationBar.isHidden = false
        
        let menuView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        let zzimView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 18))
        let shareView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 20))
    
        
        let zzimBtn = UIButton()
        let shareBtn = UIButton()
        let menuBtn = UIButton()
        zzimView.addSubview(zzimBtn)
        shareView.addSubview(shareBtn)
        menuView.addSubview(menuBtn)

        menuBtn.snp.makeConstraints{
           
            $0.trailing.leading.equalToSuperview()
            $0.top.bottom.equalToSuperview()
        }
        
        shareBtn.snp.makeConstraints{
            $0.trailing.leading.equalToSuperview()
            $0.top.bottom.equalToSuperview()
        }
        zzimBtn.snp.makeConstraints{
            $0.trailing.leading.equalToSuperview()
            $0.top.bottom.equalToSuperview()
        }
        
        
        zzimBtn.setImage(UIImage(named: "zzim_btn_unchecked"), for: .normal)
        shareBtn.setImage(UIImage(named: "share_btn"), for: .normal)
        menuBtn.setImage(UIImage(named: "menu_btn"), for: .normal)
        
        
        let menuButtonItem = UIBarButtonItem(customView: menuView)
        let zzimButtonItem = UIBarButtonItem(customView: zzimView)
        let shareButtonItem = UIBarButtonItem(customView: shareView)
        menuButtonItem.width = 20
        zzimButtonItem.width = 40
        shareButtonItem.width = 40
        self.navigationItem.rightBarButtonItems = [menuButtonItem,shareButtonItem,zzimButtonItem]
        
    }
    
    func bind(reactor: ItemBuyDetailReactor) {
        
        
        //Action
        self.rx.viewDidLoad
            .map{Reactor.Action.viewDidLoad}
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        //State
        
        reactor.state.map{[$0.albumSection,$0.titleSection, $0.contentSection, $0.biddingListSection]}
            .distinctUntilChanged()
            .bind(to: self.tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        
        
        
    }
    

    
}

struct ItemDetailSection{
    typealias DetailSectionModel = SectionModel<DetailSection,DetailItem>
    
    enum DetailSection : Equatable{
        case album
        case title
        case content
        case biddingList
    }
    
    enum DetailItem : Equatable{
        case photo
        case title
        case content
        case bidding
    }
    
}
