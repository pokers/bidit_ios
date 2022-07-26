//
//  TradeTabbarVC.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/22.
//

import Foundation
import UIKit
import Tabman
import Pageboy
//내 거래 내역 탭바
class TradeTabbarVC : TabmanViewController {
    
    private var viewControllers: Array<UIViewController> = []
    
   
    let salesHistoryVC = SalesHistoryVC()
    let salesReactor = SalesHistoryReactor()
    
    let purchaseHistoryVC = PurchaseHistoryVC()
    let purchaseReactor = PurchaseHistoryReactor()
    
    var startIndex = 1
   
   
    override func viewDidLoad() {
       super.viewDidLoad()
       
       //MARK: - 커스텀 탭바 추가.
        
        
        
        salesHistoryVC.reactor = salesReactor
        purchaseHistoryVC.reactor = purchaseReactor

        
       viewControllers.append(salesHistoryVC)
       viewControllers.append(purchaseHistoryVC)
        // Create bar
        let bar = TMBar.ButtonBar()
        bar.layout.transitionStyle = .snap // Customize
        settingTabBar(ctBar: bar) //함수 추후 구현
        // Add to view
        addBar(bar, dataSource: self, at: .top)

       
   }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        
        self.dataSource = self

        self.tabBarController?.tabBar.isHidden = false
        self.navigationController?.navigationBar.isHidden = true
    }
}


extension TradeTabbarVC {
    func settingTabBar (ctBar : TMBar.ButtonBar) {
        
        var bound = UIScreen.main.bounds
        var width = bound.size.width
        var height = bound.size.height
        
        
        ctBar.layout.transitionStyle = .snap
        ctBar.snp.makeConstraints{
            $0.width.equalTo(height/2)
        }
        // 왼쪽 여백주기
        ctBar.layout.contentInset = UIEdgeInsets(top: 0.0, left: 20.0, bottom: 0.0, right: 20.0)
        
        // 간격
        ctBar.layout.interButtonSpacing = 20
        // background 스타일
        ctBar.backgroundView.style = .flat(color: .white)
        
        // 선택 / 안선택 색 + font size
        ctBar.buttons.customize { (button) in
            button.tintColor = .gray
            button.selectedTintColor = .black
            button.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
            button.selectedFont = UIFont.systemFont(ofSize: 18, weight: .semibold)
        }
        
        // 인디케이터 (아래 바 부분)
        ctBar.indicator.weight = .custom(value: 2)
        ctBar.indicator.tintColor = .black
        ctBar.indicator.snp.makeConstraints{
            $0.width.equalTo(height/2)
            
        }   //탭바 길이
  
    }
}

extension TradeTabbarVC: PageboyViewControllerDataSource, TMBarDataSource {
    
    //bar item 별 설정.
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        let item = TMBarItem(title: "")
        item.title = "Page \(index)"
        
        switch index {
        case 0:
            return TMBarItem(title: "    판매내역                    ")
        case 1:
            let item = TMBarItem(title: "    구매내역                    ")
        
            //item.badgeValue = " "
            
            return item
        default:
            return TMBarItem(title: "page \(index)")
        }
    }
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController,
        at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return .at(index: startIndex)
    }
}

