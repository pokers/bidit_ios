//
//  ModifyProductReactor.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/17.
//

import Foundation
import ReactorKit
import RxCocoa
import AVFoundation
import Kingfisher

class ModifyProductReactor : Reactor , DeleteDelegate{
    func deleteImage(image : UIImage) {
        updateDeleteImg(image)
    }
    var deleteImgRelay = PublishRelay<UIImage>() //view -> ViewModel //로그인 통과 여부 .

    func updateDeleteImg(_ objects : UIImage) -> Void{
        deleteImgRelay.accept(objects)
    }
    
    var initialState: State
    
    enum Action {
        case viewDidLoad
        case cellSelected(IndexPath)
        case addImage([UIImage])
        case tapDelete(index : Int)
        case tapUpload(imgs : [String],
                       status : Int,
                       buyNow : Int,
                       title : String,
                       categoryId : Int,
                       sPrice : Int,
                       name : String,
                       dueDate : String,
                       deliveryType : Int,
                       sCondition : Int,
                       aCondition : Int,
                       description : String,
                       detail : Int
        )
    }
    
    enum Mutation {
        case updateDataSource
        case setSelectedIndexPath(IndexPath?)
        case addPhoto([UIImage])
        case deletePhoto(Int)
        case uploadRequest
    }
      
    struct State {
        var imageSection : [UploadAlbumSection] = []
        var selectedIndexPath : IndexPath?
        var item : Item
        var itemImages : [ItemImage] = []
      }

      
    init(currItem : Item) {
        self.initialState = State(imageSection: [], selectedIndexPath: nil, item: currItem, itemImages: currItem.image ?? [])
    }
      
      func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .viewDidLoad:
          return Observable<Mutation>.just(.updateDataSource)
            
        case .cellSelected(let indexPath):
            
            print("카메라 추가 버튼 클릭")
            return Observable.concat([
                Observable.just(Mutation.setSelectedIndexPath(indexPath)),
                Observable.just(Mutation.setSelectedIndexPath(nil))
            ])
            
        case .addImage(let images):
            print("이미지 추가 : \(images)")
            return Observable<Mutation>.just(.addPhoto(images))
            

        case .tapDelete(let index):
            print("이미지 삭제 : \(index)")
            return Observable<Mutation>.just(.deletePhoto(index))
            
        case .tapUpload(let imgs,let status,let buyNow, let title, let categoryId, let sPrice, let name, let dueDate, let deliveryType, let sCondition, let aCondition, let description, let detail) :
            
            
            for i in 0...initialState.itemImages.count - 1 {
                if  i >= imgs.count{
                    break
                }
//                initialState.itemImages[i].url =
                let imageId = initialState.itemImages[i].id
                let imageURL = imgs[i]
                modifyImage(itemId: initialState.item.id, itemImageUpdateInput: .init(itemImageId: imageId,
                                                                                      image: imageURL))
            }
            
            return modifyItem(itemId: initialState.item.id,
                              itemUpdate: .init(status: status,
                                                categoryId: categoryId,
                                                sPrice: sPrice,
                                                buyNow: buyNow,
                                                name: name,
                                                title: title,
                                                dueDate: dueDate,
                                                deliveryType: deliveryType,
                                                sCondition: sCondition,
                                                aCondition: sCondition,
                                                detail: .init(id: nil, status: nil, categoryId: nil, period: detail, type: nil, vendor: nil, battery: nil, flash: nil, ram: nil, size: nil, networkType: nil, weight: nil, cpu: nil, wire: nil, lens: nil, resolution: nil, cam: nil, warranty: nil)),
                              description: nil)
            
//            return requestAddItem(
//                itemAddInput:
//                        .init(
//                            status: status,
//                            categoryId: categoryId,
//                            sPrice: sPrice,
//                            buyNow: buyNow,
//                            name: name,
//                            title: title,
//                            dueDate: dueDate,
//                            deliveryType: deliveryType,
//                            sCondition: sCondition,
//                            aCondition: aCondition,
//                            detail: .init()),
//                description: description,
//                images: imgs)
        }
      }
      
      func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        switch mutation {
        case .updateDataSource:
            state.imageSection = initialState.imageSection
            var imageList = Array<UIImage>()
            self.initialState.item.image?.forEach{
                var img = loadImg(url: $0.url)
                imageList.append(img)
            }
            
            state.imageSection = getAlbumSection(items: imageList)
            break
            
        case .setSelectedIndexPath(let indexPath):
            state.selectedIndexPath = indexPath

            print("reactor endingSoon : ")
            break
            
        case .addPhoto(let images):
            state.imageSection = getAlbumSection(items: images)
            
        case .deletePhoto(let index) :
            var tempList = state.imageSection[0].items
            tempList.remove(at: index)
            
           
            state.imageSection = [UploadAlbumSection(original:
                                    UploadAlbumSection(
                                        original: .album(tempList),
                                        items: tempList)
                                   ,items: tempList
                                  )
            ]
        case .uploadRequest:
            break
        }
        return state
      }
    
    
    func getAlbumSection(items : [UIImage]) -> [UploadAlbumSection]{
        
        let list : [UIImage] = items
        print("list 개수 : \(list.count)")
        var array = Array<UploadAlbumSectionItem>()
        
        items.forEach{image in
            let tempReactor = PickedImageReactor(image: image)
            tempReactor.delegate = self
            array.append( UploadAlbumSectionItem.album(tempReactor))
        }
        print("array 개수 : \(array.count)")
        
        let itemInFirstSection = array
        
        let firstSection = UploadAlbumSection(
            original:
                UploadAlbumSection(
                    original: .album(array),
                    items: array)
            ,items: array)
        print("firstSection 개수 : \(firstSection.items)")
        return [firstSection]
    }

    
    
}

extension ModifyProductReactor {
    //UIImage -> URL
    func getUrlFromS3(images : [UIImage]) -> [String]{
        var urls = Array<String>()
        images.forEach{
            var result = S3Manager.shared.getURL(image: $0)
            urls.append(result)
        }
        return urls
    }
    
    func modifyItem(itemId : Int?, itemUpdate : ItemUpdateInput?, description : String?) -> Observable<Mutation>{
        return Observable<Mutation>.create(){emitter in
            Network.shared.apollo.perform(mutation: UpdateItemMutation(itemId: itemId,
                                                                       itemUpdate: itemUpdate,
                                                                       description: description)){result in
                   switch result {
                   case .success(let data) :
                       print("success \(data)")
                       do {
                           print("upload result :  \(data)")
   //                        decode.getEndingSoonItems.forEach{
   //                            self.itemList.append($0)
   //                        }
   //
   //                        self.updateList(decode.getEndingSoonItems)
                           //return 대신
                           emitter.onNext(.uploadRequest)
                           //emitter.onCompleted()
                          
                       }catch (let error) {
                           print("upload fail")
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
    
    func modifyImage(itemId : Int?, itemImageUpdateInput : ItemImageUpdateInput){
        
            Network.shared.apollo.perform(mutation: UpdateItemImageMutation(itemId: itemId,
                                                                            itemImageUpdate: itemImageUpdateInput)
            ){result in
                   switch result {
                   case .success(let data) :
                       print("success \(data)")
                       do {
                           print("modify result :  \(data)")
   //                        decode.getEndingSoonItems.forEach{
   //                            self.itemList.append($0)
   //                        }
   //
   //                        self.updateList(decode.getEndingSoonItems)
                           //return 대신
                           //emitter.onNext(.uploadRequest)
                           //emitter.onCompleted()
                          
                       }catch (let error) {
                           print("modify fail")
                           print(error.localizedDescription)
                       }
                       break
                   case .failure(let error) :
                       print("error : \(error)")
                       //self.passed = false
                   }
                   
               }
               
        
        
    }
    
    func requestAddItem(itemAddInput : ItemAddInput, description : String, images : [String]) -> Observable<Mutation>{
        
        
        
        return Observable<Mutation>.create(){ emitter in
            
            Network.shared.apollo.perform(mutation: AddItemMutation(
                itemAdd: .init(
                    status: itemAddInput.status,
                    categoryId: itemAddInput.categoryId,
                    sPrice: itemAddInput.sPrice,
                    buyNow: itemAddInput.buyNow,
                    name: itemAddInput.name,
                    title: itemAddInput.title,
                    dueDate: itemAddInput.dueDate,
                    deliveryType: itemAddInput.deliveryType,
                    sCondition: itemAddInput.sCondition,
                    aCondition: itemAddInput.aCondition,
                    detail: itemAddInput.detail),
                description: description,
                images: images))
            { result in
                switch result {
                case .success(let data) :
                    print("success \(data)")
                    do {
                        print("upload result :  \(data)")
//                        decode.getEndingSoonItems.forEach{
//                            self.itemList.append($0)
//                        }
//
//                        self.updateList(decode.getEndingSoonItems)
                        //return 대신
                        emitter.onNext(.uploadRequest)
                        emitter.onCompleted()
                       
                    }catch (let error) {
                        print("upload fail")
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
    
    
    //이미지 로드 -> UIImage()
    func loadImg(url : String) -> UIImage{
        var image : UIImage?
        if let thumbnailUrl = URL(string: url) {
            KingfisherManager.shared.retrieveImage(with: thumbnailUrl, completionHandler: { result in
            switch(result) {
                case .success(let imageResult):
//                    let resized = imageResult.image.resizedImageWithContentMode(.scaleAspectFit, bounds: CGSize(width: 84, height: 84), interpolationQuality: .medium)
                    //imageView.isHidden = false
                image = imageResult.image
                case .failure(let error):
                    
                break
                }
            })
        }
        return image ?? UIImage()
    }
}
