//
//  ViewController.swift
//  ct_push
//
//  Created by Gaurav Singh on 23/06/22.
//

import UIKit
import CleverTapSDK
//import mParticle_CleverTap

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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
            "Name": "fury",
            "Email": "fury1234@gmail.com",
//            "Phone":"9087654321",
            "MSG-email": false,                     // Disable email notifications
            "MSG-push": true,                       // Enable push notifications
            "MSG-sms": false
        ]
//        UserDefaults.standard.set("fury@gmail.com", forKey: "email")
 
        let defaults = UserDefaults.init(suiteName: "group.nativeios")
        defaults?.setValue("fury123@gmail.com", forKey: "email")
        
//        let email = defaults?.value(forKey: "email") //Hello World!

 
//        print(email)
        
        
        CleverTap.sharedInstance()?.onUserLogin(profile)

                       
        
    }
    
    @IBAction func pushEvent(_ sender: UIButton) {
        CleverTap.sharedInstance()?.recordEvent("Screen View")

        
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
        
        CleverTap.sharedInstance()?.onUserLogin(profile)

    }
}

