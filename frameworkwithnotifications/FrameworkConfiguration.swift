//
//  FrameworkConfiguration.swift
//  frameworkwithnotifications
//
//  Created by Ha, Quang on 2019/03/22.
//  Copyright © 2019 Rakuten Asia Pte. Ltd. All rights reserved.
//

import Foundation
import UserNotifications

public class FrameworkConfiguration {
    public var allowMissionNotification = true
}

public protocol FrameworkDelegate {
    func didScheduleMissionNotification(notifications: [UNNotification])
}

public protocol InAppMessageDelegate {
    func willPresentInAppMessage(controller: InAppMessageController)
    func didDismissInAppMessage(controller: InAppMessageController)
}
