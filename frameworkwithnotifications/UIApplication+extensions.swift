//
//  UIApplication+extensions.swift
//  frameworkwithnotifications
//
//  Created by Ha, Quang on 2019/04/04.
//  Copyright © 2019 Rakuten Asia Pte. Ltd. All rights reserved.
//

import Foundation
import UIKit
extension UIApplication {
    func getTopViewController() -> UIViewController? {
        if var topViewController: UIViewController = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = topViewController.presentedViewController {
                topViewController = presentedViewController
            }
            return topViewController
        }
        return nil
    }
}
