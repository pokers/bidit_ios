//
//  CustomChannelListCell.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/03.
//

import Foundation
import SendBirdUIKit
import SendBirdSDK
import SendBirdUIKitTarget
import UIKit
import Reusable

class CustomChatChannelListCell : SBUBaseChannelCell, Reusable{
    
    // MARK: - Properties
      @SBUAutoLayout var coverImage = UIImageView()
      @SBUAutoLayout var separatorLine = UIView()
      @SBUAutoLayout var titleLabel = UILabel()
      @SBUAutoLayout var memberLabel = UILabel()
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
          
          self.coverImage.clipsToBounds = true
          self.coverImage.frame = CGRect(x: 0, y: 0, width: kCoverImageSize, height: kCoverImageSize)
          
          self.contentView.addSubview(self.coverImage)
          
          self.titleStackView.addArrangedSubview(self.titleLabel)
          // Not yet available
          self.titleStackView.addArrangedSubview(self.memberLabel)
          self.contentView.addSubview(self.titleStackView)

          self.contentView.addSubview(self.separatorLine)
          
          self.titleLabel.font = SBUTheme.channelCellTheme.titleFont
          self.titleLabel.textColor = SBUTheme.channelCellTheme.titleTextColor
          self.separatorLine.backgroundColor = SBUTheme.channelCellTheme.separatorLineColor
          self.memberLabel.textColor = .gray
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

          NSLayoutConstraint.activate([
              self.titleStackView.topAnchor.constraint(
                  equalTo: self.contentView.topAnchor,
                  constant: 10
              ),
              self.titleStackView.bottomAnchor.constraint(
                  equalTo: self.contentView.bottomAnchor,
                  constant: -10
              ),
              self.titleStackView.leadingAnchor.constraint(
                  equalTo: self.coverImage.trailingAnchor,
                  constant: 16
              ),
              self.titleStackView.rightAnchor.constraint(
                  equalTo: self.contentView.rightAnchor,
                  constant: -16),
          ])
          self.titleLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
          self.memberLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
          NSLayoutConstraint.activate([
              // From bottom of cell
              self.separatorLine.topAnchor.constraint(
                  equalTo: self.coverImage.bottomAnchor,
                  constant: -0.5
              ),
              // From left side
              self.separatorLine.leadingAnchor.constraint(
                  equalTo: self.titleStackView.leadingAnchor,
                  constant: 0
              ),
              // From right side
              self.separatorLine.trailingAnchor.constraint(
                  equalTo: self.contentView.trailingAnchor,
                  constant: -16
              ),
              //Line Width
              self.separatorLine.heightAnchor.constraint(equalToConstant: 2.0)
          ])
      }
      
      override func configure(channel: SBDBaseChannel) {
          super.configure(channel: channel)
          
          self.titleLabel.text = channel.name.count > 0 ? channel.name : "Empty channel"
          let ch = channel as! SBDGroupChannel
          if let message = ch.lastMessage?.message {
              self.memberLabel.text = "'\(message)'"
          }
          self.coverImage.image = UIImage(named: "kitten")
          self.coverImage.layer.cornerRadius = kCoverImageSize/2
          self.coverImage.layer.masksToBounds = true
      }
}
