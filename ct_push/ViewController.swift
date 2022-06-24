//
//  ViewController.swift
//  ct_push
//
//  Created by Gaurav Singh on 23/06/22.
//

import UIKit
import CleverTapSDK
import mParticle_CleverTap

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//
//        let profile: Dictionary<String, Any> =
//        [
//            "Name": "AJ",
//            "Email": "AJ@gmail.com",
////            "Phone":"9087654321",
//            "MSG-email": false,                     // Disable email notifications
//            "MSG-push": true,                       // Enable push notifications
//            "MSG-sms": false
//        ]
////        UserDefaults.standard.set("bud@gmail.com", forKey: "email")
////        let email = UserDefaults.standard.string(forKey: "email")
//
////        print(email)
//        CleverTap.sharedInstance()?.onUserLogin(profile)
        
        let options = MParticleOptions(key: "us2-a38cf3f0faab0645946a3e962c6b57a3",
                                 secret: "z1_88POaW8Xdz3eVp-lWryMzMgb06EQS8egpZhIyS0-_UeE_eiB3eu-7rvk-_cz2")
              options.environment = .development
              options.logLevel = MPILogLevel.verbose
             
//              let identityRequest = MPIdentityApiRequest.withEmptyUser()
//              identityRequest.email = "martpicle@examplemparticle1.com"
//              identityRequest.customerId = "234567"
//              options.identifyRequest = identityRequest
              options.onIdentifyComplete = {(result: MPIdentityApiResult?, error: Error?) in
                if (result?.user != nil) {
                  result?.user.setUserAttribute("key1", value: "value1")
                  result?.user.setUserAttribute("key2", value: "value2")
                } else {
                  //handle failure - see below
                }
              }
             
              MParticle.sharedInstance().start(with: options)
        
        if let event = MPEvent(name: "Video Watched", type: MPEventType.navigation) {
            event.customAttributes = ["category": "Destination Intro", "title": "Paris"]
            MParticle.sharedInstance().logEvent(event)
        }
        //not recommended
        let id = MParticle.sharedInstance().identity.currentUser
        id?.setUserAttribute("email", value: "gs21@gmail.com")
        id?.setUserAttribute("language", value: "English")
        
        //recommended
        let identityRequest = MPIdentityApiRequest.withEmptyUser()
        identityRequest.email = "martpicle@examplemparticle1.com"
        identityRequest.customerId = "234567"
        
         
        MParticle.sharedInstance().identity.login(identityRequest)
        
        print(CleverTap.sharedInstance()?.profileGetID() as Any)
//        print(UserDefaults.standard.value(forKey: "email"))

        // Do any additional setup after loading the view.
    }


}

