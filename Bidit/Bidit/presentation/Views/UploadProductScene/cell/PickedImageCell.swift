//
//  PickedImageCell.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/09.
//

import Foundation
import UIKit
import ReactorKit
import RxSwift
import Photos
import BSImagePicker
import RxCocoa
import Reusable


//제품 사진 셀
class PickedImageCell : UICollectionViewCell, View, Reusable{
    
    typealias Reactor = PickedImageReactor
    
    // MARK: - Property
    var disposeBag = DisposeBag()
    
    let containerView = UIView()
    let photoContainer = UIView() //사진 컨테이너
    let addContainer = UIView() // 사진 추가 컨테이너
    let cameraButton = UIImageView() //첫번째 사진추가 버튼
    let numberText = UILabel() //사진 개수
    let representer = UILabel() //대표사진
    let deleteButton = UIButton() // X 버튼
    let imageView = UIButton() //사진
    
    
    
    //이미지 삭제 이벤트
    var imgDelete : (() -> ()) = {}
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layout()
        attribute()
        //self.backgroundColor = .gray
    }
    
    
    
    func layout(){
        //전체 컨테이너 뷰
        self.contentView.addSubview(containerView)
        containerView.snp.makeConstraints{
            $0.top.bottom.trailing.leading.equalToSuperview()
            //$0.width.height.equalTo(78)
        }
        //고른 사진 이미지
        containerView.addSubview(photoContainer)
        containerView.addSubview(deleteButton)
        photoContainer.snp.makeConstraints{
            $0.top.equalToSuperview().offset(6)
            $0.trailing.equalToSuperview().inset(6)
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        deleteButton.snp.makeConstraints{ //X버튼
            $0.top.trailing.equalToSuperview()
            $0.width.height.equalTo(20)
        }
        photoContainer.addSubview(imageView)
        imageView.snp.makeConstraints{ //이미지뷰
            $0.top.bottom.trailing.leading.equalToSuperview()
        }
        
        photoContainer.addSubview(representer)
        representer.snp.makeConstraints{ //대표사진
            $0.bottom.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(20)
            $0.leading.trailing.equalToSuperview()
            
        }
        representer.textAlignment = .center
        
        //사진 추가 컨테이너 뷰
        containerView.addSubview(addContainer)
        addContainer.snp.makeConstraints{
            $0.top.equalToSuperview().offset(6)
            $0.trailing.equalToSuperview().inset(6)
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        addContainer.addSubview(cameraButton)
        cameraButton.snp.makeConstraints{ //카메라 버튼
            $0.top.equalToSuperview().offset(18)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(27)
            $0.height.equalTo(20.26)
        }
        addContainer.addSubview(numberText)
        numberText.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(cameraButton.snp.bottom).offset(8)
            $0.width.equalTo(26)
            $0.height.equalTo(12)
        }
    }
    
    func attribute(){
        //사진 추가 버튼
        cameraButton.image = UIImage(named: "camera_btn_img")
        addContainer.backgroundColor = UIColor(red: 0.962, green: 0.962, blue: 0.962, alpha: 1)
        addContainer.layer.cornerRadius = 4
        numberText.text = "0/10"
        numberText.font = .systemFont(ofSize: 12, weight: .medium)
        numberText.textColor = UIColor(red: 0.62, green: 0.62, blue: 0.62, alpha: 1)
        
        //사진 셀
        deleteButton.setImage(UIImage(named: "delete_btn_img"), for: .normal)
        representer.textColor = .white
        representer.backgroundColor = .black
        representer.text = "대표 사진"
        representer.font = .systemFont(ofSize: 12)
        
        
    }
    
    func bind(reactor: PickedImageReactor) {
        //Action
        self.deleteButton.rx.tap.subscribe(onNext : {
            self.imgDelete()
            print("삭제")
            
        }).disposed(by: disposeBag)
        
//        self.deleteButton.rx.tap
//            .map(Reactor.Action.deleteImg)
//            .bind(to: reactor.action)
//            .disposed(by: disposeBag)
        
        reactor.state.map{$0.image}.subscribe(onNext : {result in
            self.imageView.setImage(result, for: .normal)
        }).disposed(by: disposeBag)
        
        
        
        reactor.state
            .map { $0.image }
            .subscribe(onNext : { result in
                self.imageView.setImage(result, for: .normal)
            })
            .disposed(by: self.disposeBag)
        
        reactor.state
            .map { $0.count }
            .subscribe(onNext : { result in
                self.numberText.text = "\(result)/10"
            })
            .disposed(by: self.disposeBag)
        
        
//        reactor.state.map{$0.image}
//            .subscribe(onNext : {result in
//                if result == nil{
//                    self.contentView.snp.makeConstraints{
//                        $0.width.equalTo(0)
//                        
//                    }
//                }
//                
//            })
        
//        self.rx.layoutSubviews
//              .mapVoid()
//              .map(Reactor.Action.layoutSubviews)
//              .bind(to: reactor.action)
//              .disposed(by: self.disposeBag)
//
//        collectionView.rx.itemSelected //아이템 클릭
//            .map{Reactor.Action.cellSelected($0)}
//            .bind(to: reactor.action)
//            .disposed(by: disposeBag)
//
            //State
            
        
//        reactor.state.map{ $0.selectedIndexPath}
//            .compactMap{$0}
//            .subscribe(onNext : { [weak self] indexPath in
//                let vc = ItemListViewController()
//                let listReactor = ItemListReactor(initialState: ItemListReactor.State.init())
//                vc.reactor = listReactor
//               // vc.bind(reactor: listReactor)
//                //self?.navigationController?.pushViewController(vc, animated: true)
//                guard let self = self else { return }
//                //self.collectionView.deselectRow(at: indexPath, animated: true)
//
//            }).disposed(by: disposeBag)
          
    }
    
  
    

    
    
    
}


