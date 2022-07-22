//
//  PurchaseHistoryVC.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/22.
//

import Foundation
import UIKit
import ReactorKit
//구매내역 뷰
class PurchaseHistoryVC : UIViewController, View{
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var disposeBag: DisposeBag  = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    func bind(reactor: PurchaseHistoryReactor) {
        
    }
    

    private func layout(){
        
    }
}
