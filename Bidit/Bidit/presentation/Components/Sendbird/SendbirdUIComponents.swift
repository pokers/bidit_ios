//
//  SendbirdUIComponents.swift
//  Bidit
//
//  Created by pokers on 2022/09/19.
//
import Foundation
import ReactorKit
import RxSwift
import SendBirdUIKit

protocol SendbirdUIComponents {
    func setCurrentUser(userId:UInt) -> Single<SendbirdError>
}

final class SendbirdUIComponentsImpl:SendbirdUIComponents {
    
    init(appId:String) {
    }
    
    func setCurrentUser(userId:UInt) -> Single<SendbirdError> {
        return Single.create { [weak self] observer in
            do{
                SBUGlobals.CurrentUser = SBUUser(userId: String(describing: userId))
                observer(.success(SendbirdError.success))
            }catch{
                log.error("Exception > setCurrentUser")
                observer(.failure(SendbirdError.fail))
            }
            return Disposables.create()
        }
        
    }
}
