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
import ImageSlideshow
import RxSwift
import Kingfisher
import SendBirdUIKit

//물건 상세 페이지(구매자)
class ItemBuyDetailViewController : UIViewController, View, UIScrollViewDelegate{
    
    var opendUrl = ""
    var isDubCnannel = false //채널 존재 여부
    var disposeBag: DisposeBag = DisposeBag()
    //네비게이션 바 버튼 (우측)
    let menuView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
    let zzimView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 18))
    let shareView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 20))
    
    let zzimBtn = UIButton()
    let shareBtn = UIButton()
    let menuBtn = UIButton()
    let myId = UserDefaults.standard.integer(forKey: "userId") ?? 0 //userId
    
    var observable : Disposable? = nil
    
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
    let chattingBtn = UIButton()
    
    
    var currItem : Item!
    
    let dataSource = RxTableViewSectionedReloadDataSource<DetailCellSection> { dataSource, tableView, indexPath, item in
        tableView.estimatedSectionHeaderHeight = 8
       
        tableView.sectionHeaderHeight = 4
        switch item {
        case.photo(let reactor) :
            let cell = tableView.dequeueReusableCell(for: indexPath) as ItemDetailImageCell
            var tempList = Array<String>()
            if reactor.currentState.item.image?.count == 0 {
                cell.images.append(ImageSource(image: UIImage(named: "empty_product_img")!)  )
            }
            
            reactor.currentState.item.image?.forEach{result in
                cell.images.append(cell.loadImg(url: result.url))

            }
           
            cell.slideShow.setImageInputs(cell.images)
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
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        self.navigationController?.isNavigationBarHidden = false
        
    }
    override func viewDidDisappear(_ animated: Bool) {
       
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        attribute()
        self.tableView.rx.setDelegate(self)
          .disposed(by: disposeBag)
        self.view.backgroundColor = .gray
        
        self.navigationController?.isNavigationBarHidden = false
        
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
            $0.height.equalTo(80)
        }
        buttonContainer.addSubview(directBuyBtn)
        buttonContainer.addSubview(biddingBtn)
        buttonContainer.addSubview(chattingBtn)
        
        directBuyBtn.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(18)
            $0.top.equalToSuperview().offset(16)
            $0.height.equalTo(42)
            $0.width.equalTo(166)
        }
        
        biddingBtn.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(18)
            $0.top.equalToSuperview().offset(16)
            $0.height.equalTo(42)
            $0.width.equalTo(166)
        }
        chattingBtn.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(18)
            $0.top.equalToSuperview().offset(16)
            $0.height.equalTo(42)
            $0.width.equalTo(166)
        }
        chattingBtn.isHidden = true
        
        
    }
    
    private func attribute(){
        
        self.view.backgroundColor = .systemBackground
        
       // let zzimBtn = UIBarButtonItem(customView: zzimView)
        //let shareBtn = UIBarButtonItem(customView: shareView)
        buttonContainer.backgroundColor = .white
        directBuyBtn.setImage(UIImage(named: "direct_buy_btn_img"), for: .normal)
        biddingBtn.setImage(UIImage(named: "bidding_btn_short"), for: .normal)
        chattingBtn.setImage(UIImage(named: "chat_btn_img"), for: .normal)
        
    }
    
    /*
     바텀시트 설정(취소, 입찰하기)
     */
    private func setBottomSheet(item : Item){
        // 바텀 시트로 쓰일 뷰컨트롤러 생성
        let vc = BottomSheetViewController()
        vc.preVC = self
        vc.reactor = BottomSheetReactor(item: item)
        // MDC 바텀 시트로 설정
        let bottomSheet: MDCBottomSheetController = MDCBottomSheetController(contentViewController: vc)
        //bottomSheet.dismissOnDraggingDownSheet = false
        
        
        // 높이
        bottomSheet.mdc_bottomSheetPresentationController?.preferredSheetHeight = 200
        // 보여주기
        self.present(bottomSheet, animated: true, completion: nil)
        
        
    }
    
    /*
     즉시 구매하기 팝업창(취소, 즉시구매하기 채팅 보내기 버튼)
     */
    private func setDirectPopup(item : Item){
    
        let vc = DirectBuyingPopupViewController()
        vc.currItem = item
        vc.modalPresentationStyle = .overFullScreen
       
        // 보여주기
        present(vc, animated: false, completion: nil)
        
        
    }
    
    /*
     삭제하기 팝업창
     */
    private func setDeletePopup(item : Item){
    
        let vc = DeleteCheckDialogVC()
        vc.currItem = item
        vc.modalPresentationStyle = .overFullScreen
       
        // 보여주기
        present(vc, animated: false, completion: nil)
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        UserDefaults.standard.set(0, forKey: "finalBidId")

        self.navigationController?.isNavigationBarHidden = false
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
        self.navigationItem.rightBarButtonItems = [menuButtonItem,shareButtonItem]
        
    }
    
    func bind(reactor: ItemBuyDetailReactor) {
        
        
        
        //Action
        self.rx.viewWillAppear
            .map{_ in Reactor.Action.viewDidLoad}
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        self.biddingBtn.rx.tap.subscribe(onNext : {
            self.setBottomSheet(item: reactor.initialState.item) //입찰하기 버튼
        }).disposed(by: disposeBag)
        
        //즉시 구매 버튼 이벤트
        self.directBuyBtn.rx.tap.subscribe(onNext :{
            
            if reactor.currentState.item.status < 2{
                self.setDirectPopup(item: reactor.currentState.item)
            }else {
                self.showToast(message: "즉시구매 가능한 상태가 아닙니다.")
            }
           
        }).disposed(by: disposeBag)
        
        
        
        
        //채팅하기 버튼 이벤트
        self.chattingBtn.rx.tap.subscribe(onNext : {
            var opId = self.currItem?.userId
            var users: [String] = []
            var chatItem : ChatItem? = ChatItem(id: self.currItem?.id,
                                                status: 1, //최종낙찰시 1
                                                userId: self.currItem?.userId,
                                                userName: self.currItem?.user?.nickname ?? "닉네임 없음.",
                                                sPrice: self.currItem?.sPrice,
                                                cPrice: self.currItem?.cPrice,
                                                buyNow: self.currItem?.buyNow,
                                                name: self.currItem?.name,
                                                title: self.currItem?.title,
                                                buyerId: UserDefaults.standard.integer(forKey: "userId"),
                                                buyerName: UserDefaults.standard.string(forKey: "userName") ?? "닉네임 없음"
            
            )
            var jsonString = ""
            var jsonData : Data? = nil
            
            do {
                jsonData = try JSONEncoder().encode(chatItem)
                jsonString = String(data: jsonData!, encoding: .utf8) ?? "err"
                print(jsonString)// [{"sentence":"Hello world","lang":"en"},{"sentence":"Hallo Welt","lang":"de"}]
                // and decode it back
//                let decodedSentences = try JSONDecoder().decode([chatItem].self, from: jsonData)
//                print(decodedSentences)
                
            } catch let err{
                print("err:\(err.localizedDescription)")
            }
            // 즉구할때 나(구매자), 상대(아이템 판매자)
            let myId = UserDefaults.standard.integer(forKey: "userId") ?? 0 //userId
            let myName = UserDefaults.standard.string(forKey: "userName") ?? "닉네임 없음"
            
            users.append("\(opId!)")
            
            if self.isDubCnannel{
                //중복된 채널이라면 기존 채널 열기
                print("기존에 있던 채널입니다.")
                guard let pvc = self.presentingViewController
                else {
                    print("no navigation")
                    return
                    
                }

                self.dismiss(animated: true) {
                    var nextVC =  MessageList(channelUrl: self.opendUrl)
                    var naviVC = UINavigationController(rootViewController: nextVC)
                    naviVC.modalPresentationStyle = .fullScreen
                    pvc.present(naviVC, animated: false)
                }
                
            }else{
                //없는 채널이라면 새로운 채널 개설.
                //채팅방 이름 : status_구메자닉네임_구매자ID, 판매자 닉네임_ 즉구 가격
                print("새로운 채널을 개설합니다.")
                print("채널 이름 (아이템 ID) : \(self.currItem?.id)")
                
                SBDGroupChannel.createChannel(withName: "\(String(describing: self.currItem!.id!))", //즉구 : 0, 낙찰 : 1
                                              isDistinct: true,
                                              userIds: users,
                                              coverUrl: self.currItem?.image?[0].url,
                                              data: jsonString, //chatItem.debugDescription , //data?.description , //현재 거래 아이템 정보.
                                              customType: nil,
                                              completionHandler:
                                                { (groupChannel, error) in
                    guard error == nil else {
                        // Handle error.
                        print("채널 생성 실패")
                        return
                    }

                    // A group channel with additional information is successfully created.
                    var channelUrl = groupChannel!.channelUrl
                    print("채널 생성 성공.")
                    guard let pvc = self.presentingViewController
                    else {
                        print("no navigation")
                        return}

                    var nextVC =  MessageList(channelUrl: channelUrl)
                    var naviVC = UINavigationController(rootViewController: nextVC)
                    naviVC.modalPresentationStyle = .fullScreen
                    self.present(naviVC, animated: false)
                        
                    
                })
                
            }
    
            
        }).disposed(by: disposeBag)
                
                
        
        
        //메뉴버튼 이벤트
        self.menuBtn.rx.tap
            .subscribe(onNext : {
                self.setActionSheet(item: reactor.currentState.item)
            }).disposed(by: disposeBag)
        
        //찜하기 버튼 이벤트
        self.zzimBtn.rx.tap
            .subscribe(onNext : {
                let vc = NotOpenDialogVC()
                vc.modalPresentationStyle = .fullScreen
               
                // 보여주기
                self.present(vc, animated: false, completion: nil)
            }).disposed(by: disposeBag)
        
        self.shareBtn.rx.tap
            .subscribe(onNext: {
                //서비스 준비중 팝업
//                let vc = NotOpenDialogVC()
//                vc.modalPresentationStyle = .fullScreen
//
//                // 보여주기
//                self.present(vc, animated: false, completion: nil)
                let image = self.loadProfileImg(url: reactor.currentState.item.image![0].url)
                
                let activityItems : [UIImage] = [image]
                let activityViewController = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
                self.present(activityViewController, animated: true)
                
                
            }).disposed(by: disposeBag)
       
        reactor.state
            .map { $0.sections }
            .bind(to: self.tableView.rx.items(dataSource: dataSource))
            .disposed(by: self.disposeBag)
        //유저 제품 구분 (하단 구매하기 버튼)
        
        //현재 아이템 상태
        reactor.state
            .map{$0.item}
            .subscribe(onNext : {
                self.currItem = $0
            }).disposed(by: disposeBag)
        
        reactor.state.subscribe(onNext : {state in
            //내 제품인 경우(판매자 인터페이스)
            
            self.isDubChannel(myId: self.myId.description , oppId: self.currItem!.userId.description)
            print("지금 낙찰자는 ? : \(UserDefaults.standard.integer(forKey: "finalBidId"))")
            print("지금 나는 ? : \(UserDefaults.standard.integer(forKey: "userId") )")
            if state.item.userId == UserDefaults.standard.integer(forKey: "userId") {
                self.buttonContainer.isHidden = true
                self.menuView.isHidden = false
            }else{
                //내 제품이 아닌 경우(구매자 인터페이스)
                self.menuView.isHidden = true
                self.buttonContainer.isHidden = true
                if state.item.status <= 1 && isEnableBid(end: state.item.dueDate!){ //아직 입찰 가능한 상태
                    self.buttonContainer.isHidden = false
                    
                    //내가 최종 낙찰자인 경우. 입찰하기 버튼 -> 채팅하기 버튼으로 전환
                }else if state.item.status  <= 2 && !isEnableBid(end: state.item.dueDate!){
                    
                    if UserDefaults.standard.integer(forKey: "userId") == UserDefaults.standard.integer(forKey: "finalBidId") {
                        self.chattingBtn.isHidden = false
                        self.buttonContainer.isHidden = false
                        self.biddingBtn.isHidden = true
                        //
                    }else{ //입찰 불가능한 상태
                        self.buttonContainer.isHidden = true
                    }
                }
                
                
            }
            
            self.tableView.reloadData()
        }).disposed(by: disposeBag)
        
        
       
        
       
        
    }
    
    
    private func setActionSheet(item : Item){
        //action sheet title 지정

               let optionMenu = UIAlertController(title: nil, message: "", preferredStyle: .actionSheet)

               //옵션 초기화

        //제품 수정
               let modifyAction = UIAlertAction(title: "수정하기", style: .default, handler: {
                   (alert: UIAlertAction!) -> Void in
                   //수정하기 뷰컨트롤러 호출
                   let vc = ModifyProductVC()
                   vc.currItem = self.reactor?.initialState.item
                   let modifyReactor = ModifyProductReactor(currItem: self.reactor!.initialState.item) //임시로 입력
                   vc.reactor = modifyReactor
                  // vc.bind(reactor: listReactor)
                   self.navigationController?.pushViewController(vc, animated: true)
               })
               let deleteAction = UIAlertAction(title: "삭제하기", style: .default, handler: {
                   (alert: UIAlertAction!) -> Void in
                   self.setDeletePopup(item: item)
               })
               let cancelAction = UIAlertAction(title: "닫기", style: .cancel, handler: {
                   (alert: UIAlertAction!) -> Void in
             })

              //action sheet에 옵션 추가.

               optionMenu.addAction(modifyAction)
               optionMenu.addAction(deleteAction)
               optionMenu.addAction(cancelAction)

               

              //show

               self.present(optionMenu, animated: true, completion: nil)


    }
    
    func loadProfileImg(url : String) -> UIImage{
        var resultImage : UIImage?
        if let thumbnailUrl = URL(string: url) {
            KingfisherManager.shared.retrieveImage(with: thumbnailUrl, completionHandler: { result in
            switch(result) {
                case .success(let imageResult):
//                    let resized = imageResult.image.resizedImageWithContentMode(.scaleAspectFit, bounds: CGSize(width: 84, height: 84), interpolationQuality: .medium)
                    //imageView.isHidden = false
                resultImage = imageResult.image
                case .failure(let error):
                break
                }
            })
        }
        return resultImage ?? UIImage(named: "basic_profile_img")!
    }

    
}


extension ItemBuyDetailViewController {
    
    /*
     기존에 있는 채널인지. true/false
     */
 func isDubChannel(myId : String, oppId : String) -> Void{
     LoadingIndicator.showLoading()
     let listQuery = SBDGroupChannel.createMyGroupChannelListQuery()
     //해당 아이디로 참가한 채팅채널들 조회
     listQuery?.setUserIdsIncludeFilter([myId, oppId], queryType: SBDGroupChannelListQueryType.and)
     listQuery?.loadNextPage(completionHandler: { (groupChannels, error) in
         
         guard error == nil else {
             // Handle error.
             return
         }
         
         //채널 중 같은 아이템의 채팅이 있다면 true 없다면 false
         groupChannels?.forEach{ channel in
             print("기존의 채널 : \(channel.name), 현재 아이템 아이디  \(self.currItem!.id)")
             if channel.name == "\(self.currItem!.id!)"{
                 self.opendUrl = channel.channelUrl
                 self.isDubCnannel = true //
             }
         }
         LoadingIndicator.hideLoading()
     })
     
     
     
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
//Cell -> IMAGE
