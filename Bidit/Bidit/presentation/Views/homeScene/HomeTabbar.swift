//
//  HomeTabbar.swift
//  Bidit
//

//

import Foundation
import UIKit
import Tabman
import Pageboy

class HomeTabbar : TabmanViewController {
    
    private var viewControllers: Array<UIViewController> = []
    
    var homeVC : HomeViewController? = nil
    //delegate 중간 전달 임시 저장 변수
    //var scrollDelegate: NestedScrollDelegate?
    let endingSoonVC = EndingSoonViewController()
    

   
   
    override func viewDidLoad() {
       super.viewDidLoad()
       
       //MARK: - 커스텀 탭바 추가.
        endingSoonVC.reactor = EndingSoonReactor(initialState: .init(itemSection: []))
        endingSoonVC.homeVC = homeVC
        
       let vc3 = UIViewController()
        
        

        
        
       viewControllers.append(endingSoonVC)
       viewControllers.append(endingSoonVC)
       self.dataSource = self

       // Create bar
       let bar = TMBar.ButtonBar()
       bar.layout.transitionStyle = .snap // Customize
       settingTabBar(ctBar: bar) //함수 추후 구현
       // Add to view
       addBar(bar, dataSource: self, at: .top)
   }
}


extension HomeTabbar {
    func settingTabBar (ctBar : TMBar.ButtonBar) {
        ctBar.layout.transitionStyle = .snap
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
       
  
    }
}

extension HomeTabbar: PageboyViewControllerDataSource, TMBarDataSource {
    
    //bar item 별 설정.
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        let item = TMBarItem(title: "")
        item.title = "Page \(index)"
        
        switch index {
        case 0:
            return TMBarItem(title: "Ending Soon")
        case 1:
            let item = TMBarItem(title: "최신순")
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
        return nil
    }
}
