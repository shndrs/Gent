//
//  NotificationViewController.swift
//  BillNotificationView
//
//  Created by shndrs on 6/26/21.
//

import UIKit
import UserNotifications
import UserNotificationsUI

final class NotificationViewController: UIViewController, UNNotificationContentExtension {

    @IBOutlet private var lblTitle: UILabel?
    @IBOutlet private var lblContent: UILabel?
    @IBOutlet private var imgBill: UIImageView? {
        didSet {
            imgBill?.image = #imageLiteral(resourceName: "credit-card-suggest")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func didReceive(_ notification: UNNotification) {
        self.lblContent?.text = notification.request.content.body
        self.lblTitle?.text = notification.request.content.title
    }

}
