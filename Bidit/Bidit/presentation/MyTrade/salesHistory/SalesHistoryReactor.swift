//
//  SalesHistoryReactor.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/22.
//

import Foundation
import ReactorKit
//퍈매내역 뷰
class SalesHistoryReactor : Reactor {
    var itemList : [Item] = []
    enum Action {
        case viewDidLoad
        case cellSelected(IndexPath)
    }
    
    enum Mutation {
        
        case setSelectedIndexPath(IndexPath?)
        case loadListResult([ProductListSection])// 가져온 리스트 결과
    }
    
    struct State {
        var itemSection =  [ProductListSection]()
        var selectedIndexPath : IndexPath?
    }
    
    let initialState: State
    
    init() {
        self.initialState = State()
    }
}
extension SalesHistoryReactor {
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .viewDidLoad:
            var userId = UserDefaults.standard.integer(forKey: "userId")
            return requestItemList(userId: userId)
            
        case .cellSelected(let indexPath):
            return Observable.concat([
                Observable.just(Mutation.setSelectedIndexPath(indexPath)),
                Observable.just(Mutation.setSelectedIndexPath(nil))
            ])
        }
    }
    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        switch mutation {
            
       
            
        case .setSelectedIndexPath(let indexPath):
            state.selectedIndexPath = indexPath
            break
            
        case .loadListResult(let result):
            state.itemSection = result
            break
        }
    
        return state
        
        
    }
    
    
    //내 판매 리스트 요청
    func requestItemList(userId : Int) -> Observable<Mutation>{
        return Observable<Mutation>.create(){ emitter in

            let itemQuery = ItemQueryInput.init(id: nil, status: nil, userId: userId, categoryId: nil, name: nil, dueDate: nil, deliveryType: nil, sCondition: nil, aCondition: nil, createdAt: nil)
            Network.shared.apollo.fetch(
                query:GetItemListQuery(itemQueryInfo: itemQuery,
                                       keywordInfo: nil,
                                       firstInfo: nil,
                                       lastInfo: nil,
                                       afterInfo: nil,
                                       beforeInfo: nil,
                                       cursorTypeInfo: nil
                                      )){ result in
                
                switch result {
                case .success(let data) :
                    print("success \(data)")
                    do {
                        //let data = try JSONSerialization.data(withJSONObject: data.data!.jsonObject, options: .fragmentsAllowed)//
                        //let decode : ItemConnection = try JSONDecoder().decode(ItemConnection.self, from: data)
                        //print("item's id is \(decode.getEndingSoonItems[1] ?? nil)")
//                        decode.getEndingSoonItems.forEach{
//                            self.itemList.append($0)
//                        }
                        var tempList = Array<Item>()
                        data.data!.getItemList!.edges!.forEach{item in
                            var node = item?.node
                            var images = Array<ItemImage>()
                            var userInfo = User(id: node!.id,
                                                status: node!.status,
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
                            
                            
                            tempList.append(tempItem)
                            
                        }
                        var items = tempList
                        self.itemList = items
                        let convertedData = self.convertItemToSection(items: items)
                        emitter.onNext(.loadListResult(convertedData))
                        //emitter.onCompleted()
                       
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
    
    
    
    //데이터를 테이블뷰에 뿌려줄 형태로 변환
    func convertItemToSection(items : [Item]) -> [ProductListSection]{
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
