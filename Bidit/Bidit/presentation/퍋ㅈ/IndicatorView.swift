//
//  IndicatorView.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/06/24.
//

import Foundation

import UIKit
import SnapKit
import Then

final class IndicatorView: UIView {
  // MARK: UI
  private let trackView = UIView().then {
    $0.backgroundColor = .lightGray.withAlphaComponent(0.3)
  }
  private let trackTintView = UIView().then {
    $0.backgroundColor = .gray
  }
    
private var leftInsetConstraint: Constraint?

    override init(frame: CGRect) {
      super.init(frame: frame)
      
      self.addSubview(self.trackView)
      self.trackView.addSubview(self.trackTintView)
      
      self.trackView.snp.makeConstraints {
        $0.edges.equalToSuperview()
      }

      self.trackTintView.snp.makeConstraints {
          $0.top.bottom.equalToSuperview()
          $0.width.equalToSuperview().multipliedBy(1/5)
          $0.left.greaterThanOrEqualToSuperview()
          $0.right.lessThanOrEqualToSuperview()
        self.leftInsetConstraint = $0.left.equalToSuperview().priority(999).constraint
      }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Properties
    var widthRatio: Double? {
      didSet {
        guard let widthRatio = self.widthRatio else { return }
        self.trackTintView.snp.remakeConstraints {
          $0.top.bottom.equalToSuperview()
          $0.width.equalToSuperview().multipliedBy(widthRatio)
          $0.left.greaterThanOrEqualToSuperview()
          $0.right.lessThanOrEqualToSuperview()
          self.leftInsetConstraint = $0.left.equalToSuperview().priority(999).constraint
        }
      }
    }
    var leftOffsetRatio: Double? {
      didSet {
        guard let leftOffsetRatio = self.leftOffsetRatio else { return }
        self.leftInsetConstraint?.update(inset: leftOffsetRatio * self.bounds.width)
      }
    }
    

    
    
}
