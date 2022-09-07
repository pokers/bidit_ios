//
//  BannerCell.swift
//  Bidit
//

//

import Foundation
import UIKit
import ReactorKit
import Reusable


class BannerCell : UITableViewCell , View, Reusable{
    typealias Reactor = BannerCellReactor
    
    var disposeBag = DisposeBag()

      // MARK: Constants
      struct Image {
        static let color = UIColor.black
      }
      
      // MARK: UI
      let bannerImage = UIImageView().then {
       
        
          $0.image = UIImage(named: "default_banner_img")
          $0.backgroundColor = Image.color
          
      }
      
      // MARK: Constants
      override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
      ) {
        super.init(
          style: style,
          reuseIdentifier: reuseIdentifier
        )
        
        contentView.addSubview(bannerImage)
        makeConstraints()
      }
    

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeConstraints() {
        bannerImage.snp.makeConstraints{
            $0.edges.equalToSuperview()
            
        }
        
      }
    
       func bind(reactor: BannerCellReactor) {
           
           
       }

    
}
