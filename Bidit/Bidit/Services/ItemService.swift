//
//  ItemService.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/10/19.
//

import Foundation
import RxSwift

protocol ItemService{
    func getItem() -> Single<GetItemQuery.Data.GetItem>
    func getEndingSoonItems() -> Single<[GetEndingSoonItemsQuery.Data.GetEndingSoonItem?]>
    func getItemList() -> Single<GetItemListQuery.Data.GetItemList>
}

final class ItemServiceImpl : ItemService {
  
    
    fileprivate var itemRepo : ItemRepository
    
    init(itemRepo : ItemRepository){
        self.itemRepo = itemRepo
    }
    
    func getItem() -> Single<GetItemQuery.Data.GetItem> {
        return self.itemRepo.getItem(id: 1)
    }
    
    func getEndingSoonItems() -> Single<[GetEndingSoonItemsQuery.Data.GetEndingSoonItem?]> {
        return self.itemRepo.getEndingSoonItems()
    }
    
    func getItemList() -> Single<GetItemListQuery.Data.GetItemList> {
        return self.itemRepo.getItemList()
    }
    
    
}
