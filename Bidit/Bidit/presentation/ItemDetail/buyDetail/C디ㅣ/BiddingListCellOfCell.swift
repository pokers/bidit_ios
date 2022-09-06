//
//  BiddingListCellOfCell.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/06/25.
//

import Foundation
import UIKit
import ReactorKit
import Reusable
import RxSwift
import Then
import RxCocoa

//제품 상세페이지 입찰내역 섹션의 셀
class BiddingListCellOfCell : UITableViewCell, View, Reusable{
    typealias Reactor = BiddingListCellOfCellReactor
    
    // MARK: - Property
    var disposeBag = DisposeBag()
    
    var profileImg = UIImageView()
    var buyerName = UILabel()
    var timeLabel = UILabel()
    var resultPrice = UILabel()
    var addPrice = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        layout()
        attribute()

    }
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 14, left: 0, bottom: 14, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func layout(){
        
        
        //프로필 이미지
        self.contentView.addSubview(profileImg)
        profileImg.snp.makeConstraints{
            $0.width.height.equalTo(36)
            $0.top.bottom.equalToSuperview()
            $0.leading.equalToSuperview().offset(18)
        }
        //구매자 이름
        self.contentView.addSubview(buyerName)
        buyerName.snp.makeConstraints{
            $0.leading.equalTo(profileImg.snp.trailing).offset(12)
            $0.top.equalToSuperview().offset(1)
            
        }
        //업데이트 시간.
        self.contentView.addSubview(timeLabel)
        timeLabel.snp.makeConstraints{
            $0.leading.equalTo(buyerName.snp.leading)
            $0.top.equalTo(buyerName.snp.bottom).offset(4)
        }
        //가격, 변화량
        self.contentView.addSubview(resultPrice)
        self.contentView.addSubview(addPrice)
        
        resultPrice.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(18)
            $0.top.equalToSuperview()
        }
        addPrice.snp.makeConstraints{
            $0.top.equalTo(resultPrice.snp.bottom).offset(5)
            $0.trailing.equalToSuperview().inset(18)
        }
        
        
        
    }
    
    private func attribute(){
        profileImg.image = UIImage(named: "tempIcon")
        buyerName.text = "구매자이름"
        buyerName.font = .systemFont(ofSize: 12, weight: .semibold)
        timeLabel.text = "3분전"
        timeLabel.font = .systemFont(ofSize: 10, weight: .light)
        timeLabel.textColor = UIColor(red: 0.62, green: 0.62, blue: 0.62, alpha: 1)
        resultPrice.text = "3,000,000,000원"
        resultPrice.font = .systemFont(ofSize: 12, weight: .semibold)
        addPrice.text = "+1,000원"
        addPrice.font = .systemFont(ofSize: 10, weight: .light)
        addPrice.textColor = .init(named: "BrandColor")
        
        
        
    }
    
    func bind(reactor: BiddingListCellOfCellReactor) {
        //Action
        reactor.state.map{ $0.bidding}
            .subscribe(onNext :{
                self.buyerName.text = $0.user.nickname ?? $0.user.email
                self.timeLabel.text = "\(calcPassTime(start: $0.createdAt))"
                
                self.resultPrice.text = "\(self.decimalWon(value: $0.price))원"
                if $0.gap == 0{
                    self.addPrice.text = ""
                }
                self.addPrice.text = "+\(self.decimalWon(value: $0.gap))원 "
            })
        
//      tableView.rx.itemSelected //아이템 클릭 액션
//          .map{Reactor.Action.cellSelected($0)}
//          .bind(to: reactor.action)
//          .disposed(by: disposeBag)
//
        
        
            //State
    }
    
    //가격 형식 쉼표찍기
    func decimalWon(value: Int) -> String{
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            let result = numberFormatter.string(from: NSNumber(value: value))!
            
            return result
        }
}
