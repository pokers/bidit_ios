//
//  UploadProductReactor.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/09.
//

import Foundation
import ReactorKit
//판매글 올리기 리액터
class UploadProductReactor : Reactor{
    
    var initialState: State
    
    enum Action {
        case viewDidLoad
        case cellSelected(IndexPath)
        case addImage([UIImage])
    }
    
    enum Mutation {
        case updateDataSource
        case setSelectedIndexPath(IndexPath?)
        case addPhoto([UIImage])
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
            
        case .addImage(let image):
            print("이미지 추가 : \(image)")
            return Observable<Mutation>.just(.addPhoto(image))
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
        }
        return state
      }
    
    
    
    
    
}
func getAlbumSection(items : [UIImage]) -> [UploadAlbumSection]{
    
    let list : [UIImage] = items
    print("list 개수 : \(list.count)")
    var array = Array<UploadAlbumSectionItem>()
    
    items.forEach{image in
        array.append( UploadAlbumSectionItem.album(PickedImageReactor(image: image)))
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
