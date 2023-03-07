//
//  EndingSoonReactor.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/06/16

import Foundation
import ReactorKit
import Apollo
import RxSwift
import RxCocoa
import RxApolloClient
import Kingfisher

class EndingSoonReactor : Reactor {
    
    var itemList : [Item] = []
   
    enum Action {
        case viewDidLoad
        case cellSelected(IndexPath)
        case updateSoon
    }
      
    enum Mutation {
        case updateDataSource([Item])
        case setSelectedIndexPath(IndexPath?)
    }
      
    struct State {
        var itemSection : [ProductListSection]
        var selectedIndexPath : IndexPath?
    }
    
    // MARK: Services
    let itemService : ItemService
    let initialState: State
    
    let adapter : ItemListProviderService
    
    init(
        initialState: State
    ) {
        self.initialState = initialState
        self.itemService = ServiceProvider.getItemService()
        self.adapter = DataToItemsAdapter()
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .viewDidLoad:
            print("viewDidLoad 호출")
            return self.itemService.getItemList() //getDataFromApi()
                .do(onSuccess: { result in log.info("getItemList : \(result)")},
                    onError: {error in log.info("Error - getItemList : \(error)")}
                )
                .asObservable()
                .observe(on: MainScheduler.instance)
                .flatMap{ data in
                    // GetItemListQuery.Data.GetItemList
                    //var itemList = self.toEndingSoonItemList(data: $0)
                    let itemList = self.adapter.dataToItems(dataItemList: data)
                    self.itemList = itemList
                    return Single<Mutation>.just(Mutation.updateDataSource(itemList))
                }
               
                
            
        case .cellSelected(let indexPath):
            return Observable.concat([
                Observable.just(Mutation.setSelectedIndexPath(indexPath)),
                Observable.just(Mutation.setSelectedIndexPath(nil))
            ])
        case .updateSoon:
            print("update Soon 호출")
            return self.itemService.getItemList() //getDataFromApi()
                .do(onSuccess: { result in log.info("getItemList : \(result)")},
                    onError: {error in log.info("Error - getItemList : \(error)")}
                )
                .asObservable()
                .observe(on: MainScheduler.instance)
                .flatMap{// GetItemListQuery.Data.GetItemList
                    let itemList = self.toEndingSoonItemList(data: $0)
                    self.itemList = itemList
                    return Single<Mutation>.just(Mutation.updateDataSource(itemList))
                }
        }
      }

    
      func reduce(state: State, mutation: Mutation) -> State {
        var state = state
          switch mutation {

          case .updateDataSource(let itemList):
              state.itemSection = toItemCellModel(items: itemList)
              print("\(state.itemSection.description) 결과 state 개수")
              print("\(state.itemSection.count) 결과 count")
              break
            
          case .setSelectedIndexPath(let indexPath):
              state.selectedIndexPath = indexPath
              print("reactor endingSoon : ")
              break
        
          case .updateDataSource(let itemList):
              state.itemSection = toItemCellModel(items: itemList)
              print("\(state.itemSection.count) 결과2 state 개수")
              break
              
          }

          return state
      }
}



extension EndingSoonReactor {
    
    /*
     Data.GetItemList -> [Item] 변환
     */
    func toEndingSoonItemList(data : GetItemListQuery.Data.GetItemList) -> [Item]{
        var tempList = Array<Item>()
        
        data.edges?.forEach{item in
            var node = item?.node
            var images = Array<ItemImage>()
            var userInfo = User(id: node!.userId,
                                status: 0,
                                nickname: node?.user?.nickname,
                                email: node?.user?.email,
                                kakaoAccount: nil,
                                appleAccount: nil
            )
            node?.image!.forEach{ result in
                images.append(ItemImage(id: result!.id,
                                        status: result?.status,
                                        itemId: result?.itemId,
                                        type: result?.type,
                                        url : result!.url ?? "",
                                        createdAt: result?.createdAt,
                                        updatedAt: result?.updatedAt,
                                        deletedAt: result?.deletedAt))
            }
            var tempItem = Item( id: node!.id,
                                 status:  node?.status,
                                 categoryId: node?.categoryId,
                                 userId: node?.userId,
                                 sPrice: node?.sPrice,
                                 cPrice: node?.cPrice,
                                 buyNow: node?.buyNow,
                                 viewCount: node?.viewCount,
                                 name: node?.name,
                                 title: node?.title,
                                 dueDate: node?.dueDate,
                                 deliveryType: node?.deliveryType,
                                 
                                 createdAt: node?.createdAt,
                                 
                                 image: images,
                                 user:  userInfo
            )
            
            if tempItem.status != 3 && tempItem.status != 4{
                tempList.append(tempItem)
            }
        }
        var items = tempList
        self.itemList = tempList
        
        return items
    }
    
    //[Item] ->  RxDataSources SectionModel 모델 변환
    func toItemCellModel(items : [Item]) -> [ProductListSection]{
        
        let list : [Item] = items
        print("list 개수 : \(list.count)")
        var array = Array<ProductListSectionItem>()
        
        items.forEach{
            array.append( ProductListSectionItem.item(EndingSoonCellReactor(item : $0)))
        }
        print("array 개수 : \(array.count)")
        
        let itemInFirstSection = array
        
        let firstSection = ProductListSection(
            original:
                ProductListSection(
                    original: .first(array),
                    items: array)
            ,items: array)
        print("firstSection 개수 : \(firstSection.items)")
        return [firstSection]
    }

}

