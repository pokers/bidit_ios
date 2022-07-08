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
import MaterialComponents.MaterialBottomSheet

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
        $0.headerView(forSection: 1)
        //$0.rowHeight = 300
        if #available(iOS 15, *) {
            $0.sectionHeaderTopPadding = 4
        }
        
        //$0.estimatedRowHeight = 500
    }
    
    //하단 버튼
    let buttonContainer = UIView()
    let directBuyBtn = UIButton()
    let biddingBtn = UIButton()
    
    
    var currItem : Item!
    
    let dataSource = RxTableViewSectionedReloadDataSource<DetailCellSection> { dataSource, tableView, indexPath, item in
        tableView.estimatedSectionHeaderHeight = 8
       
        tableView.sectionHeaderHeight = 4
        switch item {
        case.photo(let reactor) :
            let cell = tableView.dequeueReusableCell(for: indexPath) as ItemDetailImageCell
            //tableView.rowHeight = 320
            
            cell.reactor = reactor
            
            return cell
            
        case.title(let reactor) :
            let cell = tableView.dequeueReusableCell(for: indexPath) as ItemDetailTitleCell
            //tableView.rowHeight = 306
            cell.reactor = reactor
            
            return cell
            
        case.content(let reactor) :
            let cell = tableView.dequeueReusableCell(for: indexPath) as ItemDetailContentCell
            //tableView.rowHeight = 216
            cell.reactor = reactor
            return cell
            
        case.bidding(let reactor) :
            let cell = tableView.dequeueReusableCell(for: indexPath) as ItemDetailBiddingListCell
            cell.reactor = ItemDetailBiddingListCellReactor(initialState: ItemDetailBiddingListCellReactor.State( itemSection: []))
            //tableView.rowHeight = 500
            cell.reactor = reactor
            //getBiddingListMock()
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        
    }
    
    
    
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
        self.view.addSubview(buttonContainer)
        //하단 버튼
        
        let screenHeight = UIScreen.main.bounds.size.height
        buttonContainer.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(self.view.snp.top).offset(screenHeight)
            $0.height.equalTo(74)
        }
        buttonContainer.addSubview(directBuyBtn)
        buttonContainer.addSubview(biddingBtn)
        
        directBuyBtn.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(18)
            $0.height.equalTo(42)
            $0.width.equalTo(166)
        }
        
        biddingBtn.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(18)
            $0.height.equalTo(42)
            $0.width.equalTo(166)
        }
        
    }
    
    private func attribute(){
        
        self.view.backgroundColor = .systemBackground
        
       
       // let zzimBtn = UIBarButtonItem(customView: zzimView)
        //let shareBtn = UIBarButtonItem(customView: shareView)
        buttonContainer.backgroundColor = .white
        directBuyBtn.setImage(UIImage(named: "direct_buy_btn_img"), for: .normal)
        biddingBtn.setImage(UIImage(named: "bidding_btn_short"), for: .normal)
        
        
    }
    
    /*
     바텀시트 설정(취소, 입찰하기)
     */
    private func setBottomSheet(item : Item){
        // 바텀 시트로 쓰일 뷰컨트롤러 생성
        let vc = BottomSheetViewController()
        vc.reactor = BottomSheetReactor(item: item)
        // MDC 바텀 시트로 설정
        let bottomSheet: MDCBottomSheetController = MDCBottomSheetController(contentViewController: vc)
        //bottomSheet.dismissOnDraggingDownSheet = false
        
        
        // 높이
        bottomSheet.mdc_bottomSheetPresentationController?.preferredSheetHeight = 200
        // 보여주기
        present(bottomSheet, animated: true, completion: nil)
        
        
    }
    
    /*
     즉시 구매하기 팝업창(취소, 즉시구매하기 채팅 보내기 버튼)
     */
    private func setDirectPopup(){
    
        let vc = DirectBuyingPopupViewController()
        vc.modalPresentationStyle = .overFullScreen
       
        // 보여주기
        present(vc, animated: false, completion: nil)
        
        
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
        
        self.biddingBtn.rx.tap.subscribe(onNext : {
            self.setBottomSheet(item: reactor.initialState.item) //입찰하기 버튼
        }).disposed(by: disposeBag)
        
        self.directBuyBtn.rx.tap.subscribe(onNext :{
            self.setDirectPopup()
        }).disposed(by: disposeBag)
        //State
                
        
        reactor.state.map{$0.isOpenDirectBuying}
            .asObservable().subscribe(onNext : { result in
                
                //self.setDirectPopup()
                
               
            }).disposed(by: disposeBag)
       
        reactor.state
            .map { $0.sections }
            .bind(to: self.tableView.rx.items(dataSource: dataSource))
            .disposed(by: self.disposeBag)
        
       
        
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

enum DetailCellSection {
    case album([DetailCellSectionItem])
    case title([DetailCellSectionItem])
    case content([DetailCellSectionItem])
    case biddingList([DetailCellSectionItem])
}
enum DetailCellSectionItem {
    case photo(ItemDetailImageCellReactor)
    case title(ItemDetailTitleCellReactor)
    case content(ItemDetailContentCellReactor)
    case bidding(ItemDetailBiddingListCellReactor)
}

extension DetailCellSection: SectionModelType {
    
    typealias Item = DetailCellSectionItem
    
    var items: [Item] {
        switch self {
        case .album(let items):
            return items
        case .title(let items):
            return items
        case .content(let items):
            return items
        case .biddingList(let items):
            return items
        }
    }
    
    init(original: DetailCellSection, items: [DetailCellSectionItem]) {
        switch original {
        case .album:
            self = .album(items)
        case .title:
            self = .title(items)
        case .content:
            self = .content(items)
        case .biddingList:
            self = .biddingList(items)
        }
    }
    
}

