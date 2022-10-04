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

    override func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
        let defaults = UserDefaults.init(suiteName: "group.com.ctpush")

        //for logged in users onuserLogin called so impression goes to right profile
        let logged_in = defaults?.value(forKey: "logged_in")
        print("logged \(logged_in)")
        let email2 = defaults?.value(forKey: "email")

            print("email2 \(email2)")
            if ((logged_in) != nil) {
            let email = defaults?.value(forKey: "email")

                print("email \(email)")
                   let profile: Dictionary<String, Any> =
                   [
                    "Email": email as Any,
    
                        ]
    
                   CleverTap.sharedInstance()?.onUserLogin(profile)
            }
        CleverTap.sharedInstance()?.recordNotificationViewedEvent(withData: request.content.userInfo)
        super.didReceive(request, withContentHandler: contentHandler)
    }

}
