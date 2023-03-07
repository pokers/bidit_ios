//
//  ItemRepository.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/10/19.
//

import Foundation
import RxSwift
import Apollo

enum ItemRepoError : Error{
    case notFoundItem
}
protocol ItemRepository{
    func getItem(id : Int) -> Single<GetItemQuery.Data.GetItem>
    func getItemList() -> Single<GetItemListQuery.Data.GetItemList>
    func getEndingSoonItems() -> Single<[GetEndingSoonItemsQuery.Data.GetEndingSoonItem?]>
}


final class ItemRepositoryImpl : ItemRepository {
    
    fileprivate var apollo : ApolloClient? = nil
    
    
    init(apollo : ApolloClient){
        self.apollo = apollo
    }
    
    func getItem(id : Int) -> Single<GetItemQuery.Data.GetItem> {
        return Single.create{ [weak self] observer in
            if let apollo = self?.apollo{
                apollo.fetch(query: GetItemQuery(id: id)){ result in
                    switch result {
                    case.success(let response) :
                        if let item = response.data?.getItem{
                            observer(.success(item))
                            return
                        }
                        observer(.failure(ItemRepoError.notFoundItem))
                    case.failure(let error):
                        log.error("Error : \(error)" )
                        observer(.failure(error))
                        return
                    }
                    
                }
            }else{
                observer(.failure(RepositoryError.fail))
            }
            
            return Disposables.create()
        }
    }
    
    func getItemList() -> Single<GetItemListQuery.Data.GetItemList> {
        return Single.create{ [weak self] observer in
            if let apollo = self?.apollo{
                apollo.fetch(query: GetItemListQuery()){ result in
                    switch result {
                    case.success(let response) :
                        if let item = response.data?.getItemList{
                            observer(.success(item))
                            return
                        }
                        observer(.failure(ItemRepoError.notFoundItem))
                    case.failure(let error):
                        log.error("Error : \(error)" )
                        observer(.failure(error))
                    
                    }
                    
                }
            }else{
                observer(.failure(RepositoryError.fail))
            }
            return Disposables.create()
        }
    }
    
    func getEndingSoonItems() -> Single<[GetEndingSoonItemsQuery.Data.GetEndingSoonItem?]> {
        return Single.create{ [weak self] observer in
            if let apollo = self?.apollo{
                apollo.fetch(query: GetEndingSoonItemsQuery()){ result in
                    switch result {
                    case.success(let response) :
                        if let item = response.data?.getEndingSoonItems{
                            observer(.success(item))
                            return
                        }
                        observer(.failure(ItemRepoError.notFoundItem))
                    case.failure(let error):
                        log.error("Error : \(error)" )
                        observer(.failure(error))
                    }
                    
                }
            }else{
                observer(.failure(RepositoryError.fail))
            }
            
            return Disposables.create()
        }
    }
    
    
}
