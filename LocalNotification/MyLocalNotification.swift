//
//  MyLocalNotification.swift
//  LocalNotification
//
//  Created by Ha, Quang on 2019/03/12.
//  Copyright © 2019 Rakuten Asia Pte. Ltd. All rights reserved.
//

import Foundation
import UserNotifications

struct LocalNotificationManager {
    
    func makeNotification() {
        if #available(iOS 10.0, *) {
            let snoozeAction = UNNotificationAction(identifier: "Snooze",
                                                    title: "Snooze", options: [])
            let deleteAction = UNNotificationAction(identifier: "DeleteAction",
                                                    title: "Delete", options: [.destructive])
            let content = UNMutableNotificationContent()
            content.title = "Don't forget"
            content.body = "Buy some milk"
            content.sound = UNNotificationSound.default
            // Swift
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5,
                                                            repeats: false)
            // Swift
            let identifier = "UYLLocalNotification"
            let request = UNNotificationRequest(identifier: identifier,
                                                content: content, trigger: trigger)
            let category = UNNotificationCategory(identifier: "UYLReminderCategory",
                                                  actions: [snoozeAction,deleteAction],
                                                  intentIdentifiers: [], options: [])
            let center = UNUserNotificationCenter.current()
            center.setNotificationCategories([category])
            content.categoryIdentifier = "UYLReminderCategory"
            
            center.add(request, withCompletionHandler: { (error) in
                if let error = error {
                    // Something went wrong
                    print("Error scheduling \(error)")
                }
            })
            center.getPendingNotificationRequests(completionHandler: {requests in
                print(requests)
            })
        } else {
            
        }
    }
    
    func requestPermission() {
        if #available(iOS 10.0, *) {
            let center = UNUserNotificationCenter.current()
            
            center.requestAuthorization(options: [.alert,.sound,.badge], completionHandler: {(granted, error) in
                print("granted error \(granted), \(String(describing: error))")
                center.getNotificationSettings { settings in
                    print(settings)
                }
            })
        } else {
            
        }
    }
    
    
    func removeAllNotifications() {
        if #available(iOS 10.0, *) {
            let identifiers = ["UYLLocalNotification"]
            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: identifiers)
            UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: identifiers)
        } else {
            
        }
    }
}
