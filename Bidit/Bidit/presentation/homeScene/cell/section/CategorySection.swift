//
//  CategorySection.swift
//  Bidit
//


import Foundation

import RxDataSources

enum CategorySection {
    
    case category([CategorySectionItem])
    
}

enum CategorySectionItem {
    case category(CategoryReactor)
    
}
//rxDataSource의 모델로 사용하기 위해 프로토콜 준수
extension CategorySection: SectionModelType {
    
  var items: [CategorySectionItem] {
    switch self {
    case .category(let items) : return items

    }
  }
  
  init(original: CategorySection, items: [CategorySectionItem]) {
    switch original {
    case .category: self = .category(items)
    }
  }
}
