//
//  ViewControllerProvider.swift
//  Bidit
//
//  Created by pokers on 2022/09/20.
//

import Foundation

final class ViewControllerProvider {
    // singleton view controller
    static var loginViewController:LoginViewController? = nil
    static var loginReactor:LoginReactor? = nil
    
    static func getLoginViewController() -> LoginViewController {
        if self.loginReactor == nil {
            self.loginReactor = LoginReactor()
        }
        
        if self.loginViewController == nil {
            self.loginViewController = LoginViewController(reactor: self.loginReactor!)
        }
        if self.loginReactor == nil {
            self.loginReactor = LoginReactor()
        }
        return self.loginViewController!
    }
}
