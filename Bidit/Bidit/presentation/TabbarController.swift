//
//  TabbarController.swift
//  Bidit
//


import Foundation
import UIKit
class TabbarController : UITabBarController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc = HomeViewController()
        let reactor = HomeReactor(initialState: HomeReactor.State())
        vc.reactor = reactor
        let homeViewController = UINavigationController(rootViewController: vc)
        //임시
        let vc2 = UIViewController()
        let vc3 = UIViewController()
        let vc4 = UIViewController()
        let vc5 = UIViewController()
        
        tabBar.barTintColor = .white
        
        homeViewController.tabBarItem = UITabBarItem(title: "홈", image: UIImage(named:"tempTabbarImg" ), selectedImage: UIImage(named:"tempTabbarImg" ))
        
        vc2.tabBarItem = UITabBarItem(title: "채팅", image: UIImage(named:"tempTabbarImg" ), selectedImage: UIImage(named:"tempTabbarImg" ))
        
        vc3.tabBarItem = UITabBarItem(title: "검색", image: UIImage(named:"tempTabbarImg" ), selectedImage: UIImage(named:"tempTabbarImg" ))
        
        vc4.tabBarItem = UITabBarItem(title: "내 거래", image: UIImage(named:"tempTabbarImg" ), selectedImage: UIImage(named:"tempTabbarImg" ))
        
        vc5.tabBarItem = UITabBarItem(title: "MY", image: UIImage(named:"tempTabbarImg" ), selectedImage: UIImage(named:"tempTabbarImg" ))
        
        viewControllers = [homeViewController, vc2, vc3, vc4, vc5]
    }
}

