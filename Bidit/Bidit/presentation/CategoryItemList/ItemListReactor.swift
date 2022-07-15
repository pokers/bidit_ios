//
//  ItemListReactor.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/06/16.
//

import Foundation
import ReactorKit

//카테고리별 아이템 리스트
class ItemListReactor : Reactor{
    
    enum Action {
        case viewDidLoad
        case cellSelected(IndexPath)
        case tapSortButton(isOpened : Bool) // 유저 정렬버튼 클릭 -> mutate()를 통해 Mutation반환
        
        case tapPopularityBtn
        case tapEndingSoonBtn
        case tapLatestBtn
        
        case tapFilterBtn
        case disappearFilter
    }
      
      
    enum Mutation {
        case updateDataSource
        case setSelectedIndexPath(IndexPath?)
        case sortListOpen(isOpened : Bool) // -> reduce()를 통해 State반환하여 UI정보 업데이트
        case sortPopularity
        case sortEndingSoon
        case sortLatest
        case openFilter
        case closeFilter
        
        case loadListResult([ProductListSection])// 가져온 리스트 결과
        
    }
      
    
    struct State {
        var itemSection =  [ProductListSection]()// getIListMock() //[ProductListSection]()
        var selectedIndexPath : IndexPath?
        var isSortListOpened : Bool = false
        var sortState : SortState = .latest
        var isFilterOpened : Bool = false
        var resultItemSection : [ProductListSection] = []
        var categoryId : Int
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
            return requestItemList(category: self.initialState.categoryId)// 임시로 입력
            
        case .cellSelected(let indexPath):
            return Observable.concat([
                Observable.just(Mutation.setSelectedIndexPath(indexPath)),
                Observable.just(Mutation.setSelectedIndexPath(nil))
            ])
            
        case .tapSortButton(let isOpened): // isOpened : 누르기 전 상태
            print( "isOpened 열렸니? : \(isOpened)")
            return Observable<Mutation>.just(Mutation.sortListOpen(isOpened: isOpened))
            
        case .tapPopularityBtn:
            print("reactor : 인기순 버튼 클릭")
            return Observable<Mutation>.just(Mutation.sortPopularity)
        
        case .tapEndingSoonBtn:
            print("reactor : 마감직전 버튼 클릭")
            return Observable<Mutation>.just(Mutation.sortEndingSoon)
        case .tapLatestBtn:
            print("reactor : 최신순 버튼 클릭")
            return Observable<Mutation>.just(Mutation.sortLatest)
            
        case .tapFilterBtn:
            print("reactor : 상세 필터 열기")
            return Observable<Mutation>.just(Mutation.openFilter)
        case .disappearFilter:
            print("reactor : 필터 닫기")
            return Observable<Mutation>.just(Mutation.closeFilter)
        
        }
      }
      
      func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        switch mutation {
            
        case .updateDataSource:
            state.itemSection = []//getIListMock()
        
        case .setSelectedIndexPath(let indexPath):
            state.selectedIndexPath = indexPath
            
        case .sortListOpen(let isOpened):
            state.isSortListOpened = isOpened
            print("reactor sortList \(isOpened)")
            
        case .sortPopularity:
            print("reactor 인기순")
            state.sortState = .popularity
            
        case .sortEndingSoon:
            state.sortState = .endingSoon
            
        case .sortLatest:
            state.sortState = .latest
            
        case .openFilter:
            state.isFilterOpened = true
            
        case .closeFilter:
            state.isFilterOpened = false
            
        case .loadListResult(let result):
          
            state.itemSection = result
            break
            
        }
        return state
      }
    
    enum SortState{
        case null
        case popularity
        case endingSoon
        case latest
    }
}
extension ItemListReactor{
    
    //검색결과 요청
    func requestItemList(category : Int) -> Observable<Mutation>{
        return Observable<Mutation>.create(){ emitter in

            let itemQuery = ItemQueryInput.init(id: nil, status: nil, userId: nil, categoryId: category, name: nil, dueDate: nil, deliveryType: nil, sCondition: nil, aCondition: nil, createdAt: nil)
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
                            var tempItem = Item(id: node?.id,
                                                status: node?.status,
                                                userId: node?.userId,
                                                createdAt: node?.createdAt)
                            
                            
                            
                            
                            tempList.append(tempItem)
                            
                        }
                        var items = tempList
                        
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

//func getIListMock() -> [ProductListSection]{
//
//
//    let tempItem1 = ProductListSectionItem.item(EndingSoonCellReactor(item : Item()))
//    let tempItem2 = ProductListSectionItem.item(EndingSoonCellReactor(item : Item(id : 2)))
//    let tempItem3 = ProductListSectionItem.item(EndingSoonCellReactor(item : Item(id : 3)))
//    let tempItem4 = ProductListSectionItem.item(EndingSoonCellReactor(item : Item(id : 4)))
//    let tempItem5 = ProductListSectionItem.item(EndingSoonCellReactor(item : Item(id : 5)))
//
//    let itemInFirstSection = [tempItem1, tempItem2, tempItem3, tempItem4, tempItem5]
//
//    let firstSection = ProductListSection(
//        original: ProductListSection(
//            original: .first(itemInFirstSection),
//            items: itemInFirstSection),
//        items: itemInFirstSection)
//
//    return [firstSection]
//
//}
