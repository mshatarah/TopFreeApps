//
//  AppStoreWebViewController.swift
//  Top Free Apps
//
//  Created by mohammad shatarah on 4/8/19.
//  Copyright © 2019 mohammad shatarah. All rights reserved.
//

import UIKit
import WebKit

class AppStoreWebViewController: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var appLink: String?
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadWebView()
    }
    
    func loadWebView() -> Void {
        UserDefaults.standard.register(defaults: ["UserAgent": "Custom-Agent"])
        let url = URL(string: appLink!)!
        
        webView = WKWebView(frame:  CGRect(x: 0, y: 70, width: self.view.bounds.width, height: self.view.bounds.height), configuration: WKWebViewConfiguration())
        webView.navigationDelegate = self
        webView.setDesktopMode(on: true)
        webView.load(URLRequest(url: url))
        self.view.addSubview(webView)
        webView.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension AppStoreWebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        webView.isHidden = true
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.webView.isHidden = false
        self.activityIndicator.isHidden = true
    }
}
