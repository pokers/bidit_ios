//
//  ItemDetailContentCell.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/06/25.
//

import Foundation
import UIKit
import ReactorKit
import Reusable
class ItemDetailContentCell : UITableViewCell, View, Reusable{
    typealias Reactor = ItemDetailContentCellReactor
    
    // MARK: - Property
    var disposeBag = DisposeBag()
    
    var contentText = UILabel()
    var filterStack = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        layout()
        attribute()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout(){
        self.contentView.addSubview(contentText)
        self.contentView.addSubview(filterStack)
        
        contentText.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(18)
            $0.top.equalToSuperview().offset(20)
            $0.height.equalTo(140)
        }
        
        filterStack.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(18)
            $0.height.equalTo(24)
            $0.top.equalTo(contentText.snp.bottom).offset(12)
            $0.bottom.equalToSuperview().inset(20)
        }
        
        
    }
    private func attribute(){
        contentText.text = "세종이 훈민정음을 반포했을 당시에는 배우고 익히기 어려운 한자와 구별하여, 주로 백성들이 일상적으로 쓰는 글이라는 뜻에서 언문(諺文)이라고도 불렸다. 흔히 언문에 대해 '한글을 낮춰 부르는 말'이라는 오해가 있으나, 사실 '언문'이라는 명칭을 처음 사용한 것은 창제."
        contentText.font = .systemFont(ofSize: 14, weight: .light)
        contentText.numberOfLines = 0
        
        
    }
    
    func bind(reactor: ItemDetailContentCellReactor) {
        //Action
            //State
    }
}
