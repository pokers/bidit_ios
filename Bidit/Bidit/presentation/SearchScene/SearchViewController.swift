//
//  SearchViewController.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/06/28.
//

import Foundation
import UIKit
import ReactorKit
//검색 화면 뷰 컨
class SearchViewController : UIViewController, View{
    
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
    
    
    func bind(reactor: SearchReactor) {
        
    }
    

    private func layout(){
        
    }
    
}
