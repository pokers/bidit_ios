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
        case updateData(item : Item)
    }
    
    struct State {
       // var itemSection = getDetailMock()//[ProductListSection]()
        
        var sections: [DetailCellSection]
        var isOpenBidding : Bool
        var isOpenDirectBuying : Bool
        var item : Item

    }
    
    let initialState: State
    
    init(item : Item) {
    
        self.initialState = State(sections: configSections(item: item), isOpenBidding: false, isOpenDirectBuying: false, item: item)
        
        
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
      switch action {
      case .viewDidLoad:
          return requestItemInfo(itemId: self.initialState.item.id)
      
      case .tapBiddingBtn:
        print("mutate 호출")
          return Observable<Mutation>.just(.switchBidding)
          
      case .tapDirectBuyingBtn:
          print("mutate 호출")
          return Observable<Mutation>.just(.switchDirectBuying)
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
          
      case .updateData(let item):
          state.item = item
          break
      }
      return state
    
    
    }
        
        
 

        
       

    }

}

extension ItemBuyDetailReactor{
    //아이템 정보 요청
    func requestItemInfo(itemId : Int) -> Observable<Mutation>{
        LoadingIndicator.showLoading()
        
        return Observable<Mutation>.create(){ emitter in
            
            Network.shared.apollo.fetch(query: GetItemQuery(id: itemId)){ result in
                switch result {
                    
                    
                    
                    
                case .success(let data) :
                    print("success \(data)")
                    do {
                        
                        
                        var item = data.data!.getItem!
                        var node = item
                        var images = Array<ItemImage>()
                        var userInfo = User(id: node.userId,
                                            status: node.status,
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
                        
                        LoadingIndicator.hideLoading()
                        
                        //                        //return 대신
                        emitter.onNext(.updateData(item: tempItem))
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
}
    
    /*
     셀 리액터 마다 아이템 할당.
     */
func configSections(item : Item) -> [DetailCellSection] {
            
    let firstCell = DetailCellSectionItem.photo(ItemDetailImageCellReactor(item: item))
    let albumSection = DetailCellSection.album([firstCell])
        
    let secondCell = DetailCellSectionItem.title(ItemDetailTitleCellReactor(item: item))
    let titleSection = DetailCellSection.title([secondCell])
        
    let thirdCell = DetailCellSectionItem.content(ItemDetailContentCellReactor(item: item))
    let contentSection = DetailCellSection.content([thirdCell])
        
    let fourthCell = DetailCellSectionItem.bidding(ItemDetailBiddingListCellReactor(initialState: .init(itemSection: [], item: item)))
    let biddingSection = DetailCellSection.biddingList([fourthCell])
            
        
    return [albumSection, titleSection, contentSection, biddingSection]
    
}


