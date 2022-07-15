//
//  DefaultCell.swift
//  Bidit
//

import Foundation
import UIKit
import Then
import ReactorKit
import Reusable
import RxDataSources
import RxSwift
import RxCocoa
//카테고리 섹션
class DefaultCell: UITableViewCell, View, Reusable {
    
    typealias Reactor = DefaultCellReactor
    
    // MARK: - Property
    var disposeBag = DisposeBag()
    
    
//    //컬렉션 뷰
//    private lazy var collectionView : UICollectionView = {
//        let collectionView = UICollectionView(frame: .zero)
//        collectionView.backgroundColor = .blue
//        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: "CategoryCell")
//        return collectionView
//    }()
    
    //카테고리 버튼 크기 설정은 여기서
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 40
            
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 32, left: 16, bottom: 32, right: 16)
        //layout.itemSize = CGSize(width: 80, height: 80)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        
        cv.register(CategoryCell.self, forCellWithReuseIdentifier: "CategoryCell")
            return cv
        }()
    
    
    let dataSource = RxCollectionViewSectionedReloadDataSource<CategorySection>{dataSource, collectionView, indexPath, item in
        
        switch item {
        case .category:
              let cell = collectionView.dequeueReusableCell(for: indexPath) as CategoryCell
            print("category create")
              return cell
        }
    }
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        

        contentView.addSubview(collectionView)
        
        collectionView.snp.makeConstraints{
            $0.edges.equalToSuperview()
            $0.height.equalTo(186)
        
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(reactor: DefaultCellReactor) {
        //Action
        self.rx.layoutSubviews
              .mapVoid()
              .map(Reactor.Action.layoutSubviews)
              .bind(to: reactor.action)
              .disposed(by: self.disposeBag)
        
        collectionView.rx.itemSelected //아이템 클릭
            .map{Reactor.Action.cellSelected($0)}
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
              
            //State
            reactor.state
              .map { $0.messageSection }
              .bind(to: self.collectionView.rx.items(dataSource: dataSource))
              .disposed(by: self.disposeBag)
        
        reactor.state.map{ $0.selectedIndexPath}
            .compactMap{$0}
            .subscribe(onNext : { [weak self] indexPath in
                let vc = ItemListViewController()
                let listReactor = ItemListReactor(initialState: ItemListReactor.State.init(categoryId: 1)) //임시로 입력
                vc.reactor = listReactor
               // vc.bind(reactor: listReactor)
                //self?.navigationController?.pushViewController(vc, animated: true)
                guard let self = self else { return }
                //self.collectionView.deselectRow(at: indexPath, animated: true)
                
            }).disposed(by: disposeBag)
          
    }
}

