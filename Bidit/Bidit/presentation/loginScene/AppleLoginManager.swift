//
//  AppleLoginManager.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/15.
//


import AuthenticationServices

final class AppleLoginManager: NSObject {
    weak var viewController: UIViewController?
    //weak var delegate: AppleLoginManagerDelegate?
    
    func setAppleLoginPresentationAnchorView(_ view: UIViewController) {
        self.viewController = view
    }
}

//extension AppleLoginManager: ASAuthorizationControllerPresentationContextProviding
//    @available(iOS 13.0, *)
//    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
//        return viewController!.view.window!
//    }
//}
