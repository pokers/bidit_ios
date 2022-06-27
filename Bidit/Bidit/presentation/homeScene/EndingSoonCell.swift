//
//  EndingSoonCell.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/06/16.
//

import Foundation
import UIKit
import ReactorKit
import Reusable

class EndingSoonCell : UITableViewCell, View, Reusable {
    
    var disposeBag: DisposeBag = DisposeBag()
    
    var itemImage = UIImageView()
    var itemName = UILabel()
    var itemDeadLine = UILabel()
    var nowText = UILabel()
    var itemPrice = UILabel()
    
    
    // MARK: Constants
    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(
            style: style,
            reuseIdentifier: reuseIdentifier
      
        )
        print("create EdingSoonList")
        //뷰 컴포넌트 추가.
        [itemImage, itemName, itemDeadLine, nowText, itemPrice].forEach{
            contentView.addSubview($0)
        }
      
    
    
        layout()
        attribute()
    }
  

  
  required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
  
    
    func layout(){
        //이미지
        itemImage.snp.makeConstraints{
            $0.width.equalTo(96)
            $0.height.equalTo(96)
            $0.leading.equalToSuperview().offset(18)
            $0.top.equalToSuperview().offset(20)
        }
        //이름
        itemName.snp.makeConstraints{
            $0.leading.equalTo(itemImage.snp.trailing).offset(20)
            $0.top.equalTo(itemImage.snp.top).offset(8)
        }
        itemDeadLine.snp.makeConstraints{
            $0.leading.equalTo(itemName)
            $0.top.equalTo(itemName.snp.bottom)
            
        }
        nowText.snp.makeConstraints{
            $0.leading.equalTo(itemName)
            $0.top.equalTo(itemDeadLine.snp.bottom).offset(22)
        }
        itemPrice.snp.makeConstraints{
            $0.leading.equalTo(nowText.snp.trailing)
            $0.top.bottom.equalTo(nowText)
        }
    }
    
    
    func attribute(){
        self.backgroundColor = .white
        itemImage.image = UIImage(named: "tempIcon")
        nowText.text = "현재"
        nowText.font = .systemFont(ofSize: 12)
        nowText.textColor = .gray
        
        itemName.text = "상품 이름이 들어가는 칸입니다."
        itemName.font = .systemFont(ofSize: 12, weight: .bold)
    }
    
    
    func bind(reactor : EndingSoonCellReactor){
        
    }
}
