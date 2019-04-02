//
//  MyLocalNotification.swift
//  LocalNotification
//
//  Created by Ha, Quang on 2019/03/12.
//  Copyright © 2019 Rakuten Asia Pte. Ltd. All rights reserved.
//

import Foundation
import UserNotifications
import UIKit
import SafariServices

struct LocalNotificationManager {
    
    init() {
        
        if #available(iOS 10.0, *) {
            
        } else {
            // Fallback on earlier versions
        }
    }
    
    func makeNotification() {
        if #available(iOS 10.0, *) {
            
            let content = UNMutableNotificationContent()
            content.title = "Don't forget"
            content.body = "Buy some milk"
            content.categoryIdentifier = "MEETING_INVITATION"
            content.sound = UNNotificationSound.default
            // Define the custom actions.
            let acceptAction = UNNotificationAction(identifier: "ACCEPT_ACTION",
                                                    title: "Accept",
                                                    options: .foreground)
            let declineAction = UNNotificationAction(identifier: "DECLINE_ACTION",
                                                     title: "Decline",
                                                     options: UNNotificationActionOptions(rawValue: 0))
            // Define the notification type
            if #available(iOS 11.0, *) {
                let meetingInviteCategory =
                    UNNotificationCategory(identifier: "MEETING_INVITATION",
                                           actions: [acceptAction, declineAction],
                                           intentIdentifiers: [],
                                           hiddenPreviewsBodyPlaceholder: "",
                                           options: .customDismissAction)
                // Register the notification type.
                let notificationCenter = UNUserNotificationCenter.current()
                notificationCenter.setNotificationCategories([meetingInviteCategory])
            } else {
                // Fallback on earlier versions
            }
            
            // Swift
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10,
                                                            repeats: false)
            // Swift
            let identifier = "UYLLocalNotification"
            let request = UNNotificationRequest(identifier: identifier,
                                                content: content, trigger: trigger)
            
            let center = UNUserNotificationCenter.current()
            //.delegate = LocalNotificationDelegater.init()
            
            
            center.add(request, withCompletionHandler: { (error) in
                if let error = error {
                    // Something went wrong
                    print("Error scheduling \(error)")
                }
            })
            center.getPendingNotificationRequests(completionHandler: {requests in
                print("pending \(requests)")
            })
            center.getDeliveredNotifications(completionHandler: {notifications in
                print("delivered \(notifications)")
            })
        } else {
            
        }
    }
    
    func requestPermission() {
        if #available(iOS 10.0, *) {
            let center = UNUserNotificationCenter.current()
            let snoozeAction = UNNotificationAction(identifier: "Snooze",
                                                    title: "Snooze", options: [])
            let deleteAction = UNNotificationAction(identifier: "DeleteAction",
                                                    title: "Delete", options: [.destructive])
            
            let category = UNNotificationCategory(identifier: "UYLReminderCategory",
                                                  actions: [snoozeAction,deleteAction],
                                                  intentIdentifiers: [], options: [])
            center.setNotificationCategories([category])
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
            let center = UNUserNotificationCenter.current()
            center.getPendingNotificationRequests(completionHandler: {requests in
                print("pending after delete \(requests)")
            })
            center.getDeliveredNotifications(completionHandler: {notifications in
                print("delivered after delete \(notifications)")
            })
        } else {
            
        }
    }
    
    func makeAppNotifications() {
        if #available(iOS 10.0, *) {
            let content = UNMutableNotificationContent()
            content.title = "Weekly Staff Meeting"
            content.body = "Every Tuesday at 2pm"
            content.categoryIdentifier = "MEETING_INVITATION"
            if let sonicFileURL = Bundle.main.url(forResource: "sonic", withExtension: "jpg") {
                do {
                    content.attachments = try [UNNotificationAttachment.init(identifier: "sonic", url: sonicFileURL, options: nil)]
                }
                catch {}
            }
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 12,
                                                            repeats: false)
            // Create the request
            let uuidString = UUID().uuidString
            let request = UNNotificationRequest(identifier: uuidString,
                                                content: content, trigger: trigger)
            
            // Schedule the request with the system.
            let notificationCenter = UNUserNotificationCenter.current()
            notificationCenter.add(request) { (error) in
                if error != nil {
                    // Handle any errors.
                }
            }
        }
    }
    @available(iOS 10.0, *)
    func handle(notification: UNNotification, actionIdentifier: String) {
        if notification.request.identifier == "UYLLocalNotification" && actionIdentifier == "ACCEPT_ACTION" {
            let s = SFSafariViewController.init(url: URL.init(string: "https://www.google.com")!)
            if var topViewController: UIViewController = UIApplication.shared.keyWindow?.rootViewController {
                while let presentedViewController = topViewController.presentedViewController {
                    topViewController = presentedViewController
                }
                topViewController.present(s, animated: true, completion: nil)
            }
        }
    }
}
