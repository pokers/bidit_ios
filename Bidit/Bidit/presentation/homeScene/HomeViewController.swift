//
//  HomeViewController.swift
//  Bidit
//

//

import Foundation
import UIKit
import ReactorKit
import SnapKit
import RxDataSources
import Then
import RxSwift
import RxCocoa
import ImageSlideshow
import Tabman
import Pageboy

//홈화면 네비게이션 컨트롤러 imbeded필요
class HomeViewController : UIViewController, View, UIScrollViewDelegate{
    
    //필요한 뷰 요소
    //배너, 페이저(카테고리), 배너(페이저)
    
    var disposeBag = DisposeBag()
    
    typealias Reactor = HomeReactor
     

    //전체 스크롤뷰
    var scrollView = UIScrollView()
    var containerView = UIView() //스크롤뷰 안의 컨테이너 뷰
    //배너 이미지 -> ImageSlideShow
    var slideShow = ImageSlideshow()
    
    // 카테고리 버튼 컬렉션 뷰
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 40
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 32, left: 16, bottom: 32, right: 16)
        //layout.itemSize = CGSize(width: 80, height: 80)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(CategoryCell.self, forCellWithReuseIdentifier: "CategoryCell")
            return cv
    }()
    //탭바
    var homeTabbar = HomeTabbar()
    var tabbarContainer = UIView()
    
    //임시 배너
    let images = [
        ImageSource(image: UIImage(named: "tempBanner")!),
        ImageSource(image: UIImage(named: "tempBanner")!),
        ImageSource(image: UIImage(named: "tempBanner")!),
        ImageSource(image: UIImage(named: "tempBanner")!)
        ]
    
    
    
    
    let dataSource = RxCollectionViewSectionedReloadDataSource<CategorySection>{dataSource, collectionView, indexPath, item in
        switch item {
        case .category:
              let cell = collectionView.dequeueReusableCell(for: indexPath) as CategoryCell
            print("category create")
              return cell
        }
    }
    
    // 탭바 리사이클러뷰
    
    
    //테이블뷰
//    private lazy var tableView : UITableView = {
//        let tableView = UITableView(frame: .zero)
//        tableView.backgroundColor = .systemBackground
//        tableView.separatorStyle = .none // 컬렉션 뷰 처럼 사용
//        tableView.register(BannerCell.self, forCellReuseIdentifier: "BannerCell")
//        return tableView
//    }()
    
//    private let tableView = UITableView().then {
//        $0.register(cellType: BannerCell.self)
//        $0.register(cellType: DefaultCell.self)
//        $0.rowHeight = UITableView.automaticDimension
//        $0.estimatedRowHeight = 130;
//      }
    
    
//    let dataSource = RxTableViewSectionedReloadDataSource<SomeViewSection>{dataSource, tableView, indexPath, item in
//
//
//
//        switch item {
//
//        case .banner(let reactor):
//              let cell = tableView.dequeueReusableCell(for: indexPath) as BannerCell
//              cell.reactor = reactor
//              return cell
//
//        case .def(let reactor):
//              let cell = tableView.dequeueReusableCell(for: indexPath) as DefaultCell
//              cell.reactor = reactor
//              return cell
//        case .category:
//            let cell = tableView.dequeueReusableCell(for: indexPath) as DefaultCell
//            return cell
//
//
//        case .productSoon :
//            let cell = tableView.dequeueReusableCell(for: indexPath) as DefaultCell
//            return cell
//        }
//    }
//
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        scrollView.delegate = self
        
        layout()
        slideBannerSetting()
        setupView()
        setUpCollectionView()
        attribute()
        
        
        
    }
    

    private func slideBannerSetting(){
        slideShow.setImageInputs(images)
        slideShow.contentScaleMode = .scaleAspectFill
        //slideShow.slideshowInterval = 4
        slideShow.pageIndicatorPosition = .init(horizontal: .right(padding: -20), vertical: .bottom)
        let uiIndcator = UIPageControl()
        uiIndcator.transform = CGAffineTransform(scaleX: 0.7, y: 0.8)
        uiIndcator.page = .zero
        uiIndcator.numberOfPages = 4
        slideShow.pageIndicator = uiIndcator
       // slideShow.currentPageChanged = { index in
        
            //self.currentPageLabel.text = "\(index + 1) / 4"
       // }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layout(){
        scrollView.setContentOffset(CGPoint(x: 0, y: -50), animated: false)
        self.view.addSubview(scrollView)
        scrollView.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.width.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        scrollView.addSubview(containerView)
        containerView.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.width.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        containerView.addSubview(slideShow)
        slideShow.snp.makeConstraints{
            $0.leading.top.trailing.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(220)
        }
        
        containerView.addSubview(tabbarContainer)
        tabbarContainer.snp.makeConstraints{
            $0.top.equalToSuperview().offset(400)
            $0.leading.trailing.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(660)
            $0.bottom.equalToSuperview()
        }
        
        addChild(homeTabbar)
        homeTabbar.view.frame = tabbarContainer.frame
        tabbarContainer.addSubview(homeTabbar.view)
        homeTabbar.didMove(toParent: self)
//
//
        //let bar = TMBar.ButtonBar()
        //homeTabbar.addBar(bar, dataSource: homeTabbar.self, at: .custom(view: tabbarContainer, layout: nil))
  
    }
    
    private func attribute(){
        
        //네비게이션 컨트롤러 투명하게 만들기
//        self.navigationController?.navigationBar.tintColor = .white
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        self.navigationController?.navigationBar.shadowImage = UIImage()
//        self.navigationController?.navigationBar.tintColor = .clear
        self.navigationController?.navigationBar.isHidden = true
        
        scrollView.isScrollEnabled = true
        
    }
    
    func setUpCollectionView(){
        containerView.addSubview(collectionView)
        collectionView.snp.makeConstraints{
            $0.top.equalTo(slideShow.snp.bottom)
            $0.width.equalToSuperview()
            $0.height.equalTo(186)
        }
        
        
    }
    private func setupView() {
        self.collectionView.rx.setDelegate(self)
          .disposed(by: disposeBag)
      }
    
    
    //따로 호출할 필요 없음. 리액터가 바뀌면 자동으로 호출
    func bind(reactor: HomeReactor) {
        
        //Action
        self.rx.viewDidLoad
              .mapVoid()
              .map(Reactor.Action.viewDidLoad)
              .bind(to: reactor.action)
              .disposed(by: self.disposeBag)
              
            //State
        reactor.state
            .map { $0.messageSection }
            .bind(to: collectionView.rx.items(dataSource: dataSource))
            .disposed(by: self.disposeBag)
        
        
        
        
//        //Action
//        self.rx.viewDidLoad
//              .mapVoid()
//              .map(Reactor.Action.viewDidLoad)
//              .bind(to: reactor.action)
//              .disposed(by: self.disposeBag)
//
//            //State
//            reactor.state
//              .map { $0.messageSection }
//              .bind(to: self.tableView.rx.items(dataSource: dataSource))
//              .disposed(by: self.disposeBag)
          
    }
    
}
//extension MainViewController: UITableViewDelegate {
////  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
////      return UITableView.automaticDimension
////
////  }
//}



