//
//  ItemBuyDetailReactor.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/06/25.
//

import Foundation
import ReactorKit
class ItemBuyDetailReactor : Reactor {
    enum Action {
        case viewDidLoad
        case tapBiddingBtn
        case tapDirectBuyingBtn
        
    }
    
    enum Mutation {
        case switchBidding
        case switchDirectBuying
        case updateItemData([DetailCellSection])
        case updateBidList([BiddingListSection])
        
    }
    
    struct State {
       // var itemSection = getDetailMock()//[ProductListSection]()
        
        var sections: [DetailCellSection]
        var isOpenBidding : Bool
        var isOpenDirectBuying : Bool
        var item : Item

    }
    
    var initialState: State
    
    init(item : Item) {
    
        self.initialState = State(sections: configSections(item: item), isOpenBidding: false, isOpenDirectBuying: false, item: item)
        
        
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
      switch action {
      case .viewDidLoad:
          //
          print("viewDidLoad -> requestItemInfo")
          return Observable.concat([
            requestItemInfo(itemId: self.initialState.item.id),
            getBiddingFromApi()
          ])
          
          
      
      case .tapBiddingBtn:
        print("mutate 호출")
          return Observable<Mutation>.just(.switchBidding)
          
      case .tapDirectBuyingBtn:
          print("mutate 호출")
          return Observable<Mutation>.just(.switchDirectBuying)
      }

    }
    
    
        
        func reduce(state: State, mutation: Mutation) -> State {
            var state = state
            switch mutation {
            case .switchBidding :
                let statusBid =  state.isOpenBidding
                print("\(statusBid) bidding status")
                state.isOpenBidding = statusBid
                
                break
                
            case .switchDirectBuying:
                let statusDirect =  state.isOpenDirectBuying
                print(statusDirect)
                state.isOpenDirectBuying = (statusDirect)
                break
                
            case .updateItemData(let detailCellSection):
                print("유저아이템 updateData : \(String(describing: detailCellSection))")
                
                //initialState = state
                state.sections = detailCellSection
                
                break
                
                
            case .updateBidList(let bidList):
                state.sections = configSections(item: self.currentState.item, bidList: bidList)
                print("reduce -> updateBidList")
                break
                
            }
            return state
        }
        
    
    
}




extension ItemBuyDetailReactor{
    //아이템 정보 요청
    func requestItemInfo(itemId : Int) -> Observable<Mutation>{
        LoadingIndicator.showLoading()
        
        return Observable<Mutation>.create(){ emitter in
            
            Network.shared.apollo.fetch(query: GetItemQuery(id: itemId), cachePolicy: .fetchIgnoringCacheData){ result in
                switch result {
                    
                    
                    
                    
                case .success(let data) :
                    print("success \(data)")
                    do {
                        
                        
                        let item = data.data!.getItem!
                        let node = item
                        var images = Array<ItemImage>()
                        let userInfo = User(id: node.userId,
                                            status: 0,
                                            nickname: node.user?.nickname,
                                            email: node.user?.email,
                                            kakaoAccount: nil,
                                            appleAccount: nil
                        )
                        node.image!.forEach{ result in
                            
                            
                            images.append(ItemImage(id: result!.id,
                                                    status: result?.status,
                                                    itemId: result?.itemId,
                                                    type: result?.type,
                                                    url : result!.url ?? "",
                                                    createdAt: result?.createdAt))
                            
                        }
                        
                        var tempItem = Item( id: node.id,
                                             status:  node.status,
                                             categoryId: node.categoryId,
                                             userId: node.userId,
                                             sPrice: node.sPrice,
                                             cPrice: node.cPrice,
                                             buyNow: node.buyNow,
                                             viewCount: node.viewCount,
                                             name: node.name,
                                             title: node.title,
                                             dueDate: node.dueDate,
                                             deliveryType: node.deliveryType,
                                             
                                             createdAt: node.createdAt,
                                             
                                             image: images,
                                             user:  userInfo
                        )
                        print("유저 이름. : \(userInfo)")
                        print("유저 아이템. : \(tempItem)")
                        LoadingIndicator.hideLoading()
                        //                        //return 대신
                        let inputSection = configSections(item: tempItem, bidList: nil)
                        print("유저 아이템 변환. : \(inputSection)")
                        emitter.onNext(.updateItemData(inputSection))
                        emitter.onCompleted()
                        
                        //
                    }catch (let error) {
                        print(error)
                        print("item load fail")
                        print(error.localizedDescription)
                    }
                    break
                case .failure(let error) :
                    print("error : \(error)")
                    //self.passed = false
                }
                
            }
            return Disposables.create()
        }
        
    }
    
    //입찰내역 리스트 불러오기 요청
    func getBiddingFromApi() -> Observable<Mutation>{
        //로딩 Indicator
        LoadingIndicator.showLoading()
        return Observable<Mutation>.create(){ emitter in
            LoadingIndicator.showLoading()
            Network.shared.apollo.fetch(query: GetBiddingQuery(biddingQuery: .init(status: 0,
                                                                                   itemId: self.currentState.item.id,
                                                                                   price: nil)),
                                        cachePolicy: .fetchIgnoringCacheData
            ){ result in
                switch result {
                case .success(let data) :
                    print("success \(data)")
                    do {
                        var bidInfo = data.data?.getBidding
                        var listBid = Array<Bidding>()
                        
                        var count = 1
                        var previousPrice = 0
                        
                        
                        
                        bidInfo?.reversed().forEach{ bidding in
                         
                            var dataUser = bidding?.user
                            var delta = bidding!.price - previousPrice
                            
                            var tempBidding = Bidding(id: bidding!.id,
                                                      status: bidding!.status,
                                                      userId: bidding!.userId,
                                                      itemId: bidding!.itemId,
                                                      price: bidding!.price,
                                                      createdAt: bidding!.createdAt,
                                                      user: User(id: dataUser!.id,
                                                                 status: dataUser!.status,
                                                                 nickname: dataUser?.nickname,
                                                                 email: dataUser?.email,
                                                                 counting: nil,
                                                                 kakaoAccount: nil,
                                                                 appleAccount: nil),
                                                      gap: delta
                            )
                            //상위 5개만 보여주기
                            previousPrice = bidding!.price
                            listBid.append(tempBidding)
                            
                            
                            count+=1
                        }
                        var tempList = Array<Bidding>()
                        for i in 1...5{
                            if  i > listBid.count{
                                break
                            }
                            
                            tempList.append(listBid[listBid.count - i]  )
                        }
                        //현재 마지막 입찰자.
                        if tempList.count > 0 {
                            UserDefaults.standard.set(tempList[0].userId, forKey: "finalBidId")
                            print("지금 입찰자 변동은 : \(UserDefaults.standard.integer(forKey: "finalBidId"))")
                        }else {
                            UserDefaults.standard.set(0, forKey: "finalBidId")
                        }
                        
                        let result = self.transBidList(biddings: tempList)
                        
                        LoadingIndicator.hideLoading()
                        emitter.onNext(.updateBidList(result))
                        emitter.onCompleted()
                       
                    }catch (let error) {
                        print("item load fail")
                        print(error.localizedDescription)
                    }
                    break
                case .failure(let error) :
                    print("error : \(error)")
                    //self.passed = false
                }
                
            }
            return Disposables.create()
        }
     
        
    }
    
    func transBidList(biddings : [Bidding]) -> [BiddingListSection]{
        
        let list : [Bidding] = biddings
        print("list 개수 : \(list.count)")
        var array = Array<BiddingListSectionItem>()
        
        biddings.forEach{
            array.append( BiddingListSectionItem.item(BiddingListCellOfCellReactor(bidding: $0)))
        }
        print("array 개수 : \(array.count)")
        
        let itemInFirstSection = array
        
        let firstSection = BiddingListSection(
            original:
                BiddingListSection(
                    original: .first(array),
                    items: array)
            ,items: array)
        print("입찰내역 개수 : \(firstSection.items.count)")
        return [firstSection]
        
        
        

    }
    
    
}
    
    /*
     셀 리액터 마다 아이템 할당.
     */
func configSections(item : Item, bidList : [BiddingListSection]? = nil) -> [DetailCellSection] {
            
    let firstCell = DetailCellSectionItem.photo(ItemDetailImageCellReactor(item: item))
    let albumSection = DetailCellSection.album([firstCell])
        
    let secondCell = DetailCellSectionItem.title(ItemDetailTitleCellReactor(item: item))
    let titleSection = DetailCellSection.title([secondCell])
        
    let thirdCell = DetailCellSectionItem.content(ItemDetailContentCellReactor(item: item))
    let contentSection = DetailCellSection.content([thirdCell])
        
    let fourthCell = DetailCellSectionItem.bidding(ItemDetailBiddingListCellReactor(initialState: .init(itemSection: bidList ?? [], item: item)))
    let biddingSection = DetailCellSection.biddingList([fourthCell])
            
        
    return [albumSection, titleSection, contentSection, biddingSection]
    
}


