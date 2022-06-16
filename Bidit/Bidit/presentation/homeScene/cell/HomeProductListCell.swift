//
//  HomeProductListCell.swift
//  Bidit
//

import Foundation
import Foundation
import UIKit
import ReactorKit
import Reusable
import Tabman
import Pageboy

class HomeProductListCell : UITableViewCell , View, Reusable{
    
    typealias Reactor = BannerCellReactor
    
    
    
    var viewControllers: Array<UIViewController> = [UIViewController(), UIViewController()]
   
    var tabbarContainer = UIView()
    let tabbar = TabmanViewController()
    
    var disposeBag = DisposeBag()

      // MARK: Constants
      struct Image {
        static let color = UIColor.black
      }
    
//    self.dataSource = self
    
      
      // MARK: UI
      let bannerImage = UIImageView().then {
       
        
          $0.image = UIImage(named: "tempBanner")
          $0.backgroundColor = Image.color
          
      }
      
      // MARK: Constants
      override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
      ) {
        super.init(
          style: style,
          reuseIdentifier: reuseIdentifier
        )
        
        contentView.addSubview(bannerImage)
        makeConstraints()
      }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let bar = TMBar.ButtonBar()
        
        settingTabBar(ctBar: bar) //함수 추후 구현
        
        
        tabbar.addBar(bar, dataSource: self, at: .top)
        
        
            //addBar(bar, dataSource: self, at: .top)
    }
    

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeConstraints() {
      
        
        tabbarContainer.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        tabbarContainer.addSubview(TMBar.ButtonBar())
        
        
        
      }
    
       func bind(reactor: BannerCellReactor) {
           
           
       }
    
    func settingTabBar (ctBar : TMBar.ButtonBar) {
           ctBar.layout.transitionStyle = .snap
           // 왼쪽 여백주기
           ctBar.layout.contentInset = UIEdgeInsets(top: 0.0, left: 13.0, bottom: 0.0, right: 20.0)
           
           // 간격
           ctBar.layout.interButtonSpacing = 35
               
           ctBar.backgroundView.style = .blur(style: .light)
           
           // 선택 / 안선택 색 + font size
           ctBar.buttons.customize { (button) in
               button.tintColor = .black
               button.selectedTintColor = .black
               button.font = UIFont.systemFont(ofSize: 16)
               button.selectedFont = UIFont.systemFont(ofSize: 16, weight: .medium)
           }
           
           // 인디케이터 (영상에서 주황색 아래 바 부분)
           ctBar.indicator.weight = .custom(value: 2)
           ctBar.indicator.tintColor = .systemBackground
       }

    
}

extension HomeProductListCell : PageboyViewControllerDataSource, TMBarDataSource {
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
   
        // MARK: -Tab 안 글씨들
        switch index {
        case 0:
            return TMBarItem(title: "example 1")
        case 1:
            return TMBarItem(title: "example 2")
        default:
            let title = "Page \(index)"
            return TMBarItem(title: title)
        }

    }
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        //위에서 선언한 vc array의 count를 반환합니다.
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
