//
//  DatabaseViewController.swift
//  FirebaseSample
//
//  Created by Miku Shimizu on 2017/06/03.
//  Copyright © 2017年 Miku Shimizu. All rights reserved.
//

import UIKit
import FirebaseDatabase

class DatabaseViewController: UIViewController {
    
    let ref: FIRDatabaseReference! = FIRDatabase.database().reference()
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var textField: UITextField!
    @IBOutlet var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func save() {
        let name = nameField.text
        let text = textField.text
        if let name = name{
            ref.child(name).setValue(text)
            print("\(name): \(text)")
        } else {
            print("error")
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
