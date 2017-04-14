//
//  ViewController.swift
//  FirebaseSample
//
//  Created by Miku Shimizu on 2017/04/05.
//  Copyright © 2017年 Miku Shimizu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let code: String = getCodeFromQuery(query: appDelegate.code)
        print(code)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getCodeFromQuery(query: String) -> String {
        // todo: 実装方法変える
//        # 複数パラメータきたらダメなやつ
//        - substring
//        - https://developer.apple.com/reference/swift/string/1690777-components 使う
//        - 正規表現
//        
//        # 正攻法
//        - URLQueryItem
//        print("query : \(query)")
        let code: String = (query as NSString).substring(from: 5)
//        print("code : \(code)")
        return code
    }


}

