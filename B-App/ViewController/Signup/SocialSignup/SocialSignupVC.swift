//
//  SocialSignupVC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/7/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit
import TwitterKit

class SocialSignupVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func actionBackBtn(_ sender: AnyObject) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actionFacebookBtn(_ sender: AnyObject) {
        FBManager.sharedInstance.currentUserProfile(viewController: self) { (success, response, strError) in
            
            if success == true{
                if let dictFB = response as? Dictionary <String , Any>
                {
                    print(dictFB["id"] as! String)
                    User.me.firstname = dictFB["first_name"] as! String
                    User.me.lastname = dictFB["last_name"] as! String
                    User.me.socialID = dictFB["id"] as! String
                    User.me.imageURL = String(format: "http://graph.facebook.com/%@/picture?type=large", User.me.socialID)
                }
            }else{
                showAlert(title: "B-App", message: strError!, controller: self)
            }
        }
    }
    
    @IBAction func actionTwitterBtn(_ sender: AnyObject) {
        Twitter.sharedInstance().logIn(completion: { (session, error) in
            if (session != nil) {
                
                let client = TWTRAPIClient.withCurrentUser()
                
                client.requestEmail { email, error in
                    if (email != nil) {
                        print("signed in as \(session!.userName)");
                    } else {
                        print("error: \(error!.localizedDescription)");
                    }
                }

            } else {
                print("error: \(error!.localizedDescription)");
            }
        })
    }
    
    @IBAction func actionLinkedinBtn(_ sender: AnyObject) {
    }
    
    @IBAction func actionCreateAccountBtn(_ sender: AnyObject) {
        self.pushViewController(controllerName: "SignupStep1VC", storyboardName: mainStoryboard)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
