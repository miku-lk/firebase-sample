//
//  AuthWebViewController.swift
//  FirebaseSample
//
//  Created by Miku Shimizu on 2017/05/12.
//  Copyright © 2017年 Miku Shimizu. All rights reserved.
//

import UIKit
import WebKit

class AuthWebViewController: UIViewController, WKNavigationDelegate {
    
    let clientId: String = "cb11c659caf1bb6d9491"
    var window: UIWindow?
    var code: String!
    
    var webView: WKWebView!
    
    override func loadView() {
        super.loadView()
        
        webView = WKWebView()
        view = self.webView!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        
        let urlStr: String = "https://github.com/login/oauth/authorize?client_id=" + clientId
        let url = URL(string: urlStr)!
        let req = URLRequest(url: url)
        
        webView.load(req)
        
    }
    
    // http://qiita.com/seiya_orz/items/0ed195b79953ec607ea1
    // リダイレクト時に呼ばれる関数
    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        if let url = webView.url?.absoluteString {
            print(url) // "miku-githubscheme://?code=d2fce3d45bfc8bd37935"
            
            let storyboard: UIStoryboard = self.storyboard!
            let mainView = storyboard.instantiateViewController(withIdentifier: "MainView")
            mainView.modalTransitionStyle = .flipHorizontal
            self.present(mainView, animated: true, completion: nil)
        }
    }
    // どのURLをリダイレクトとして扱うかのハンドリングをしている関数
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if let url = navigationAction.request.url?.absoluteString{
            if(url.hasPrefix("miku-githubscheme")){//この部分を処理したいURLにする
                // リダイレクトとして扱う
                decisionHandler(WKNavigationActionPolicy.allow)
            }else if(url.hasPrefix("http")){
                decisionHandler(WKNavigationActionPolicy.allow)
            }else{
                // リダイレクトとして扱わない
                decisionHandler(WKNavigationActionPolicy.cancel)
            }
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
