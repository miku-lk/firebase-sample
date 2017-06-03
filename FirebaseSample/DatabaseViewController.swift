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
    
    var ref: FIRDatabaseReference! = FIRDatabase.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
