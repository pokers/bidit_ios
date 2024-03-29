//
//  BottomSheetReactor.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/05.
//

import Foundation
import ReactorKit
class BottomSheetReactor : Reactor {
    enum Action {
        case viewDidLoad
        case tapBiddingBtn(id : Int, price : Int)
    }
    
    enum Mutation {
        case updateData
        case requestBidding(price : Int)
        case biddingFail
    }
    
    struct State {
        var item : Item
        var biddingPrice : Int
        var biddingSuccess = 0
        var biddingError = false
    }
    
    let initialState: State
    
    init(item : Item) {
        self.initialState = State(item: item, biddingPrice: item.sPrice ?? 0)
    }
}

extension BottomSheetReactor {
    func mutate(action: Action) -> Observable<Mutation> {
        
    
        switch action {
        case.tapBiddingBtn(let nowItemid , let price) :
            print(" 비딩 id \(nowItemid),  가격 : \(price)")
            return requestBidAPI(itemId: nowItemid, price: price)
            
            
        case.viewDidLoad :
            
            return Observable<Mutation>.just(.updateData)
        }
        
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
      var state = state
      switch mutation {
      case .updateData:
          break
       
          
      case .requestBidding(let price):
          //비딩 성공 시 넘어가기
          state.biddingError = false
          state.biddingSuccess  = price
          break
          
      case .biddingFail:
          state.biddingError = true
          break
          
      }
      return state
    
    }
    
    
    
    
    
    
}

extension BottomSheetReactor {
    func requestBidAPI(itemId : Int, price : Int) -> Observable<Mutation>{
        LoadingIndicator.showLoading() //로딩 화면 보이기
        return Observable<Mutation>.create(){ emitter in
            
            Network.shared.apollo.perform(mutation: RequestBidMutation(bidInfo: .init(itemId: itemId, price: price))){ result in
                
                switch result {
                case .success(let data) :
                    print("success \(data)")
                    do {
                        print("bidding result :  \(data)")
//                        decode.getEndingSoonItems.forEach{
//                            self.itemList.append($0)
//                        }
                        print( "비딩 실패 이유 :  \(data.errors?[0].description) ")
                        if data.errors?[0].description ?? "" == "Could not bid over your price."{
                            //실패시
                            print("비딩 실패")
                            emitter.onNext(.biddingFail)
                        }else { //성공시
                            emitter.onNext(.requestBidding(price: price))
                        }
//
//                        self.updateList(decode.getEndingSoonItems)
                        //return 대신
                        LoadingIndicator.hideLoading()
                        
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

