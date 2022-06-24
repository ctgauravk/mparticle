//
//  NotificationService.swift
//  rich
//
//  Created by Gaurav Singh on 23/06/22.
//

import UserNotifications
import CTNotificationService
import CleverTapSDK

class NotificationService: CTNotificationServiceExtension {

    var contentHandler: ((UNNotificationContent) -> Void)?
    var bestAttemptContent: UNMutableNotificationContent?
 
    override func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping(UNNotificationContent) -> Void) {
//
//
//        let email = UserDefaults.standard.string(forKey: "email")
//
//        print(email)
//
//
//               let profile: Dictionary<String, Any> =
//               [
//
//                   "Email": email
//                   ]
//
//               CleverTap.sharedInstance()?.onUserLogin(profile)
        
        
        CleverTap.sharedInstance()?.recordNotificationViewedEvent(withData: request.content.userInfo)
        super.didReceive(request, withContentHandler:contentHandler)
 }
}
