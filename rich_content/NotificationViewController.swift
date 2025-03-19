//
//  NotificationViewController.swift
//  rich_content
//
//  Created by Gaurav Singh on 04/10/22.
//

import CleverTapSDK
import CTNotificationContent
import UIKit
import UserNotifications
class NotificationViewController: CTNotificationViewController {
    @IBOutlet var label: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
//    func didReceive(_ notification: UNNotification) {
//        self.label?.text = notification.request.content.body
//    }
//    // optional: implement to get user event data
//    override func userDidPerformAction(_ action: String, withProperties properties: [AnyHashable : Any]!) {
//        print("userDidPerformAction \(action) with props \(String(describing: properties))")
//    }
//
//    // optional: implement to get notification response
    override func userDidReceive(_ response: UNNotificationResponse?) {
        print("Push Notification Payload \(String(describing: response?.notification.request.content.userInfo))")
        let notificationPayload = response?.notification.request.content.userInfo
        if (response?.actionIdentifier == "action_2") {
            CleverTap.sharedInstance()?.recordNotificationClickedEvent(withData: notificationPayload ?? "")
        }
    }
}

//class NotificationViewController: CTNotificationViewController {
//
//   override func viewDidLoad() {
//       super.viewDidLoad()
//   }
//
//   // optional: implement to get user event data
//   override func userDidPerformAction(_ action: String, withProperties properties: [AnyHashable : Any]!) {
//       print("userDidPerformAction \(action) with props \(String(describing: properties))")
//   }
//
//   // optional: implement to get notification response
//   override func userDidReceive(_ response: UNNotificationResponse?) {
//       print("Push Notification Payload \(String(describing: response?.notification.request.content.userInfo))")
//       let notificationPayload = response?.notification.request.content.userInfo
//       if (response?.actionIdentifier == "action_2") {
//           CleverTap.sharedInstance()?.recordNotificationClickedEvent(withData: notificationPayload ?? "")
//       }
//   }
//}
