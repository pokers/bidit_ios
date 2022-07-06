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
            return Observable<Mutation>.just(.updateDataSource(itemList))
        
        }
      }
      
    
      func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        
        
          switch mutation {
        
          case .updateDataSource(itemList):
            
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
  
//
    
}
extension EndingSoonReactor {
    
    func getDataFromApi() -> Observable<Mutation>{
        return Observable<Mutation>.create(){ emitter in
            
            Network.shared.apollo.fetch(query: GetEndingSoonItemsQuery()){ result in
                
                switch result {
                case .success(let data) :
                    print("success \(data)")
                    do {
                        let data = try JSONSerialization.data(withJSONObject: data.data!.jsonObject, options: .fragmentsAllowed)
                        let decode : Items = try JSONDecoder().decode(Items.self, from: data)
                        print("item's id is \(decode.getEndingSoonItems[1])")
                        decode.getEndingSoonItems.forEach{
                            self.itemList.append($0)
                        }
                        
                        self.updateList(decode.getEndingSoonItems)
                        //return 대신
                        emitter.onNext(.updateDataSource(decode.getEndingSoonItems))
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
