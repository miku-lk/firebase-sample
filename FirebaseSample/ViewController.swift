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
        let code = getCodeFromQuery(query: appDelegate.code)
//        print(code)
        
        sendPOSTRequest(code: code)
    }

    func getCodeFromQuery(query: String) -> String {
        /*
         todo: 実装方法変える
         # 複数パラメータきたらダメなやつ
         - substring
         - https://developer.apple.com/reference/swift/string/1690777-components 使う
         - 正規表現
         
         # 正攻法
         - URLQueryItem
        */
        let code = (query as NSString).substring(from: 5)
        return code
    }
    
    func sendPOSTRequest(code: String) {
        
        // make URL
        let clientId = "cb11c659caf1bb6d9491"
        let clientSecret = "e9dc98527a8d21153a34ed034558948be4fc98e4"
        let query = "?code=" + code + "&client_id=" + clientId + "&client_secret=" + clientSecret
        let urlStr = "https://github.com/login/oauth/access_token" + query
        
        var request = URLRequest(url: URL(string: urlStr)!)
        request.httpMethod = "POST"
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        
        let task = session.dataTask(with: request, completionHandler: getAccessToken)
        task.resume()
        
        /*
         todo:
         tokenQuery // "access_token=1234567890&scope=..."
         ->
         token      // "1234567890"
        */
        
    }
    
    func getAccessToken(data: Data?, responce: URLResponse?, error: Error?){
        let tokenQuery = NSString(data: data!, encoding: String.Encoding.utf8.rawValue) as! String
        
        let urlStr: String = "http://example.com/?" + tokenQuery
        let comp: NSURLComponents? = NSURLComponents(string: urlStr)
        let fragments = generateDictionalyFromUrlComponents(components: comp!)
        let accessToken: String = fragments["access_token"]!
        print("access_token: \(accessToken)")
    }
    
    // http://fromatom.hatenablog.com/entry/2015/10/27/125622
    func generateDictionalyFromUrlComponents(components: NSURLComponents) -> [String : String] {
        var fragments: [String : String] = [:]
        guard let items = components.queryItems else {
            return fragments
        }
        
        for item in items {
            fragments[item.name] = item.value
        }
        
        return fragments
    }
    
    
    
}

