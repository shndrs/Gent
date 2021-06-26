//
//  NotificationViewController.swift
//  BillNotificationView
//
//  Created by shndrs on 6/26/21.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {

    @IBOutlet private var lblTitle: UILabel!
    @IBOutlet private var lblContent: UILabel!
    @IBOutlet private var imgBill: UIImageView! {
        didSet {
            imgBill.image = #imageLiteral(resourceName: "credit-card-suggest")
        }
    }
    @IBOutlet var label: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any required interface initialization here.
    }
    
    func didReceive(_ notification: UNNotification) {
        self.label?.text = notification.request.content.body
    }

}
