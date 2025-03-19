//
//  ViewController.swift
//  ct_push
//
//  Created by Gaurav Singh on 23/06/22.
//

import UIKit
import CleverTapSDK
 //import mParticle_CleverTap

class ViewController: UIViewController, CleverTapURLDelegate, CleverTapInAppNotificationDelegate {
    
    
    func shouldHandleCleverTap(_ url: URL?, for channel: CleverTapChannel) -> Bool {
        
        print("Handling URL: \(url!) for channel: \(channel)")
//        if let dct = url.queryParameters{
//            let deeplinkFromQuery = dct["custom"] {
//                deeplinkNavigation(with: deeplinkFromQuery)
//            }
//        }
        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "ScreenTwo") as UIViewController
//        self.navigationController?.pushViewController(vc, animated: true)
//        
        return true
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        print("1234567890")
        
        
        
//        guard let accId = CleverTap.sharedInstance()?.config.accountId else {
//            return
//        }
//        
//      
//        
//        let fileName = "com.clevertap.ctpush.plist"
//        let appDir = NSSearchPathForDirectoriesInDomains(.preferencePanesDirectory, .userDomainMask, true).last
//        let filePath = "\(appDir!)/\(fileName)"
//        if FileManager.default.fileExists(atPath: filePath) {
//            try! FileManager.default.removeItem(atPath: filePath)
//        }
//        
//        
//        print("1234567890 \(filePath)")
//
//        let defaults = UserDefaults.standard
//        let dictionary = defaults.dictionaryRepresentation()
//        dictionary.keys.forEach { key in
//            if key.contains("WizRocket"){
////                print("key \(key)")
//                if(key==("WizRocket6ZR-965-446Z:CachedGUIDS")){
//                    var value:[String:String] = dictionary[key] as! [String : String]
//                    
//                    value.keys.forEach {key1 in
//                    print("1234567890 \(key1)")
//                        if(key1.contains("Identity_")){
//                            print("1234567890 key identity \(key1)")
//                            value.removeValue(forKey: key1)
//                        }
//                    }
//                    defaults.removeObject(forKey: "WizRocket6ZR-965-446Z:CachedGUIDS")
//                    defaults.set(value, forKey: "WizRocket6ZR-965-446Z:CachedGUIDS")
//                    
//                    
//                }
////                if(key != "WizRocketdevice_token" || key != "WizRocketfirstTime"){
////                    defaults.removeObject(forKey: key)
////                }
//            }
//        }
//        defaults.synchronize()
//                
//        
        
        
        
        
        let profile: Dictionary<String, AnyObject> = [
            "Name": "SG8" as AnyObject,                 // String
            "Identity": "2f16fb24" as AnyObject,                   // String or number
            "Email": "2f16fb24@gmail.com" as AnyObject,              // Email address of the user
//            "Phone": "+14155551234" as AnyObject,                // Phone (with the country code, starting with +)
//            "Gender": "M" as AnyObject,                          // Can be either M or F
//            "DOB": d! as AnyObject,                              // Date of Birth. An NSDate object
//            "Age": 28 as AnyObject,                              // Not required if DOB is set
//            "Photo": "www.foobar.com/image.jpeg" as AnyObject,   // URL to the Image

        // optional fields. controls whether the user will be sent email, push etc.
//            "MSG-email": false as AnyObject,                     // Disable email notifications
//            "MSG-push": true as AnyObject,                       // Enable push notifications
//            "MSG-sms": false as AnyObject,                       // Disable SMS notifications
//            "MSG-dndPhone": true as AnyObject,                   // Opt out phone number from SMS notifications
//            "MSG-dndEmail": true as AnyObject,                   // Opt out email from email notifications
        ]

//        CleverTap.sharedInstance()?.profilePush(profile)
        let c_email = "naoy1a@gmail.com"
//      let profile: Dictionary<String, Any> =
//        [
//            "Name": "Naoya",
//            "Email": c_email,
////            "Phone":"9087654321",
//            "MSG-email": false,                     // Disable email notifications
//            "MSG-push": true,                       // Enable push notifications
//            "MSG-sms": false
//        ]
//        let defaults = UserDefaults.init(suiteName: "group.nativeios")
//        defaults?.setValue(c_email, forKey: "email")
//        defaults?.set(true, forKey: "logged_in")
//
//        let email = defaults?.value(forKey: "email")
//        print("email23 \(email)")
//        let logged_in = defaults?.value(forKey: "logged_in")
//        print("logged2 \(logged_in)")
//        print(CleverTap.sharedInstance()?.profileGetID() as Any)

//        CleverTap.sharedInstance()?.onUserLogin(profile)
        
//        let options = MParticleOptions(key: "us2-a38cf3f0faab0645946a3e962c6b57a3",
//                                 secret: "z1_88POaW8Xdz3eVp-lWryMzMgb06EQS8egpZhIyS0-_UeE_eiB3eu-7rvk-_cz2")
//              options.environment = .development
//              options.logLevel = MPILogLevel.verbose
//
////              let identityRequest = MPIdentityApiRequest.withEmptyUser()
////              identityRequest.email = "martpicle@examplemparticle1.com"
////              identityRequest.customerId = "234567"
////              options.identifyRequest = identityRequest
//              options.onIdentifyComplete = {(result: MPIdentityApiResult?, error: Error?) in
//                if (result?.user != nil) {
//                  result?.user.setUserAttribute("key1", value: "value1")
//                  result?.user.setUserAttribute("key2", value: "value2")
//                } else {
//                  //handle failure - see below
//                }
//              }
//
//              MParticle.sharedInstance().start(with: options)
//
//        if let event = MPEvent(name: "Video Watched", type: MPEventType.navigation) {
//            event.customAttributes = ["category": "Destination Intro", "title": "Paris"]
//            MParticle.sharedInstance().logEvent(event)
//        }
//        //not recommended
//        let id = MParticle.sharedInstance().identity.currentUser
//        id?.setUserAttribute("email", value: "gs21@gmail.com")
//        id?.setUserAttribute("language", value: "English")
//
//        //recommended
//        let identityRequest = MPIdentityApiRequest.withEmptyUser()
//        identityRequest.email = "martpicle@examplemparticle1.com"
//        identityRequest.customerId = "234567"
//
//
//        MParticle.sharedInstance().identity.login(identityRequest)
        
//        print(UserDefaults.standard.value(forKey: "email"))

        // Do any additional setup after loading the view.
        
        
        
    }



    @IBAction func cutomLogin(_ sender: UIButton) {
        print("login clicked")
        let profile: Dictionary<String, Any> =
        [
            "Identity":17778202
//            "Name": "fury",
//            "Email": "testcofe@gmail.com",
//            "Phone":"+9194567890125",
//            "MSG-email": false,                     // Disable email notifications
//            "MSG-push": true,                       // Enable push notifications
//            "MSG-sms": false
        ]
//        UserDefaults.standard.set("fury@gmail.com", forKey: "email")
 
        let defaults = UserDefaults.init(suiteName: "group.nativeios")
        defaults?.setValue("testcofe@gmail.com", forKey: "email")
        
//        let email = defaults?.value(forKey: "email") //Hello World!

 
//        print(email)
        
        
//        CleverTap.sharedInstance()?.onUserLogin(profile)
//        let storyboard = UIStoryboard(name: "main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "screentwo") as UIViewController
//        self.navigationController?.pushViewController(vc, animated: true)
      

        
                       
//        -e56147b696a54b6b842d54b83b6589c9
    }
    
    @IBAction func pushEvent(_ sender: UIButton) {
//        for key in UserDefaults.standard.dictionaryRepresentation().keys {
//            if key.hasPrefix("WizRocket"){
////
//                UserDefaults.standard.removeObject(forKey: key)
//            }
//        }

        
        guard let accId = CleverTap.sharedInstance()?.config.accountId else {
            return
        }
//        -af9c967b85ac44f59188155795df7cd2
//        -df5399280da2440dbd891df30dcdad44
      
        
        let fileName = "com.clevertap.ctpush.plist"
        let appDir = NSSearchPathForDirectoriesInDomains(.preferencePanesDirectory, .userDomainMask, true).last
        let filePath = "\(appDir!)/\(fileName)"
        print("1234567890 \(filePath)")
        if FileManager.default.fileExists(atPath: filePath) {
            try! FileManager.default.removeItem(atPath: filePath)
        }
        
        
        print("1234567890 \(filePath)")

        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            if key.contains("WizRocket"){
                print("key \(key)")
//                if(key==("WizRocket6ZR-965-446Z:CachedGUIDS")){
//                    var value:[String:String] = dictionary[key] as! [String : String]
//                    
//                    value.keys.forEach {key1 in
//                    print("1234567890 \(key1)")
//                        if(key1.contains("Identity_")){
//                            print("1234567890 key identity \(key1)")
//                            value.removeValue(forKey: key1)
//                        }
//                    }
//                    defaults.removeObject(forKey: "WizRocket6ZR-965-446Z:CachedGUIDS")
//                    defaults.set(value, forKey: "WizRocket6ZR-965-446Z:CachedGUIDS")
//                    
//                    
//                }
//                if(key != "WizRocketdevice_token" || key != "WizRocketfirstTime"){
//                    defaults.removeObject(forKey: key)
//                }
            }
        }
        defaults.synchronize()
//
        
//        guard let accId = CleverTap.sharedInstance()?.config.accountId else {
//            return
//        }
//        
//      
//        
//        let fileName = "clevertap-\(accId)-userprofile.plist"
//        let appDir = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true).last
//        let filePath = "\(appDir!)/\(fileName)"
//        if FileManager.default.fileExists(atPath: filePath) {
//            try! FileManager.default.removeItem(atPath: filePath)
//        }
//
//        let defaults = UserDefaults.standard
//        let dictionary = defaults.dictionaryRepresentation()
//        dictionary.keys.forEach { key in
//            if key.contains("WizRocket"){
//                print("key \(key)")
//                if(key != "WizRocketdevice_token" || key != "WizRocketfirstTime"){
//                    defaults.removeObject(forKey: key)
//                }
//            }
//        }
//        defaults.synchronize()
//        

//        let token =  UserDefaults.standard.data(forKey: "ct_push_token");
        
        let props = [
            "Seller Label": "SELLER_2",
            "Buyer Label": "BUYER_2",
            "My Size Filter": false,
            "Content": "EXCELLENT",
            "Label":"HP_SS_B",
            "value":0
        ] as [String : Any]
        CleverTap.sharedInstance()?.recordEvent("Push Event", withProps: props)

//        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
// 
//            
//            print("qwertyui \(token)");
////            CleverTap.sharedInstance()?.setPushToken(token! as Data)
//
//        }
        
 
        
    }
    
    @IBAction func login2(_ sender: UIButton) {
        
        let profile: Dictionary<String, Any> =
        [
            "Name": "fury",
            "Email": "joshua@gmail.com",
//            "Phone":"9087654321",
            "MSG-email": true,                     // Disable email notifications
            "MSG-push": true,                       // Enable push notifications
            "MSG-sms": false
        ]
//        UserDefaults.standard.set("fury@gmail.com", forKey: "email")
//
        let defaults = UserDefaults.init(suiteName: "group.nativeios")
        defaults?.setValue("joshua@gmail.com", forKey: "email")
        
//        let email = defaults?.value(forKey: "email") //Hello World!

 
//        print(email)
        
//        CleverTap.sharedInstance()?.onUserLogin(profile)

        CleverTap.sharedInstance()?.recordEvent("Search Result Scroll")
    }
    
    func inAppNotificationButtonTapped(withCustomExtras customExtras: [AnyHashable : Any]!) {
          print("In-App Button Tapped with custom extras:", customExtras ?? "");
      }
}

