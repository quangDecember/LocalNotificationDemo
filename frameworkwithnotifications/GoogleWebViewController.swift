//
//  GoogleWebViewController.swift
//  RewardSDK-AppTarget
//
//  Created by Ha, Quang on 2019/03/11.
//  Copyright © 2019 Rakuten Asia Pte. Ltd. All rights reserved.
//

import UIKit
import WebKit
class GoogleWebViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let webView = WKWebView.init(frame: self.view.frame)
        let url = URL.init(string: "https://www.google.com")!
        let request = URLRequest.init(url: url)
        webView.load(request)
        self.view.addSubview(webView)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
