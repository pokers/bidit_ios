//
//  sendbirdService.swift
//  Bidit
//
//  Created by pokers on 2022/09/19.
//

import Foundation
import ReactorKit
import RxSwift

import SendBirdSDK
import SendBirdUIKit

enum SendbirdError:Error{
    case success
    case fail
    case connectionFail
}

protocol SendbirdService {
    var appId:String? { get }
    var isInitialized:Bool { get }
    func initialize()
    func connect(userId: UInt, userName: String?) -> Single<SendbirdError>
}

final class SendbirdServiceImpl:SendbirdService {
    // MARK: variable
    private(set) var appId:String? = nil
    private(set) var isInitialized:Bool = false
    
    // MARK: Constructor
    init(appId:String) {
        self.appId = appId
    }
    
    // MARK: Private Methods
    private func setInitializedState(initialized:Bool){
        self.isInitialized = initialized
    }
    
    
    // MARK: public Methods
    func initialize(){
//        log.info("Enter")
        guard self.appId != nil else {
            log.error("Invalid app Id")
            return
        }

//        log.info("App ID : \(self.appId!)")
        SBDMain.initWithApplicationId(self.appId!, useCaching: false) {
        } completionHandler: { error in
            if(error != nil){
                log.error("Failed to initialize Sendbird : \(String(describing: error))")
                return
            }
            log.info("Initialized Sendbird...")
            self.setInitializedState(initialized:true)
        }
//        log.info("Leave")
    }
    
    
    func connect(userId: UInt, userName: String?) -> Single<SendbirdError> {
        return Single.create { [weak self] observer in
            guard self?.isInitialized == true else {
                log.error("Failed to connect : Not initialized")
                observer(.failure(SendbirdError.fail))
                return Disposables.create()
            }
            
            let userIdString:String = String(describing: userId)
            SBDMain.connect(withUserId: userIdString ,completionHandler: { (user, error) in
                guard let _ = user, error == nil else {
                    log.error("Failed to connect : error(\(String(describing: error)))")
                    observer(.failure(SendbirdError.fail))
                    return
                }
                
                SBDMain.updateCurrentUserInfo(withNickname: userName, profileUrl: nil, completionHandler: { (error) in
                    guard error == nil else {
                        // Handle error.
                        observer(.failure(SendbirdError.fail))
                        return
                    }
                    observer(.success(SendbirdError.success))
                })

            })
            
            return Disposables.create()
        }
    }
    
}
