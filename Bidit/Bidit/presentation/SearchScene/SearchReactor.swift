//
//  SearchReactor.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/06/28.
//

import Foundation
import ReactorKit
import UIKit

//검색 뷰 컨트롤러 리액터
class SearchReactor : Reactor {
    
    var itemList : [Item] = []
    
    enum Action {
        case viewDidLoad //처음 화면 로드
        case tapSearchBtn(keyword : String) // 검색하기 실행
        case tapSortButton(isOpened : Bool) // 유저 정렬버튼 클릭 -> mutate()를 통해 Mutation반환
        case tapPopularityBtn(keyword : String)
        case tapEndingSoonBtn(keyword : String)
        case tapLatestBtn(keyword : String)
        case cellSelected(IndexPath) //셀 클릭 액션
        //상세필터 적용
        case disappearFilter(deliveryType : Int,
                             minPeriod : Int,
                             maxPeriod : Int,
                             minStartPrice : Int,
                             maxStartPrice : Int,
                             minInstantPrice : Int,
                             maxInstantPrice : Int,
                             keyword : String
        )
       
    }
    
    enum Mutation {
        case loadRecentData//(String)
        case loadSearchResult([ProductListSection])
        
        case sortListOpen(isOpened : Bool) // -> reduce()를 통해 State반환하여 UI정보 업데이트
        case sortPopularity
        case sortEndingSoon
        case sortLatest
        case setSelectedIndexPath(IndexPath?) //셀 클릭
        
        
    }
    
    struct State {
        var keyword : String?
        var recentItemSection : [ProductListSection] = []
        var resultItemSection : [ProductListSection] = []
        var recentKeyword : [String] = []
        
        var isSortListOpened : Bool = false //닫혀있는 상태
        var sortState : SortState = .latest //처음은 최신순
        var selectedIndexPath : IndexPath?
    }
    
    enum SortState{
        case null
        case popularity
        case endingSoon
        case latest
      
    }
    
    let initialState: State
    
    init() {
        self.initialState = State()
    }
}

extension SearchReactor {
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .viewDidLoad:
            return Observable.just(Mutation.loadRecentData)
            
        case .tapSearchBtn(let keyword):
            print("뮤테이션 키워드 : \(keyword)")
            updateRecentKeyword(input: keyword) //검색키워드 추가.
            return getSearchResultFromApi(keyword: keyword, sortType: .latest)
            
        case .tapSortButton(let isOpened): // isOpened : 누르기 전 상태
            print( "isOpened 열렸니? : \(isOpened)")
            return Observable<Mutation>.just(Mutation.sortListOpen(isOpened: isOpened))
            
        case .tapPopularityBtn(let keyword):
            print("reactor : 인기순 버튼 클릭")
            
            return Observable.concat([
                Observable<Mutation>.just(Mutation.sortPopularity),
                getSearchResultFromApi(keyword: keyword, sortType: .popularity)
            ])
        
        case .tapEndingSoonBtn(let keyword):
            print("reactor : 마감직전 버튼 클릭")
            return Observable.concat([
                Observable<Mutation>.just(Mutation.sortEndingSoon),
                getSearchResultFromApi(keyword: keyword, sortType: .endingSoon)
            ])
        case .tapLatestBtn(let keyword):
            print("reactor : 최신순 버튼 클릭")
            return Observable.concat([
                Observable<Mutation>.just(Mutation.sortLatest),
                getSearchResultFromApi(keyword: keyword, sortType: .latest)
            ])
            //셀 클릭
        case .cellSelected(let indexPath):
            return Observable.concat([
                Observable.just(Mutation.setSelectedIndexPath(indexPath)),
                Observable.just(Mutation.setSelectedIndexPath(nil))
            ])
            
        case .disappearFilter(let deliveryType ,
                              let minPeriod,
                              let maxPeriod,
                              let minStartPrice ,
                              let maxStartPrice,
                              let minInstantPrice,
                              let maxInstantPrice,
                              let keyword
        
        ):
            print("reactor : 필터 적용")
            return getListOfFilter(
                                   sortType: self.initialState.sortState,
                                   deliveryType: deliveryType,
                                   minPeriod: minPeriod,
                                   maxPeriod: maxPeriod,
                                   minStartPrice: minStartPrice,
                                   maxStartPrice: maxStartPrice,
                                   minInstantPrice: minInstantPrice,
                                   maxInstantPrice: maxInstantPrice,
                                   keyword: keyword
            
            )
            
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        
        
          switch mutation {
              
          case .loadRecentData:
              //최근 검색 키워드 불러오기
              let data = requestRecentKeyword()
              print( "최근 검색 키워드 불러오기 : \(data)")
              data.forEach{
                  state.recentKeyword.append($0.keyword ?? "")
              }
              
              
              break
         
          
        
          case let .loadSearchResult(result):
            
              state.resultItemSection = result
              break
              
              
          case .sortListOpen(let isOpened):
              state.isSortListOpened = isOpened
              print("reactor sortList \(isOpened)")
              break
              
          case .sortPopularity:
              print("reactor 인기순")
              state.sortState = .popularity
            
              
              break
              
          case .sortEndingSoon:
              state.sortState = .endingSoon
              break
              
          case .sortLatest:
              state.sortState = .latest
              break
              
          case .setSelectedIndexPath(let indexPath):
              state.selectedIndexPath = indexPath
              print("reactor endingSoon : ")
              break
              
              
            
          }
          
          return state
      }
    
}

extension SearchReactor {
    
    //필터 적용,최신순, 인기순, 마감순 타입별 결과 요청
    func getListOfFilter(sortType : SortState,
                         deliveryType : Int?,
                         minPeriod : Int,
                         maxPeriod : Int,
                         minStartPrice : Int,
                         maxStartPrice : Int,
                         minInstantPrice : Int,
                         maxInstantPrice : Int,
                         keyword : String
    
    ) -> Observable<Mutation>{
        return Observable<Mutation>.create(){ emitter in
            var tempDelivery : Int? = nil
            if deliveryType == 4 {
                tempDelivery = nil
            }else {
                tempDelivery = deliveryType
            }

            let itemQuery = ItemQueryInput.init(id: nil, status: nil, userId: nil, categoryId: nil, name: nil, dueDate: nil, deliveryType: tempDelivery, sCondition: nil, aCondition: nil, createdAt: nil)
            let inputKeyword : String? = keyword
            let inputCount : Int? = nil

            Network.shared.apollo.fetch(
                query:GetEndingSoonItemsQuery(
                
                    itemQuery: itemQuery,
                    keyword: inputKeyword,
                    count: inputCount) , cachePolicy: .fetchIgnoringCacheData){ result in
                
                switch result {
                case .success(let data) :
                    print("success \(data)")
                    do {
                       // let data = try JSONSerialization.data(withJSONObject: data.data!.jsonObject, options: .fragmentsAllowed)
                        //let decode : Items = try JSONDecoder().decode(Items.self, from: data)
                        //print("item's id is \(decode.getEndingSoonItems[1] ?? nil)")
//                        decode.getEndingSoonItems.forEach{
//                            self.itemList.append($0)
//                        }
                        var tempList = Array<Item>()
                        data.data?.getEndingSoonItems!.forEach{item in
                            var node = item
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
                            if tempItem.deliveryType == deliveryType {
                                tempList.append(tempItem)
                            }else if tempItem.sPrice ?? 0 < maxStartPrice && tempItem.sPrice ?? 0 > minStartPrice{
                                tempList.append(tempItem)
                            }else if tempItem.buyNow ?? 0 < maxInstantPrice && tempItem.buyNow ?? 0 > minInstantPrice{
                                tempList.append(tempItem)
                            }

                            

                        }
                        
                        
                        
                        var items = tempList
                        let df = DateFormatter()
                        df.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
                        df.locale = Locale(identifier: "ko_KR")
                        df.timeZone = TimeZone(identifier: "UTC")!
                        //마감순
                        var sortedArray = tempList.sorted(by: {df.date(from: $0.dueDate!)! < df.date(from: $1.dueDate!)!})
                        if sortType == .endingSoon {
                            print("마감순 출력")
                            sortedArray = tempList.sorted(by: {df.date(from: $0.dueDate!)! < df.date(from: $1.dueDate!)!})
                        }else if sortType == .latest {
                            //최신순
                            print("최신순 출력")
                            sortedArray = tempList.sorted(by: {df.date(from: $0.createdAt!)! < df.date(from: $1.createdAt!)!})
                        }else if sortType == .popularity {
                            //인기순'
                            print("인기순 출력")
                            sortedArray = tempList.sorted(by:  {$0.viewCount! < $1.viewCount!})
                        }
                        self.itemList = sortedArray


                        let convertedData = self.convertItemToSection(items: sortedArray)
                        emitter.onNext(.loadSearchResult(convertedData))
//                        //emitter.onCompleted()
                       
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
    
    //검색결과 요청
    func getSearchResultFromApi(keyword : String, sortType : SortState) -> Observable<Mutation>{
        LoadingIndicator.showLoading()
        return Observable<Mutation>.create(){ emitter in

            let itemQuery = ItemQueryInput.init()
            let inputKeyword = keyword
            let inputCount : Int? = nil

            Network.shared.apollo.fetch(
                query:GetEndingSoonItemsQuery(
                
                    itemQuery: itemQuery,
                    keyword: inputKeyword,
                    count: inputCount) , cachePolicy: .fetchIgnoringCacheData){ result in
                
                switch result {
                case .success(let data) :
                    print("success \(data)")
                    do {
                       // let data = try JSONSerialization.data(withJSONObject: data.data!.jsonObject, options: .fragmentsAllowed)
                        //let decode : Items = try JSONDecoder().decode(Items.self, from: data)
                        //print("item's id is \(decode.getEndingSoonItems[1] ?? nil)")
//                        decode.getEndingSoonItems.forEach{
//                            self.itemList.append($0)
//                        }
                        var tempList = Array<Item>()
                        data.data?.getEndingSoonItems!.forEach{item in
                            var node = item
                            var images = Array<ItemImage>()

                            node?.image?.forEach{

                                images.append(ItemImage(url : $0?.url ?? ""))

                            }

                            var tempItem = Item(id: node?.id,
                                                status: node?.status,
                                                cPrice : node?.cPrice,
                                                viewCount: node?.viewCount,
                                                title : node?.title,
                                                dueDate : node?.dueDate,
                                                createdAt: node?.createdAt,
                                                image: images
                            )

                            tempList.append(tempItem)

                        }
                        
                        
                        
                        var items = tempList
                        let df = DateFormatter()
                        df.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
                        df.locale = Locale(identifier: "ko_KR")
                        df.timeZone = TimeZone(identifier: "UTC")!
                        //마감순
                        var sortedArray = tempList.sorted(by: {df.date(from: $0.dueDate!)! < df.date(from: $1.dueDate!)!})
                        if sortType == .endingSoon {
                            print("마감순 출력")
                            sortedArray = tempList.sorted(by: {df.date(from: $0.dueDate!)! < df.date(from: $1.dueDate!)!})
                        }else if sortType == .latest {
                            //최신순
                            print("최신순 출력")
                            sortedArray = tempList.sorted(by: {df.date(from: $0.createdAt!)! < df.date(from: $1.createdAt!)!})
                        }else if sortType == .popularity {
                            //인기순'
                            print("인기순 출력")
                            sortedArray = tempList.sorted(by:  {$0.viewCount! < $1.viewCount!})
                        }
                        self.itemList = sortedArray


                        print("검색 결과 : \(sortedArray.count)개")
                        LoadingIndicator.hideLoading()//로딩 끝
                        let convertedData = self.convertItemToSection(items: sortedArray)
                        emitter.onNext(.loadSearchResult(convertedData))
//                        //emitter.onCompleted()
                       
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
    

    
    //최근 검색 데이터 불러오기
    func requestRecentKeyword() -> [RecentSearchTerm]{
        print("최근 검색 키워드 불러오기 함수 requestRecentKeyword")
        return CoreDataManager.shared.loadRecentKeyword(request: RecentSearchTerm.fetchRequest())
    }
    //최근 검색 제품 불러오기
    func requestRecentProduct() -> [RecentProduct]{
        print("최근 검색 제품 불러오기")
        return CoreDataManager.shared.loadRecentKeyword(request: RecentProduct.fetchRequest())
    }
    //최근 검색 키워드에 추가. //검색 요청시
    func updateRecentKeyword(input : String){
        print( " 최근 검색 키워드 추가  : \(input)")
        CoreDataManager.shared.saveRecentKeyword(keyword: input, completion: {_ in
        })
        
        let count = requestRecentKeyword().count
        let last = requestRecentKeyword().first?.keyword ?? ""
        if  count > 3{
            let isDeleted = CoreDataManager.shared.delete(keyword : last, request: RecentSearchTerm.fetchRequest())
            print("삭제 여부 \(isDeleted)")
        }
        
//        let fetchResult = PersistenceManager.shared.fetch(request: request)
//        PersistenceManager.shared.delete(object: fetchResult.last!)
        
        
        
    }// 최근 검색 제품에 추가.
    func updateRecentProduct(item : Item){
        return CoreDataManager.shared.saveRecentProduct(id: item.id, title: item.title ?? "", image: "", dueDate: item.dueDate ?? "", cPrice: item.cPrice ?? 0 , completion: {_ in
        })
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
    func deleteKey(keyword : String){
        let isDeleted = CoreDataManager.shared.delete(keyword : keyword, request: RecentSearchTerm.fetchRequest())
        print("삭제 여부 \(isDeleted)")
    }
    
}

