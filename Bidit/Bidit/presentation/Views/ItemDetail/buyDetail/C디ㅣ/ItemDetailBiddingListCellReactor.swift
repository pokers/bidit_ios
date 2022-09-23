//
//  ItemDetailBiddingListCellReactor.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/06/25.
//

import Foundation
import ReactorKit

class ItemDetailBiddingListCellReactor : Reactor{
    
    
    
    enum Action {
        case viewDidLoad
        //case cellSelected(IndexPath)
       
    }
      
      
    enum Mutation {
        case updateDataSource([BiddingListSection])
        //case setSelectedIndexPath(IndexPath?)
       
    }
      
      
    struct State {
        var itemSection : [BiddingListSection] //= [BiddingListSection]() //getBiddingListMock()// //
        var item : Item?
        //var selectedIndexPath : IndexPath?
       
      }
      
      let initialState: State
      
      init(
        initialState: State
      ) {
        self.initialState = initialState
      }
      
      func mutate(action: Action) -> Observable<Mutation> {
        switch action {
            
        case .viewDidLoad:
            return  getBiddingFromApi()//Observable.just(Mutation.updateDataSource(currentState.itemSection))
           //
//        case .cellSelected(let indexPath):
//            return Observable.concat([
//                Observable.just(Mutation.setSelectedIndexPath(indexPath)),
//                Observable.just(Mutation.setSelectedIndexPath(nil))
//            ])
        
        }
      }
      
      func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        switch mutation {
            
        case .updateDataSource(let biddings):
            state.itemSection = []
            state.itemSection = biddings //getBiddingListMock()
            break
        
//        case .setSelectedIndexPath(let indexPath):
//            state.selectedIndexPath = indexPath
            
        }
        return state
      
      }
    

    
    
    //입찰내역 리스트 불러오기 요청
    func getBiddingFromApi() -> Observable<Mutation>{
        //로딩 Indicator
        LoadingIndicator.showLoading()
        return Observable<Mutation>.create(){ emitter in
            LoadingIndicator.showLoading()
            Network.shared.apollo.fetch(query: GetBiddingQuery(biddingQuery: .init(status: 0,
                                                                                   itemId: self.initialState.item?.id,
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
                        emitter.onNext(.updateDataSource(result))
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



//func getBiddingListMock() -> [BiddingListSection]{
//    print("입찰 내역 생성")
//    let tempItem1 = BiddingListSectionItem.item(BiddingListCellOfCellReactor(item : Item(id: 1, status: 1, userId: 1, createdAt: "")))
//    let tempItem2 = BiddingListSectionItem.item(BiddingListCellOfCellReactor(item : Item(id: 1, status: 1, userId: 1, createdAt: "")))
//    let tempItem3 = BiddingListSectionItem.item(BiddingListCellOfCellReactor(item : Item(id: 1, status: 1, userId: 1, createdAt: "")))
//    let tempItem4 = BiddingListSectionItem.item(BiddingListCellOfCellReactor(item : Item(id: 1, status: 1, userId: 1, createdAt: "")))
//    let tempItem5 = BiddingListSectionItem.item(BiddingListCellOfCellReactor(item : Item(id: 1, status: 1, userId: 1, createdAt: "")))
//
//    let itemInFirstSection = [tempItem1, tempItem2, tempItem3, tempItem4, tempItem5]
//
//    let firstSection = BiddingListSection(
//        original: BiddingListSection(
//            original: .first(itemInFirstSection),
//            items: itemInFirstSection),
//        items: itemInFirstSection)
//
//    return [firstSection]
//
//}

