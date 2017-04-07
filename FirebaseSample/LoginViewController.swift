//
//  LoginViewController.swift
//  FirebaseSample
//
//  Created by Miku Shimizu on 2017/04/07.
//  Copyright © 2017年 Miku Shimizu. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var githubIdField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func login(){
        if let idText = githubIdField.text{
            print(idText)
        }
        if let pwText = passwordField.text{
            print(pwText)
        }
        
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
