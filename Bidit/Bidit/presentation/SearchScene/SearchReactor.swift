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
    
    enum Action {
        case viewDidLoad //처음 화면 로드
        case tapSearchBtn(String) // 검색하기 실행
    }
    
    enum Mutation {
        case loadRecentData//(String)
        case loadSearchResult([ProductListSection])
        
    }
    
    struct State {
        var keyword : String?
        var recentItemSection : [ProductListSection] = []
        var resultItemSection : [ProductListSection] = []
        var recentKeyword : [String] = []
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
            
        case let .tapSearchBtn(keyword):
            print("뮤테이션 키워드 : \(keyword)")
            updateRecentKeyword(input: keyword) //검색키워드 추가.
            return getSearchResultFromApi(keyword: keyword)
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        
        
          switch mutation {
              
          case .loadRecentData:
              
              //최근 검색 키워드 불러오기
              let data = requestRecentKeyword()
              print( " 최근 검색 키워드 불러오기 : \(data)")
              data.forEach{
                  state.recentKeyword.append($0.keyword ?? "")
              }
              
              
              break
         
          
        
          case let .loadSearchResult(result):
            
              state.resultItemSection = result
              break
            
          }
          
          return state
      }
    
}

extension SearchReactor {
    
    //검색결과 요청
    func getSearchResultFromApi(keyword : String) -> Observable<Mutation>{
        
        
        
        return Observable<Mutation>.create(){ emitter in

            let itemQuery = ItemQueryInput.init()
            let inputKeyword = keyword
            let inputCount : Int? = nil
                
            
            Network.shared.apollo.fetch(
                query:GetEndingSoonItemsQuery(
                
                    itemQuery: itemQuery,
                    keyword: inputKeyword,
                    count: inputCount)){ result in
                
                switch result {
                case .success(let data) :
                    print("success \(data)")
                    do {
                        let data = try JSONSerialization.data(withJSONObject: data.data!.jsonObject, options: .fragmentsAllowed)
                        let decode : Items = try JSONDecoder().decode(Items.self, from: data)
                        print("item's id is \(decode.getEndingSoonItems[1])")
//                        decode.getEndingSoonItems.forEach{
//                            self.itemList.append($0)
//                        }
                        let convertedData = self.convertItemToSection(items: decode.getEndingSoonItems)
                        emitter.onNext(.loadSearchResult(convertedData))
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
    
    //최근 검색 데이터 불러오기
    func requestRecentKeyword() -> [RecentSearchTerm]{
        
        return CoreDataManager.shared.loadRecentKeyword(request: RecentSearchTerm.fetchRequest())
    }
    //최근 검색 제품 불러오기
    func requestRecentProduct() -> [RecentProduct]{
        
        return CoreDataManager.shared.loadRecentKeyword(request: RecentProduct.fetchRequest())
    }
    //최근 검색 키워드에 추가. //검색 요청시
    func updateRecentKeyword(input : String){
        print( " 최근 검색 키워드 추가  : \(input)")
        CoreDataManager.shared.saveRecentKeyword(keyword: input, completion: {_ in
        })
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
    
}

