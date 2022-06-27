//
//  ItemDetailTitleCell.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/06/25.
//

import Foundation
import UIKit
import ReactorKit
import Reusable
//현재가, 참여자 수 , 잔여시간, 제목, 판매자 정보, 즉시 구매가, 마감시간, 작성일  셀
class ItemDetailTitleCell : UITableViewCell, View, Reusable{
    typealias Reactor = ItemDetailTitleCellReactor
    
    // MARK: - Property
    var disposeBag = DisposeBag()
    
    var nowPriceTitle = UILabel()
    var nowPrice = UILabel()
    
    var participantsTitle = UILabel()
    var participants = UILabel()
    
    var remainingTimeTitle = UILabel()
    var remainingTime = UILabel()
    
    var itemTitle = UILabel()
    
    var sellerProfileImg = UIImageView()
    var sellerNameText = UILabel()
    
    //판매중 상태
    var sellStatusBtn = UIButton()
    var statusImg = UIImageView()
    var statusDescription = UILabel()
    
    var instantPriceTitle = UILabel()
    var instantPrice = UILabel()
    
    var endTimeTitle = UILabel()
    var endTime = UILabel()
    
    var writeTimeTitle = UILabel()
    var writeTime = UILabel()
    
    var divider1 = UIView()
    var divider2 = UIView()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        

        
        layout()
        attribute()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //UI 배치
    private func layout(){
        
        self.contentView.snp.makeConstraints{
            $0.height.equalTo(394)
        }
        
        //현재가
        self.contentView.addSubview(nowPriceTitle)
        self.contentView.addSubview(nowPrice)
        
        nowPriceTitle.snp.makeConstraints{
            $0.top.equalToSuperview().offset(12)
            $0.leading.equalToSuperview().offset(18)
            
        }
        
        nowPrice.snp.makeConstraints{
            $0.top.equalTo(nowPriceTitle.snp.bottom).offset(4)
            $0.leading.equalToSuperview().offset(18)
        }
        
        //참여자수
        self.contentView.addSubview(participantsTitle)
        self.contentView.addSubview(participants)
        
        participantsTitle.snp.makeConstraints{
            $0.top.equalToSuperview().offset(12)
            $0.leading.equalToSuperview().offset(134)
            
        }
        
        participants.snp.makeConstraints{
            $0.top.equalTo(participantsTitle.snp.bottom).offset(4)
            $0.leading.equalToSuperview().offset(134)
        }
        
        //참여자수
        self.contentView.addSubview(remainingTimeTitle)
        self.contentView.addSubview(remainingTime)
        remainingTimeTitle.snp.makeConstraints{
            $0.top.equalToSuperview().offset(12)
            $0.trailing.equalToSuperview().inset(85)
            
        }
        remainingTime.snp.makeConstraints{
            $0.top.equalTo(remainingTimeTitle.snp.bottom).offset(4)
            $0.leading.equalTo(remainingTimeTitle.snp.leading)
        }
        
        //줄
        self.contentView.addSubview(divider1)
        divider1.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(17)
            $0.top.equalTo(nowPrice.snp.bottom).offset(20)
            $0.height.equalTo(1)
            
        }
        
        //아이템 제목
        self.contentView.addSubview(self.itemTitle)
        itemTitle.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(18)
            $0.top.equalTo(divider1.snp.bottom).offset(16)
        }
        
        //판매자 정보
        self.contentView.addSubview(sellerProfileImg)
        self.contentView.addSubview(sellerNameText)
        sellerProfileImg.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(18)
            $0.top.equalTo(itemTitle.snp.bottom).offset(12)
            $0.width.height.equalTo(24)
            
        }
        sellerNameText.snp.makeConstraints{
            $0.leading.equalTo(sellerProfileImg.snp.trailing).offset(8)
            $0.top.equalTo(sellerProfileImg.snp.top)
            $0.bottom.equalTo(sellerProfileImg.snp.bottom)
        }
        
        self.contentView.addSubview(sellStatusBtn)
       
        sellStatusBtn.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(18)
            $0.top.equalTo(sellerProfileImg.snp.bottom).offset(20)
            $0.height.equalTo(68)
        }
        
            
        
        
        
        //줄
        self.contentView.addSubview(divider2)
        divider2.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(17)
            $0.top.equalTo(sellStatusBtn.snp.bottom).offset(20)
            $0.height.equalTo(1)
        }
        
        //현재 구매가
        self.contentView.addSubview(instantPriceTitle)
        self.contentView.addSubview(instantPrice)
        instantPriceTitle.snp.makeConstraints{
            $0.top.equalTo(divider2.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(18)
        }
        instantPrice.snp.makeConstraints{
            $0.top.equalTo(instantPriceTitle.snp.top)
            $0.leading.equalTo(instantPriceTitle.snp.trailing).offset(24)
        }
        //마감시간
        self.contentView.addSubview(endTimeTitle)
        self.contentView.addSubview(endTime)
        endTimeTitle.snp.makeConstraints{
            $0.top.equalTo(instantPriceTitle.snp.bottom).offset(12)
            $0.leading.equalToSuperview().offset(18)
        }
        endTime.snp.makeConstraints{
            $0.top.equalTo(endTimeTitle.snp.top)
            $0.leading.equalTo(endTimeTitle.snp.trailing).offset(33)
        }
        //작성일
        self.contentView.addSubview(writeTime)
        self.contentView.addSubview(writeTimeTitle)
        writeTimeTitle.snp.makeConstraints{
            $0.top.equalTo(endTimeTitle.snp.bottom).offset(12)
            $0.leading.equalToSuperview().offset(18)
        }
        writeTime.snp.makeConstraints{
            $0.top.equalTo(writeTimeTitle.snp.top)
            $0.leading.equalTo(endTime.snp.leading)
        }
        
        
        
    }
    //UI 속성 설정
    private func attribute(){
        //현재가
        nowPriceTitle.text = "현재가"
        nowPriceTitle.font = .systemFont(ofSize: 10, weight: .light)
        nowPrice.text = "300,000원"
        nowPrice.font = .systemFont(ofSize: 16, weight: .bold)
        //참여자수
        participantsTitle.text = "참여자수"
        participantsTitle.font = .systemFont(ofSize: 10, weight: .light)
        participants.text = "191,000원"
        participants.font = .systemFont(ofSize: 16, weight: .bold)
        //잔여시간
        remainingTimeTitle.text = "잔여시간"
        remainingTimeTitle.font = .systemFont(ofSize: 10, weight: .light)
        remainingTime.text = "10일 10:59:59"
        remainingTime.font = .systemFont(ofSize: 16, weight: .bold)
        
        //줄
        divider1.backgroundColor = .separator
        //줄
        divider2.backgroundColor = .separator
        //아이템 제목
        itemTitle.text = "제목은 두글자일수도 근데 제목은 그거보다 길수도 있음."
        itemTitle.font = .systemFont(ofSize: 16, weight: .bold)
        
        
        //판매중 상태
        sellStatusBtn.setImage(UIImage(named: "statusOfSelling"), for: .normal)
        
        //판매자 정보
        sellerProfileImg.image = UIImage(named: "tempIcon")
        sellerNameText.text = "판매자 이름"
        sellerNameText.font = .systemFont(ofSize: 10, weight: .light)
        
        //현재 구매가
        instantPrice.text = "3,000,000원"
        instantPrice.font = .systemFont(ofSize: 12, weight: .medium)
        instantPriceTitle.text = "현재구매가"
        instantPriceTitle.font = .systemFont(ofSize: 12, weight: .light)
        
        //마감시간
        endTime.text = "6월6일 20:00"
        endTime.font = .systemFont(ofSize: 12, weight: .medium)
        endTimeTitle.text = "마감시간"
        endTimeTitle.font = .systemFont(ofSize: 12, weight: .light)
        
        //작성시간
        writeTime.text = "6월6일 10:00"
        writeTime.font = .systemFont(ofSize: 12, weight: .medium)
        writeTimeTitle.text = "작성일"
        writeTimeTitle.font = .systemFont(ofSize: 12, weight: .light)
        
    }
    
    func bind(reactor: ItemDetailTitleCellReactor) {
        //Action
            //State
    }
    
}
