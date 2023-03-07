//
//  DataToItemsAdapter.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/11/13.
//

import Foundation
import Apollo

protocol ItemListProviderService {
    func dataToItems(dataItemList : GraphQLSelectionSet) -> [Item]
}


struct EndingSoonListProvider {
    /*
     Data.GetItemList -> [Item] 변환
     */
    func dataToItems(dataItemList:  GetItemListQuery.Data.GetItemList) -> [Item] {
        var tempList = Array<Item>()
        
        dataItemList.edges?.forEach{item in
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
            
            if tempItem.status != ItemStatus.CANCEL.rawValue && tempItem.status != ItemStatus.SOLD.rawValue{
                tempList.append(tempItem)
            }
        }
        return tempList
    }
}

class DataToItemsAdapter: ItemListProviderService {
    
    private var endingSoonListProvider = EndingSoonListProvider()
    
    func dataToItems(dataItemList: Apollo.GraphQLSelectionSet) -> [Item] {
        endingSoonListProvider.dataToItems(dataItemList: dataItemList as! GetItemListQuery.Data.GetItemList)
    }
    
    

}
