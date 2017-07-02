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
    @IBOutlet var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func save() {
        let name = nameField.text
        let text = textField.text
        
        if let name = name{
            // name key が同じ場合は上書き
//            ref.child(name).setValue(text)
//            print("\(name): \(text)")
            
            // name key が同じでも上書きされない
            let key = ref.child(name).childByAutoId()
            key.setValue(text)
        } else {
            print("error")
        }
    }
    
    @IBAction func back() {
        self.dismiss(animated: true, completion: nil)
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
