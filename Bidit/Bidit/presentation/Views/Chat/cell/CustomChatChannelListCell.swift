//
//  CustomChannelListCell.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/03.
//

import Foundation
import UIKit
import Reusable
import Kingfisher
import SendBirdUIKit
//채팅리스트 셀
class CustomChatChannelListCell : SBUBaseChannelCell, Reusable{
    
    // MARK: - Properties
    @SBUAutoLayout var coverImage = UIImageView()
    @SBUAutoLayout var separatorLine = UIView()
    @SBUAutoLayout var statusLabel = UIImageView() //즉시구매희망, 최종낙찰자
    @SBUAutoLayout var titleLabel = UILabel() //닉네임
    @SBUAutoLayout var timeLabel = UILabel() //시간
    
    @SBUAutoLayout var numMessage = UITextView()
    @SBUAutoLayout var itemImage = UIImageView() //제품 이미지
    
    @SBUAutoLayout var messageLabel = UILabel() //마지막 메시지
    
    @SBUAutoLayout var titleStackView: UIStackView = {
        let titleStackView = UIStackView()
        titleStackView.alignment = .center
        titleStackView.spacing = 4.0
        titleStackView.axis = .horizontal
        return titleStackView
    }()
    
    let kCoverImageSize: CGFloat = 40
    
      // MARK: -
      override func setupViews() {
          super.setupViews()
          
          
          
          self.coverImage.clipsToBounds = true // true로 설정하면 subview가 view의 경계를 넘어갈 시 잘림
          self.coverImage.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
          
          self.contentView.addSubview(self.coverImage)
          
          self.titleStackView.addArrangedSubview(self.statusLabel)
          self.titleStackView.addArrangedSubview(self.titleLabel)
          // Not yet available
          self.titleStackView.addArrangedSubview(self.timeLabel)
          self.contentView.addSubview(self.titleStackView)

          self.contentView.addSubview(self.separatorLine)
          self.contentView.addSubview(self.messageLabel)
          
          self.contentView.addSubview(self.numMessage)
          self.contentView.addSubview(self.itemImage)
          
          self.titleLabel.font = SBUTheme.channelCellTheme.titleFont
          self.titleLabel.textColor = SBUTheme.channelCellTheme.titleTextColor
          self.separatorLine.backgroundColor = SBUTheme.channelCellTheme.separatorLineColor
//          self.messageLabel.textColor = .gray
          
          
          
      }
      
      override func setupAutolayout() {
          super.setupAutolayout()
          
          
          NSLayoutConstraint.activate([
              self.coverImage.topAnchor.constraint(
                  equalTo: self.contentView.topAnchor,
                  constant: 10
              ),
              self.coverImage.bottomAnchor.constraint(
                  equalTo: self.contentView.bottomAnchor,
                  constant: -10
              ),
              self.coverImage.leadingAnchor.constraint(
                  equalTo: self.contentView.leadingAnchor,
                  constant: 16
              ),
              self.coverImage.widthAnchor.constraint(equalToConstant: kCoverImageSize),
              self.coverImage.heightAnchor.constraint(equalToConstant: kCoverImageSize),
          ])

          self.titleStackView.snp.makeConstraints{
              $0.top.equalToSuperview().offset(8)
              $0.leading.equalTo(coverImage.snp.trailing).offset(12)
              $0.width.equalTo(200)
              $0.height.equalTo(17)
          }
          
          self.statusLabel.image = UIImage(named: "buynow_status_img")
          self.statusLabel.snp.makeConstraints{
              $0.width.equalTo(78)
              $0.height.equalTo(17)
          }
          self.titleLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
          self.messageLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
          self.messageLabel.font = .systemFont(ofSize: 12, weight: .regular)
          self.messageLabel.textColor = UIColor(red: 0.258, green: 0.258, blue: 0.258, alpha: 1)
          self.messageLabel.snp.makeConstraints{
              $0.leading.equalTo(self.titleStackView.snp.leading)
              $0.top.equalTo(self.titleStackView.snp.bottom).offset(3)
              $0.width.equalTo(200)
              $0.height.equalTo(17)
          }
          
          itemImage.snp.makeConstraints{
              $0.width.height.equalTo(44)
              $0.trailing.equalToSuperview().inset(17)
              $0.centerY.equalToSuperview()
          }
          numMessage.snp.makeConstraints{
              $0.width.equalTo(25)
              $0.height.equalTo(25)
              $0.centerY.equalToSuperview()
              $0.trailing.equalTo(itemImage.snp.leading).offset(-17)
          }
//          NSLayoutConstraint.activate([
//              // From bottom of cell
//              self.separatorLine.topAnchor.constraint(
//                  equalTo: self.coverImage.bottomAnchor,
//                  constant: -0.5
//              ),
//              // From left side
//              self.separatorLine.leadingAnchor.constraint(
//                  equalTo: self.titleStackView.leadingAnchor,
//                  constant: 0
//              ),
//              // From right side
//              self.separatorLine.trailingAnchor.constraint(
//                  equalTo: self.contentView.trailingAnchor,
//                  constant: -16
//              ),
//              //Line Width
//              self.separatorLine.heightAnchor.constraint(equalToConstant: 2.0)
//          ])
      }
      
      override func configure(channel: SBDBaseChannel) {
          super.configure(channel: channel)
          
          self.titleLabel.text = ""//channel.name.count > 0 ? channel.name : "Empty channel"
          
          let ch = channel as! SBDGroupChannel
          
          if let message = ch.lastMessage?.message {
              self.messageLabel.text = "'\(message)'"
          }
          self.coverImage.image = UIImage(named: "basic_profile_img") //프로필 이미지 설정
          self.coverImage.layer.cornerRadius = kCoverImageSize/2
          self.coverImage.layer.masksToBounds = true
          
          self.timeLabel.text = "3분전"
          self.timeLabel.textColor = UIColor(red: 0.62, green: 0.62, blue: 0.62, alpha: 1)
          self.timeLabel.font = .systemFont(ofSize: 10, weight: .regular)
          
          self.itemImage.image =  loadProfileImg(url: ch.coverUrl ?? "") // UIImage(named: "empty_product_img")
          self.itemImage.layer.cornerRadius = 4
          
          //메시지 숫자
          if ch.unreadMessageCount == 0{
              self.numMessage.isHidden = true
          }
          self.numMessage.text = ch.unreadMessageCount.description//"1"
          
          self.numMessage.isUserInteractionEnabled = false
          self.numMessage.backgroundColor = UIColor(red: 0.957, green: 0.263, blue: 0.212, alpha: 1)
          self.numMessage.textColor = .white
          self.numMessage.font = .systemFont(ofSize: 10, weight: .medium)
          self.numMessage.textAlignment = .center
          self.numMessage.layer.cornerRadius = 0.5 * 25

          self.numMessage.layer.borderColor = UIColor(red: 0.957, green: 0.263, blue: 0.212, alpha: 1).cgColor
      }
    
    
    func loadProfileImg(url : String) -> UIImage{
        var resultImage : UIImage?
        if let thumbnailUrl = URL(string: url) {
            KingfisherManager.shared.retrieveImage(with: thumbnailUrl, completionHandler: { result in
            switch(result) {
                case .success(let imageResult):
//                    let resized = imageResult.image.resizedImageWithContentMode(.scaleAspectFit, bounds: CGSize(width: 84, height: 84), interpolationQuality: .medium)
                    //imageView.isHidden = false
                resultImage = imageResult.image
                case .failure(let error):
                break
                }
            })
        }
        return resultImage ?? UIImage(named: "empty_product_img")!
    }
}
