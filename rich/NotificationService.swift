////
////  NotificationService.swift
////  rich
////
////  Created by Gaurav Singh on 23/06/22.
////
//
//import UserNotifications
//import CTNotificationService
//import CleverTapSDK
//
//class NotificationService: CTNotificationServiceExtension {
//
//    var contentHandler: ((UNNotificationContent) -> Void)?
//    var bestAttemptContent: UNMutableNotificationContent?
//
//    override func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
//        let defaults = UserDefaults.init(suiteName: "group.nativeios")
//
//        print("in notification service")
//        //for logged in users onuserLogin called so impression goes to right profile
//        let logged_in = defaults?.value(forKey: "logged_in")
//        print("logged \(logged_in)")
//        let email2 = defaults?.value(forKey: "email")
//
//            print("email2 \(email2)")
//            if ((logged_in) != nil) {
//            let email = defaults?.value(forKey: "email")
//
//                print("email \(email)")
//                   let profile: Dictionary<String, Any> =
//                   [
//                    "Email": email as Any,
//
//                        ]
//
//                   CleverTap.sharedInstance()?.onUserLogin(profile)
//            }
//
////        CleverTap.sharedInstance()?.isCleverTapNotification(response.notification.request.content.userInfo) == true
//
//        CleverTap.sharedInstance()?.recordNotificationViewedEvent(withData: request.content.userInfo)
//        super.didReceive(request, withContentHandler: contentHandler)
//    }
//
//}

//import EngageKit
import UserNotifications
import CTNotificationService
 //import CleverTapSDK

class NotificationService: CTNotificationServiceExtension {
    
    struct Constants {
        static let ImageKey = "LP_URL"
        static let LP_KEY_PUSH_MESSAGE_ID = "_lpm"
        static let LP_KEY_PUSH_MUTE_IN_APP = "_lpu"
        static let LP_KEY_PUSH_NO_ACTION = "_lpn"
        static let LP_KEY_PUSH_NO_ACTION_MUTE = "_lpv"
    }

    var contentHandler: ((UNNotificationContent) -> Void)?
    var bestAttemptContent: UNMutableNotificationContent?

    override func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
        self.contentHandler = contentHandler
        bestAttemptContent = (request.content.mutableCopy() as? UNMutableNotificationContent)
        print("Leanplum: 1")
        let defaults = UserDefaults.init(suiteName: "group.nativeios")
        let logged_in = defaults?.object(forKey: "ctCallback")
        
        //CleverTap.sharedInstance()?.recordNotificationViewedEvent(withData: request.content.userInfo)
        //didReceiveEngageSetup(request, withContentHandler: contentHandler)
        didReceiveLeanplumWrapperSetup(request, withContentHandler: contentHandler)
    }
    
   private func didReceiveEngageSetup(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
        print("Leanplum: 2")
//        CleverTap.sharedInstance()?.recordNotificationViewedEvent(withData: request.content.userInfo)
//        if Engage.shared.isEngagePayload(bestAttemptContent?.userInfo) {
//            Engage.shared.handleNSEPush(
//                request,
//                using: "group.com.yatechnologies.yassirRider.engage",
//                includeThumbnail: false,
//                withContentHandler: contentHandler
//            )
//        }
    }
    
    private func didReceiveLeanplumWrapperSetup(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
        print("Leanplum: 3")
//        CleverTap.sharedInstance()?.recordNotificationViewedEvent(withData: request.content.userInfo)
        if let bestAttemptContent = bestAttemptContent {
            let userInfo = request.content.userInfo;
            print("Leanplum: 4")
            guard (userInfo[Constants.LP_KEY_PUSH_MESSAGE_ID] ??
                   userInfo[Constants.LP_KEY_PUSH_MUTE_IN_APP] ??
                   userInfo[Constants.LP_KEY_PUSH_NO_ACTION] ??
                   userInfo[Constants.LP_KEY_PUSH_NO_ACTION_MUTE]) != nil else {
                
//                CleverTap.sharedInstance()?.recordNotificationViewedEvent(withData: request.content.userInfo)
                // Not a Leanplum notification, try CleverTap
                super.didReceive(request, withContentHandler: contentHandler)
                return
            }

            // LP_URL is the key that is used from Leanplum to
            // send the image URL in the payload.
            //
            // If there is no LP_URL in the payload than
            // the code will still show the push notification.
            if userInfo[Constants.ImageKey] == nil {
                contentHandler(bestAttemptContent);
                return;
            }

            // If there is an image in the payload.
            if let attachmentMedia = userInfo[Constants.ImageKey] as? String {
                displayPayloadImage(attachmentMedia: attachmentMedia, contentHandler: contentHandler, bestAttemptContent: bestAttemptContent)
            }
        }
    }
    
    /// A function that downloads then displays payload's image.
    private func displayPayloadImage(
        attachmentMedia: String,
        contentHandler: @escaping (UNNotificationContent) -> Void,
        bestAttemptContent: UNMutableNotificationContent
    ) {
        print("Leanplum: 5")
//        CleverTap.sharedInstance()?.recordNotificationViewedEvent(withData: request.content.userInfo)
        let mediaUrl = URL(string: attachmentMedia)
        let LPSession = URLSession(configuration: .default)
        LPSession.downloadTask(with: mediaUrl!, completionHandler: { temporaryLocation, response, error in
            if let err = error {
                contentHandler(bestAttemptContent)
                return;
            }

            let fileType = self.determineType(fileType: (response?.mimeType)!)
            let fileName = temporaryLocation?.lastPathComponent.appending(fileType)

            let temporaryDirectory = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(fileName!)

            do {
                try FileManager.default.moveItem(at: temporaryLocation!, to: temporaryDirectory)
                let attachment = try UNNotificationAttachment(identifier: "", url: temporaryDirectory, options: nil)

                bestAttemptContent.attachments = [attachment];
                contentHandler(bestAttemptContent);
                // The file should be removed automatically from temp
                // Delete it manually if it is not
                if FileManager.default.fileExists(atPath: temporaryDirectory.path) {
                    try FileManager.default.removeItem(at: temporaryDirectory)
                }
            } catch {
                contentHandler(bestAttemptContent);
                return;
            }
        }).resume()
    }

    override func serviceExtensionTimeWillExpire() {
//        Engage.shared.nseTimeExpiring()
        
        // Called just before the extension will be terminated by the system.
        // Use this as an opportunity to deliver your "best attempt" at modified content, otherwise the original push payload will be used.
        if let contentHandler, let bestAttemptContent {
            contentHandler(bestAttemptContent)
        }
    }

    // MARK: - Leanplum Rich Push
    func determineType(fileType: String) -> String {
        // Determines the file type of the attachment to append to URL.
        switch fileType {
        case "image/jpeg":
            return ".jpg"
            
        case "image/gif":
            return ".gif"
            
        case "image/png":
            return ".png"
            
        default:
            return ".tmp"
        }
    }
}
