//  MainViewController.swift
//  Bidit
//  Created by JeongMin Ko on 2022/06/12.

import Foundation
import ReactorKit

//메인화면
class MainViewController : UIViewController, View{
    
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
    
    
    func bind(reactor: MainReactor) {
        
    }
    

    private func layout(){
        
    }
    
}
