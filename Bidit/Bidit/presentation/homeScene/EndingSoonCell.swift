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
import Kingfisher


class EndingSoonCell : UITableViewCell, View, Reusable {
    
    var disposeBag: DisposeBag = DisposeBag()
    
    var itemImage = UIImageView()
    var itemName = UILabel()
    var itemDeadLine = UILabel()
    
    var nowText = UILabel() //마감
    var itemPrice = UILabel()// 가격 원
    var bidNum = UILabel() //입찰 수
    
    
    
    
    
    
    
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
        [itemImage, itemName, itemDeadLine, nowText, itemPrice, bidNum].forEach{
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
            $0.leading.equalTo(nowText.snp.leading)
            $0.bottom.equalTo(itemImage.snp.bottom).inset(8)
            
        }
        bidNum.snp.makeConstraints{
            $0.leading.equalTo(nowText.snp.trailing).offset(10)
            $0.top.equalTo(nowText.snp.top)
        }
    }
    
    
    func attribute(){
        self.backgroundColor = .white
        itemImage.image = UIImage(named: "tempIcon")
        itemImage.layer.cornerRadius = 8
        nowText.text = "현재"
        nowText.font = .systemFont(ofSize: 12)
        nowText.textColor = .gray
        itemName.text = "상품 이름이 들어가는 칸입니다."
        itemName.font = .systemFont(ofSize: 12, weight: .bold)
        
        itemPrice.text = "가격"
        itemPrice.font = .systemFont(ofSize: 16, weight: .bold)
        bidNum.text = "입찰 100,000건"
        bidNum.font = .systemFont(ofSize: 12, weight: .medium)
        bidNum.textColor = .gray
    }
    
    
    func bind(reactor : EndingSoonCellReactor){
        //액션
        //State
        reactor.state
            .map { $0.item.title }
            .bind(to: self.itemName.rx.text)
            .disposed(by: self.disposeBag)
        
        reactor.state
            .map {
                calcRestDay(end:$0.item.dueDate ?? "").description
                }
            .bind(to: self.nowText.rx.text)
            .disposed(by: self.disposeBag)
        
        reactor.state
            .map { "\((String(describing: $0.item.cPrice?.description ?? $0.item.sPrice!.description))) 원" }
            .bind(to: self.itemPrice.rx.text)
            .disposed(by: self.disposeBag)
        
      //  guard let url = URL(string: "https://live.staticflickr.com/65535/51734305911_f4541d7629_m.jpg") else { return }
       //myImageView.kf.setImage(with: url)
        //이미지 불러오기
        reactor.state.filter{$0.item.image?.count ?? 0 > 0}
            .subscribe(onNext : {
                var url = URL(string: $0.item.image?[0].url ?? "")
                self.itemImage.kf.setImage(with: url)
            })
            .disposed(by: disposeBag)
        
    
       
    }
}
