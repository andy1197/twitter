//
//  LoginViewController.swift
//  Twitter
//
//  Created by Andy Wang on 9/11/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBAction func onLoginButton(_ sender: Any) {
        let url = "https://api.twitter.com/oauth/request_token"
        TwitterAPICaller.client?.login(url: url, success: {
            // SUCCESSFUL LOGIN: go from login screen to homescreen
            self.performSegue(withIdentifier: "loginToHome", sender: self)
            UserDefaults.standard.set(true, forKey: "userLoggedIn")
        }, failure: { (Error) in
            print("Login failed")
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "userLoggedIn") {
            self.performSegue(withIdentifier:"loginToHome", sender: self)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
