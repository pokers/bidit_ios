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
    var soonListUpdated = PublishRelay<[Item]>() //view -> ViewModel //로그인 통과 여부 .

    func updateList(_ objects : [Item]){
        
        soonListUpdated.accept(objects)
        
    }
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
      
      let initialState: State
      
      init(
        initialState: State
      ) {
        self.initialState = initialState
      }
      
      func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .viewDidLoad:
            return getDataFromApi()
            
        case .cellSelected(let indexPath):
            return Observable.concat([
                Observable.just(Mutation.setSelectedIndexPath(indexPath)),
                Observable.just(Mutation.setSelectedIndexPath(nil))
            ])
        case .updateSoon:
            print("update Soon 호출")
            return getDataFromApi()
        
        }
      }
      
    
      func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        
        
          switch mutation {
        
          case .updateDataSource(let itemList):
            
              state.itemSection = getItemListMock(items: itemList).self
              print("\(state.itemSection.description) 결과 state 개수")
              print("\(state.itemSection.count) 결과 count")
              break
            
        
          case .setSelectedIndexPath(let indexPath):
              state.selectedIndexPath = indexPath
              print("reactor endingSoon : ")
              break
        
          case .updateDataSource(_):
              state.itemSection = getItemListMock(items: itemList)
              print("\(state.itemSection.count) 결과2 state 개수")
              break
          }

          return state
      }
}
extension EndingSoonReactor {
    //EndingSoon 리스트 불러오기 요청
    func getDataFromApi() -> Observable<Mutation>{
        
        return Observable<Mutation>.create(){ emitter in
            
            Network.shared.apollo.fetch(query: GetItemListQuery()){ result in
                switch result {
                case .success(let data) :
                    print("success \(data)")
                    do {
                        //let data = try JSONSerialization.data(withJSONObject: data.data!.jsonObject, options: .fragmentsAllowed)
                        //let decode : Items = try JSONDecoder().decode(Items.self, from: data)
                        
                        var tempList = Array<Item>()
                        data.data!.getItemList!.edges!.forEach{item in
                            var node = item?.node
                            var images = Array<ItemImage>()
                            
                            node?.image?.forEach{
                                
                                images.append(ItemImage(url : $0?.url ?? ""))
                                
                            }
                            
                            var tempItem = Item(id: node?.id,
                                                status: node?.status,
                                                userId: node?.userId,
                                                cPrice : node?.cPrice,
                                                title : node?.title,
                                                dueDate : node?.dueDate,
                                                createdAt: node?.createdAt,
                                                image: images
                            )
                            
                            
                            
                            
                            tempList.append(tempItem)
                            
                        }
                        var items = tempList
                            self.itemList = tempList
                        
                        
                        //self.updateList(decode.getEndingSoonItems)
                        //return 대신
                        emitter.onNext(.updateDataSource(items))
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
}


func getItemListMock(items : [Item]) -> [ProductListSection]{
    
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

func getUpdateListMock(items : [Item]) -> [ProductListSection]{
    
    let list : [Item] = items
    print("list 개수 : \(list.count)")
    var array = Array<ProductListSectionItem>()
    
    items.forEach{
        array.append( ProductListSectionItem.item(EndingSoonCellReactor(item : $0)))
    }
    print("array 개수 : \(array.count)")
    
    
    let firstSection = ProductListSection(
        original:
            ProductListSection(
                original: .first(array),
                items: array)
        ,items: array)
    print("firstSection 개수 : \(firstSection.items)")
    return [firstSection]
    
    
    

}
