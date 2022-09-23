//
//  Rx+map.swift
//  Bidit
//
//  Created by pokers on 2022/09/21.
//


import Foundation
import RxSwift

extension ObservableType {
    func map<T>(_ element: T) -> Observable<T> {
        self.map({ _ in element })
    }
}

extension ObservableType {
    func mapVoid() -> Observable<Void> {
        self.map(Void())
    }
}

