//
//  NotificationManager.swift
//  Vision45
//
//  Created by NP2 on 9/14/20.
//  Copyright © 2020 Sahand Raeisi. All rights reserved.
//

import Foundation
import UserNotifications

final class NotificationManager: NSObject, UNUserNotificationCenterDelegate {
    
    static let shared = NotificationManager()
    
    private override init() {}
    
    private lazy var center: UNUserNotificationCenter = {
        let temp = UNUserNotificationCenter.current()
        return temp
    }()
    
}

// MARK: - Methods

extension NotificationManager {
    
    internal func requestAuthorization() {
        center.requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in }
        center.delegate = self
    }
    
    internal func sendLocalPush(in dateTime: Date, title: String, body: String, onCompelete: (() -> Void)?) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = UNNotificationSound.default
        let dateComponents = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second], from: dateTime)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        /// - Note: Using dateTime description as request identifier
        
        let request = UNNotificationRequest(identifier: dateTime.description , content: content, trigger: trigger)
        center.add(request) { (error) in
            guard let errorValue = error else { return }
            print(errorValue)
        }
        onCompelete?()
    }
    
    internal func deleteLocalNotification(with identifier: String, onCompelete:(()->Void)?) {
        center.removeDeliveredNotifications(withIdentifiers: [identifier])
        onCompelete?()
    }
    
    internal func clearDeliveredNotifications() {
        center.removeAllDeliveredNotifications()
    }
    
}
