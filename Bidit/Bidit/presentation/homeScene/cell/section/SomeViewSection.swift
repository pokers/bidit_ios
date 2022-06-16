//
//  SomeViewSection.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/06/12.
//

import Foundation
//RxDataSources에서 사용될 모델이고 섹션 별 아이템 별로 데이터 구조화.

import RxDataSources

//Section과 Item에서 사용할때는 enum으로 선언하고, enum으로 구분 후 associative type으로 모델을 선언
//SomeViewSection - Section에 사용될 타입
//SomeViewSectionItem - Item에 사용될 타입
enum SomeViewSection {
    
    case first([SomeViewSectionItem])
    case second([SomeViewSectionItem])
    
    case category([SomeViewSectionItem])
    case productSoon([SomeViewSectionItem])
    
}

enum SomeViewSectionItem {
    case banner(BannerCellReactor)
    case def(DefaultCellReactor)
    case category
    case productSoon(HomeProductListReactor)
}
//rxDataSource의 모델로 사용하기 위해 프로토콜 준수
extension SomeViewSection: SectionModelType {
  var items: [SomeViewSectionItem] {
    switch self {
    case .first(let items) : return items
    case .second(let items) : return items
    case .category(let items): return items
    case .productSoon(let items) : return items
    }
  }
  
  init(original: SomeViewSection, items: [SomeViewSectionItem]) {
    switch original {
    case .first: self = .first(items)
    case .second: self = .second(items)
    case .category: self = .category(items)
    case .productSoon : self = .productSoon(items)
    }
  }
}


//
//struct MultiSection {
//  typealias HomeSectionModel = SectionModel<HomeSection, HomeItem>
//
//  enum HomeSection: Equatable {
//    case banner
//    case def
//  }
//
//  enum HomeItem: Equatable {
//    case firstItem(Banner)
//  }
//}
