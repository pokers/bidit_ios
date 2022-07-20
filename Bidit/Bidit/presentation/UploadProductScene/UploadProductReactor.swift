//
//  UploadProductReactor.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/09.
//

import Foundation
import ReactorKit
import RxCocoa
import AVFoundation
//판매글 올리기 리액터
class UploadProductReactor : Reactor , DeleteDelegate{
    
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
      }

      
    init() {
        self.initialState = State(imageSection: [], selectedIndexPath: nil)
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
            return requestAddItem(
                itemAddInput:
                        .init(
                            status: status,
                            categoryId: categoryId,
                            sPrice: sPrice,
                            buyNow: buyNow,
                            name: name,
                            title: title,
                            dueDate: dueDate,
                            deliveryType: deliveryType,
                            sCondition: sCondition,
                            aCondition: aCondition,
                            detail: .init(id: nil, status: nil, categoryId: nil, period: detail, type: nil, vendor: nil, battery: nil, flash: nil, ram: nil, size: nil, networkType: nil, weight: nil, cpu: nil, wire: nil, lens: nil, resolution: nil, cam: nil, warranty: nil)),
                description: description,
                images: imgs)
        }
      }
      
      func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        switch mutation {
        case .updateDataSource:
            state.imageSection = initialState.imageSection
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
            var tempReactor = PickedImageReactor(image: image)
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

extension UploadProductReactor {
    
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
}
