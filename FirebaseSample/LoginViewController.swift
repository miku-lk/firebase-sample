//
//  LoginViewController.swift
//  FirebaseSample
//
//  Created by Miku Shimizu on 2017/04/07.
//  Copyright © 2017年 Miku Shimizu. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import SafariServices

class LoginViewController: UIViewController {
    
    let clientId: String = "cb11c659caf1bb6d9491"
    
    @IBOutlet var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        }
    
    @IBAction func login(){

        let loginUrlStr: String = "https://github.com/login/oauth/authorize?client_id=" + clientId
        let loginUrl: NSURL = NSURL(string: loginUrlStr)!
        self.present(SFSafariViewController(url: loginUrl as URL), animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
