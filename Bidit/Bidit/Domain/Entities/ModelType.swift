//
//  ModelType.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/06/12.
//

import Foundation
import Then
//정의할 Cell들이 사용할 때 공통으로 가질 protocol정의
//Equatable -> RxDataSources의 모델에 들어가면 필수로 준수해야하는 프로토콜
//Codable -> decode & encode
//Then => SwiftUI와 유사하게 클로저를 통해 편리하게 접근 가능.

protocol ModelType : Then, Codable, Equatable{ }
