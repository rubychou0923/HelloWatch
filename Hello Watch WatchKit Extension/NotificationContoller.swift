//
//  NotificationContoller.swift
//  Hello Watch WatchKit Extension
//
//  Created by Yi-Hsiu Chou on 2023/9/16.
//

import Foundation

import WatchKit
import SwiftUI
import UserNotifications


class NotificationController: WKUserNotificationHostingController<NotificationView> {
    var title: String?
    var message: String?


    override var body: NotificationView {
        NotificationView(
            title: title,
            message: message
        )
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    override func didReceive(_ notification: UNNotification) {


        let notificationData =
            notification.request.content.userInfo as? [String: Any]


        let aps = notificationData?["aps"] as? [String: Any]
        let alert = aps?["alert"] as? [String: Any]


        title = alert?["title"] as? String
        message = alert?["body"] as? String

    }
}
