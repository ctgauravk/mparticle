//
//  AppDelegate.swift
//  ct_push
//
//  Created by Gaurav Singh on 23/06/22.
//

import UIKit
import CleverTapSDK
@main
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate, CleverTapURLDelegate, CleverTapPushNotificationDelegate {
    
    func shouldHandleCleverTap(_ url: URL?, for channel: CleverTapChannel) -> Bool {
        print("Handling URL by CT App: \(url!) for channel: \(channel)")
        
        return true
    }
    



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        CleverTap.autoIntegrate()
        self.registerForPush()
        CleverTap.setDebugLevel(3)
        UNUserNotificationCenter.current().delegate = self
        CleverTap.sharedInstance()?.setUrlDelegate(self)
        CleverTap.sharedInstance()?.setPushNotificationDelegate(self)
        CleverTap.sharedInstance()?.enableDeviceNetworkInfoReporting(true)
//        self.applicationDidBecomeActive(<#T##application: UIApplication##UIApplication#>)
        UIApplication.shared.applicationIconBadgeNumber = 0

        return true
    }
     
    
    private func registerForPush() {
        UNUserNotificationCenter.current().delegate = self
//        let action1 = UNNotificationAction(identifier: "action_1", title: "Back", options: [])
//        let action2 = UNNotificationAction(identifier: "action_2", title: "Next", options: [])
//        let action3 = UNNotificationAction(identifier: "action_3", title: "View In App", options: [])
//        let category = UNNotificationCategory(identifier: "CTNotification", actions: [action1, action2, action3], intentIdentifiers: [], options: [])
//        UNUserNotificationCenter.current().setNotificationCategories([category])
        // request permissions
        UNUserNotificationCenter.current().requestAuthorization(options: [.sound, .alert, .badge]) {
            (granted, error) in
            if (granted) {
                DispatchQueue.main.async {
                    print("Push Notification permission asked 1")

                   UIApplication.shared.registerForRemoteNotifications()
                    print("Push Notification permission asked 2")

                }
            }
        }
    }
    
    func pushNotificationTapped(withCustomExtras customExtras: [AnyHashable : Any]!) {
          print("Push Notification Tapped with Custom Extras: \(customExtras)")
      
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                    didReceive response: UNNotificationResponse,
                                    withCompletionHandler completionHandler: @escaping () -> Void) {
            
       
//        CleverTap.sharedInstance()?.handleNotification(withData: response.notification.request.content.userInfo)
        
        completionHandler()
            
    }

    func userNotificationCenter(
      _ center: UNUserNotificationCenter,
      willPresent notification: UNNotification,
      withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
//        completionHandler([.banner, .badge, .sound])
      
      CleverTap.sharedInstance()?.handleNotification(withData: notification.request.content.userInfo, openDeepLinksInForeground: true)
      completionHandler([.badge, .sound, .alert])
  }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("did fail to register \(error.localizedDescription)")
    }


    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
    }
    
    func application(_ application: UIApplication,
                     didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let token = deviceToken.map { String(format: "%02.2hhx", $0) }.joined()
        print("Push Notification permission asked 3 \(token)")
               
        CleverTap.sharedInstance()?.setPushToken(deviceToken as Data)
    }


}

