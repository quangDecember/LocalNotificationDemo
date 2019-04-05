//
//  FrameworkInstance.swift
//  frameworkwithnotifications
//
//  Created by Ha, Quang on 2019/04/04.
//  Copyright © 2019 Rakuten Asia Pte. Ltd. All rights reserved.
//

import Foundation
import UIKit

public class FrameworkInstance {
    public static let shared = FrameworkInstance.init()
    
    public func start() {
        NotificationCenter.default.addObserver(forName: UIApplication.willEnterForegroundNotification, object: nil, queue: nil, using: {note in
            let SignInMessage = InAppMessageController.init(nibName: "InAppMessageController", bundle: Bundle.init(for: InAppMessageController.self))
                //GoogleWebViewController.init(nibName: "GoogleWebViewController", bundle: Bundle.init(for: GoogleWebViewController.self))
            UIApplication.shared.getTopViewController()?.present(SignInMessage, animated: true, completion: nil)
        })
    }
}
