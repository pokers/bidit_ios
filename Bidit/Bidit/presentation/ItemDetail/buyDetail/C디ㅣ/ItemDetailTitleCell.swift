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
    var statusDes = UIImageView()
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
    
//    var timer = Observable<Int>.interval(
//        .seconds(1),
//        scheduler: MainScheduler.instance
//    )
//    var timerSub : Disposable? = nil
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        layout()
        attribute()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit{
        print("cell deinit")
    }
    
    
    //UI 배치
    private func layout(){
        
        self.contentView.snp.makeConstraints{
            $0.height.equalTo(340)
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
        sellStatusBtn.isHidden = true
        sellStatusBtn.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(18)
            $0.top.equalTo(sellerProfileImg.snp.bottom).offset(20)
            $0.height.equalTo(44)
        }
        self.contentView.addSubview(statusDes)
        statusDes.isHidden = true
        statusDes.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(18)
            $0.top.equalTo(sellStatusBtn.snp.bottom).offset(8)
            $0.height.equalTo(16)
            $0.width.equalTo(199)
        }
        //판매상태 텍스트
        self.contentView.addSubview(statusDescription)
        statusDescription.isHidden = true
        statusDescription.snp.makeConstraints{
            $0.centerX.equalTo(sellStatusBtn)
            $0.centerY.equalTo(sellStatusBtn)
        }
        
        
            
        
        
        
        //줄
        self.contentView.addSubview(divider2)
        divider2.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(17)
            $0.top.equalTo(sellStatusBtn.snp.bottom).offset(26)
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
        sellStatusBtn.setImage(UIImage(named: "product_status_btn_img"), for: .normal)
        statusDes.image = UIImage(named: "status_description_img")
        //판매자 정보
        sellerProfileImg.image = UIImage(named: "tempIcon")
        sellerNameText.text = "판매자 이름"
        sellerNameText.font = .systemFont(ofSize: 10, weight: .light)
        
        //현재 구매가
        instantPrice.text = "3,000,000원"
        instantPrice.font = .systemFont(ofSize: 12, weight: .medium)
        instantPriceTitle.text = "즉시구매가"
        instantPriceTitle.font = .systemFont(ofSize: 12, weight: .light)
        instantPriceTitle.textColor = UIColor(red: 0.62, green: 0.62, blue: 0.62, alpha: 1)
        
        //마감시간
        endTime.text = "6월6일 20:00"
        endTime.font = .systemFont(ofSize: 12, weight: .medium)
        endTimeTitle.text = "마감시간"
        endTimeTitle.font = .systemFont(ofSize: 12, weight: .light)
        endTimeTitle.textColor = UIColor(red: 0.62, green: 0.62, blue: 0.62, alpha: 1)
        //작성시간
        writeTime.text = "6월6일 10:00"
        writeTime.font = .systemFont(ofSize: 12, weight: .medium)
        writeTimeTitle.text = "작성일"
        writeTimeTitle.font = .systemFont(ofSize: 12, weight: .light)
        writeTimeTitle.textColor = UIColor(red: 0.62, green: 0.62, blue: 0.62, alpha: 1)
    }
    
    //셀이 사라졌을 때 타이머 종료
    override func removeFromSuperview() {
        super.removeFromSuperview()
        print("removeFromSuperview")
        TimerUtil.staticObs!.dispose()
       
    }
 
        
    
    func bind(reactor: ItemDetailTitleCellReactor) {
        
        //Action
        self.sellStatusBtn.rx.tap
            .subscribe(onNext : {
                let vc = ProductStatusDialogVC()
                vc.currItem = reactor.initialState.item
                vc.preVC = self
                vc.modalPresentationStyle = .overFullScreen
                // 보여주기
                UIApplication.topViewController()?.present(vc, animated: true, completion: nil)
                //self.window!.rootViewController!.present(vc, animated: true, completion: nil)
                
                
            }).disposed(by: disposeBag)
        
        
        
        
        //State
        //현재 가격
        reactor.state
            .map { "\( self.decimalWon(value: $0.item.cPrice ?? $0.item.sPrice!)) 원 " }
            .bind(to: self.nowPrice.rx.text)
            .disposed(by: self.disposeBag)
        
        reactor.state
            .map { "\(String(describing: $0.item.viewCount?.description ?? "0") )명"}
            .bind(to: self.participants.rx.text)
            .disposed(by: self.disposeBag)
        
        
        
        reactor.state
            .map{ calcRestDayAndTime(end: $0.item.dueDate ?? "") }
            .bind(to: self.endTime.rx.text)
            .disposed(by: disposeBag)
    
        reactor.state.map{$0.item.title}
            .bind(to: self.itemTitle.rx.text)
            .disposed(by: disposeBag)
        //유저 이름
        reactor.state.map{$0.item.user?.nickname?.description ?? $0.item.user?.email?.description }
            .bind(to: self.sellerNameText.rx.text)
            .disposed(by: disposeBag)
        //즉시 구매가
        reactor.state.map{"\(self.decimalWon(value: $0.item.buyNow ?? 0))원"}
            .bind(to: self.instantPrice.rx.text)
            .disposed(by: disposeBag)
        
        //마감시간
        reactor.state.map{
            stringConvertDueDate(time: $0.item.dueDate ?? ""
            )}
            .bind(to: self.endTime.rx.text)
            .disposed(by: disposeBag)
        
        //작성일
        reactor.state.map{stringConvertToDateTime(time: $0.item.createdAt ?? "")}
            .bind(to: self.writeTime.rx.text)
            .disposed(by: disposeBag)
        
        reactor.state.map{
            $0.item.dueDate?.description ?? "0"
        }.subscribe( onNext : { [weak self] dueDate in
           // self?.remainingTime.text = calcRestDayAndTime(end: dueDate)
            
            
            TimerUtil.timer = Observable<Int>.interval(
                .seconds(1),
                scheduler: MainScheduler.instance
            )
            
//            TimerUtil.staticObs = TimerUtil.timer?.subscribe(onDisposed : {
//                print("disposed")
//                self?.removeFromSuperview()
//            })
            TimerUtil.staticObs = TimerUtil.timer?.subscribe(onNext: { [weak self] result in
                let result =   calcRestDayAndTime(end: dueDate)//"\(restDay)일 \(hour):\(minite):\(second)"
                self?.remainingTime.text = result
            }, onDisposed: { [weak self] in
                print("disposed")
                self?.removeFromSuperview()
                
                
                
            })
            
//            TimerUtil.staticObs = TimerUtil.timer!.subscribe(onNext: { result in
//                let result =   calcRestDayAndTime(end: dueDate)//"\(restDay)일 \(hour):\(minite):\(second)"
//                self.remainingTime.text = result
//            }, onDisposed: {
//                print("disposed")
//                TimerUtil.timer = nil
//                TimerUtil.staticObs!.disposed(by: self.disposeBag)
//            })
            
            //self.setupOnlyForegroundTimer(endTime: dueDate)
        }).disposed(by: disposeBag)
        
        
        self.rx.layoutSubviews.subscribe(onNext : {_ in
            print("상태 표시 \(reactor.initialState.item.userId) ")
            
            
            if reactor.initialState.item.userId ?? 0 == UserDefaults.standard.integer(forKey: "userId") {
                
                self.sellStatusBtn.isHidden = false
                self.statusDes.isHidden = false
                self.statusDescription.isHidden = false
                if reactor.initialState.item.status == 0 || reactor.initialState.item.status == 1{
                    self.statusDescription.text = "판매중"
                    //self.sellStatusBtn.setTitle("판매중", for: .normal)
                }else if reactor.initialState.item.status == 2{
                    self.statusDescription.text = "예약중"
                    //self.sellStatusBtn.setTitle("예약중", for: .normal)
                }else if reactor.initialState.item.status == 3{
                    self.statusDescription.text = "판매완료"
                   // self.sellStatusBtn.setTitle("판매완료", for: .normal)
                }
            }else {
                
                self.divider2.snp.makeConstraints{
                    $0.leading.trailing.equalToSuperview().inset(17)
                    $0.top.equalTo(self.sellerNameText.snp.bottom).offset(25)
                    $0.height.equalTo(1)
                }
            }
        }).disposed(by: disposeBag)
        
        //유저 제품 구분(판매중 버튼)
        reactor.state.subscribe(onNext : {
            if $0.item.userId ?? 0 == UserDefaults.standard.integer(forKey: "userId") {
                self.sellStatusBtn.isHidden = false
                self.statusDes.isHidden = false
                self.statusDescription.isHidden = false
                if $0.item.status == 0{
                    self.statusDescription.text = "판매중"
                    //self.sellStatusBtn.setTitle("판매중", for: .normal)
                }else if $0.item.status == 1{
                    self.statusDescription.text = "예약중"
                    //self.sellStatusBtn.setTitle("예약중", for: .normal)
                }else if $0.item.status == 2{
                    self.statusDescription.text = "판매완료"
                   // self.sellStatusBtn.setTitle("판매완료", for: .normal)
                }
            }
        }).disposed(by: disposeBag)
        
//        self..rx..subscribe(onNext : {_ in
//            timer?.subscribe().dispose()
//        }).disposed(by: disposeBag)
        
    }
    
    
    
    
    
}

extension ItemDetailTitleCell {
    
    //타이머
    func setupOnlyForegroundTimer(endTime : String)  {
        
//        timer = Observable<Int>.interval(
//            .seconds(1),
//            scheduler: MainScheduler.instance
//        )
        
        
        
        
//
        
//        timer!.subscribe(onNext: { result in
//                    let result =   calcRestDayAndTime(end: endTime)//"\(restDay)일 \(hour):\(minite):\(second)"
//                    self.remainingTime.text = result
//                }).disposed(by: disposeBag)
//
//
                
                
                
            
    }
    //가격 형식 쉼표찍기
    func decimalWon(value: Int) -> String{
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            let result = numberFormatter.string(from: NSNumber(value: value))!
            
            return result
        }
    

}


