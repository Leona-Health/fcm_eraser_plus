//
//  NotificationService 2.swift
//  Pods
//
//  Created by Ngô Trần Anh Phôn on 21/2/25.
//


class NotificationService : NotificationInterface{
    func cancelAllNotifications() {
           UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
       }
}
