//
//  TabbarController.swift
//  Bidit
//


import Foundation
import UIKit
import SendBirdUIKit
class TabbarController : UITabBarController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc = HomeViewController()
        let reactor = HomeReactor(initialState: HomeReactor.State())
        
        vc.reactor = reactor
        let homeViewController = UINavigationController(rootViewController: vc)
        
        //채팅 뷰 컨트롤러 설정
        let listQuery = SBDGroupChannel.createMyGroupChannelListQuery()
        listQuery?.includeEmptyChannel = false
        listQuery?.includeFrozenChannel = true
        let channelListVC = ChannelListViewController(channelListQuery: listQuery)
        let chatVC = UINavigationController(rootViewController: channelListVC)
        //() //TabbarController() //LoginViewController()
        
        //임시
        
        let searchVC = SearchViewController()
        let searchViewController = UINavigationController(rootViewController: searchVC)
        searchVC.reactor = SearchReactor()
        
        let vc4 = UIViewController()
        let myPageVC = MyPageViewController()
        let myPageNavigationVC = UINavigationController(rootViewController: myPageVC)
        myPageVC.reactor = MyPageReactor()
        tabBar.barTintColor = .white
        tabBar.tintColor = .black
        
        
        homeViewController.tabBarItem = UITabBarItem(title: "", image: UIImage(named:"home_img" ), selectedImage: UIImage(named:"home_fill_img" ))
        
        chatVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named:"chatting_img" ), selectedImage: UIImage(named:"chatting_fill_img" ))
        
        searchVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named:"search_img" ), selectedImage: UIImage(named:"search_fill_img" ))
        
        vc4.tabBarItem = UITabBarItem(title: "", image: UIImage(named:"my_deal_img" ), selectedImage: UIImage(named:"my_deal_fill_img" ))
        
        myPageVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named:"mypage_img" ), selectedImage: UIImage(named:"mypage_fill_img" ))
        
        viewControllers = [chatVC, homeViewController, searchViewController, vc4, myPageNavigationVC]
    }
}

