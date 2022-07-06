//
//  CategoryCell.swift
//  Bidit
//


import Foundation
import UIKit
import Reusable
import ReactorKit
import RxSwift
import RxCocoa


//카테고리 버튼 컬렉션뷰 셀
class CategoryCell : UICollectionViewCell,Reusable,View{
    var disposeBag: DisposeBag = DisposeBag()
    
    typealias Reactor = CategoryReactor
    
    
    var iconImage : UIImageView = UIImageView().then{
        $0.image = UIImage(named: "tempIcon")
        $0.contentMode = .scaleAspectFit
    }
    var textCategory : UILabel = UILabel().then{
        $0.font = .systemFont(ofSize: 12)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        var originWidth = iconImage.image?.size.width
        var originHeigth = iconImage.image?.size.height
        
        contentView.addSubview(iconImage)
        iconImage.snp.makeConstraints{

            $0.width.equalTo(51)
            $0.height.equalTo(45)

        }
        
//        contentView.addSubview(textCategory)
//        textCategory.snp.makeConstraints{
//            $0.top.equalTo(iconImage.snp.bottom)
//
//
//        }
//        textCategory.text = "카테고리"
    }
    
    //따로 호출할 필요 없음. 리액터가 바뀌면 자동으로 호출
    func bind(reactor: CategoryReactor) {
      
        reactor.state
            .map { $0.categoryName}
            .subscribe(onNext : {name in
                self.iconImage.image = UIImage(named: "\(name)")
            })
            .disposed(by: self.disposeBag)
    }
}
