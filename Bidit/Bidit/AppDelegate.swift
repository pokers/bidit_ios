//
//  AppDelegate.swift
//  Bidit
//
//

import UIKit
import RxSwift
import KakaoSDKCommon 
import KakaoSDKAuth
import KakaoSDKUser

import SendBirdUIKitTarget
import SendBirdUIKit
import SendBirdSDK

import UserNotifications
import Firebase



@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Core Data
        lazy var persistentContainer: NSPersistentContainer = {
            // name: Core Data 만든 파일명 지정
            let container = NSPersistentContainer(name: "RecentSearchModel")
            container.loadPersistentStores(completionHandler: { (storeDescription, error) in
                if let error = error {
                    fatalError("Unresolved error, \((error as NSError).userInfo)")
                }
            })
            return container
        }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        //카카오
        KakaoSDK.initSDK(appKey: PrivateKey().KAKAO_APP_KEY )
//        if (AuthApi.isKakaoTalkLoginUrl(url)) {
//                    return AuthController.handleOpenUrl(url: url)
//                }

        
        let APP_ID =  PrivateKey().SENDBIRD_APP_ID // Specify your Sendbird application ID.
        
            SBUMain.initialize(applicationId: APP_ID) {
                // DB migration has started.
            } completionHandler: { error in
                // If DB migration is successful, proceed to the next step.
                // If DB migration fails, an error exists.
               
            }
        
        SBDMain.connect(withUserId: "USER_ID2",completionHandler: { (user, error) in
            
            
        })
        // Case 1: USER_ID only
        SBUGlobals.CurrentUser = SBUUser(userId: "USER_ID10")

        // Case 2: Specify all fields
        
        SBUGlobals.CurrentUser = SBUUser(userId: "USER_ID2")
        
       // SBUGlobals.CurrentUser = SBUUser(userId: "USER_ID3", nickname:"USER_ID3", profileUrl: "USER_ID")
       
        //파이어베이스
        UNUserNotificationCenter.current().delegate = self
                Messaging.messaging().delegate = self
                
                let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
                UNUserNotificationCenter
                  .current()
                  .requestAuthorization(
                    options: authOptions,completionHandler: { (_, _) in }
                  )
                application.registerForRemoteNotifications()
        
          
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
            if (AuthApi.isKakaoTalkLoginUrl(url)) {
                return AuthController.handleOpenUrl(url: url)
            }

            return false
        }
    
    

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    


}

extension AppDelegate: UNUserNotificationCenterDelegate, MessagingDelegate {
    
    public func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        let firebaseToken = fcmToken ?? ""
        print("firebase token: \(firebaseToken)")
    }
    
    public func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .badge, .sound])
    }
    
    public func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }
}

