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
        updatePushToken()
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
        
        let tradeTabbarVC = TradeTabbarVC()
        let myPageVC = MyPageViewController()
        let myPageNavigationVC = UINavigationController(rootViewController: myPageVC)
        myPageVC.reactor = MyPageReactor()
        //tabBar.barTintColor = .white
        //tabBar.tintColor = .black
        
        
        homeViewController.tabBarItem = UITabBarItem(title: "", image: UIImage(named:"home_img" ), selectedImage: UIImage(named:"home_fill_img" ))
        
        chatVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named:"chatting_img" ), selectedImage: UIImage(named:"chatting_fill_img" ))
        
        searchVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named:"search_img" ), selectedImage: UIImage(named:"search_fill_img" ))
        
        tradeTabbarVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named:"my_deal_img" ), selectedImage: UIImage(named:"my_deal_fill_img" ))
        
        myPageVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named:"mypage_img" ), selectedImage: UIImage(named:"mypage_fill_img" ))
        
        viewControllers = [chatVC,searchViewController, homeViewController,  tradeTabbarVC, myPageNavigationVC]
        self.tabBar.tintColor = .black
        self.selectedIndex = 2 //첫화면 설정 (홈화면)
        self.view.backgroundColor = .white
        self.tabBar.barTintColor = .white
    }
}

extension TabbarController{
    func updatePushToken(){
        
        let keychain = TokenManager.sharedKeyChain
            let fcmToken = "\(String(describing: keychain.get("FCMToken")!))"
            print("push token : \(fcmToken)")
        
        
            
            Network.shared.apollo.perform(mutation: UpdatePushTokenMutation(pushTokenUpdate: .init(status: nil,
                                                                                                   token: fcmToken)))
            { result in
                switch result {
                case .success(let data) :
                    print("success \(data)")
                    do {
                        print("updatePushToken result :  \(data)")
//
//                        self.updateList(decode.getEndingSoonItems)
                        //return 대신
                       
                    }catch (let error) {
                        print("updatePushToken fail")
                        print(error.localizedDescription)
                    }
                    break
                case .failure(let error) :
                    print("error : \(error)")
                    //self.passed = false
                }
                
            }
            
        
    

    }
}

