//
//  InAppMessageController.swift
//  frameworkwithnotifications
//
//  Created by Ha, Quang on 2019/04/04.
//  Copyright © 2019 Rakuten Asia Pte. Ltd. All rights reserved.
//

import UIKit
import WebKit

public class InAppMessageController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var mainWebView: WKWebView!
    override public func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        mainWebView.navigationDelegate = self
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let mainURL = URL.init(string: "https://spotify.com")!
        mainWebView.load(URLRequest.init(url: mainURL))
        self.view.bringSubviewToFront(mainWebView)
    }
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
    }
}
