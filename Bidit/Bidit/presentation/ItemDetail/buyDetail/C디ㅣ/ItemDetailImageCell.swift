//
//  ItemDetailImageCell.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/06/25.
//

import Foundation
import UIKit
import ReactorKit
import ImageSlideshow
import Reusable

//물건 상세 화면 테이블뷰 셀(이미지 슬라이드)
class ItemDetailImageCell : UITableViewCell, View, Reusable {
    typealias Reactor = ItemDetailImageCellReactor
    
    // MARK: - Property
    var disposeBag = DisposeBag()
    
    
    //배너 이미지 -> ImageSlideShow
    var slideShow = ImageSlideshow()
    
    var item : Item = Item()
    
    //임시 배너
    let images = [
        ImageSource(image: UIImage(named: "tempBanner")!),
        ImageSource(image: UIImage(named: "tempBanner")!),
        ImageSource(image: UIImage(named: "tempBanner")!),
        ImageSource(image: UIImage(named: "tempBanner")!)
        ]
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        

//        self.contentView.snp.makeConstraints{
//                   $0.height.equalTo(320)
//               }
        slideBannerSetting()
//
        contentView.addSubview(slideShow)
        slideShow.snp.makeConstraints{
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(320)
        }
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    //슬라이드 설정
    private func slideBannerSetting(){
        slideShow.setImageInputs(images)
        slideShow.contentScaleMode = .scaleAspectFill
        //slideShow.slideshowInterval = 4
        slideShow.pageIndicatorPosition = .init(horizontal: .right(padding: -20), vertical: .bottom)
        let uiIndcator = UIPageControl()
        uiIndcator.transform = CGAffineTransform(scaleX: 0.7, y: 0.8)
        uiIndcator.page = .zero
        uiIndcator.numberOfPages = 4
        slideShow.pageIndicator = uiIndcator
       // slideShow.currentPageChanged = { index in
        
            //self.currentPageLabel.text = "\(index + 1) / 4"
       // }
    }
    
    
    func bind(reactor: ItemDetailImageCellReactor) {
        //Action
      
            //State
        
        
        
        
          
    }
    
}
