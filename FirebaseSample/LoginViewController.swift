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

class LoginViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    let clientId: String = "cb11c659caf1bb6d9491"
    let modalInstance = ModalAnimation()
    
    @IBOutlet var loginButton: UIButton!
    
    var safariVC: SFSafariViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let loginUrlStr: String = "https://github.com/login/oauth/authorize?client_id=" + clientId
        let loginUrl: NSURL = NSURL(string: loginUrlStr)!
        safariVC = SFSafariViewController(url: loginUrl as URL)
        safariVC.transitioningDelegate = self
        
    }
    
    @IBAction func login(){
//        if let idText = githubIdField.text{
//            print(idText)
//        }
//        if let pwText = passwordField.text{
//            print(pwText)
//        }
        
        self.present(safariVC, animated: true)
        
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        modalInstance.presenting = true
        return modalInstance
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        modalInstance.presenting = false
        return modalInstance
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
