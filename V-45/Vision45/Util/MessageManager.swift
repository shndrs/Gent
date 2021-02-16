//
//  MessageManager.swift
//  Vision45
//
//  Created by Sahand Raeisi on 10/23/20.
//  Copyright © 2020 Sahand Raeisi. All rights reserved.
//

import Foundation
import MessageUI

final class MessageManager: NSObject {
    
    private var body: String!
    private var recipients: [String]!
    
    private lazy var messageVC: MFMessageComposeViewController = {
        let messageVC = MFMessageComposeViewController()
        messageVC.body = body
        messageVC.recipients = recipients
        messageVC.messageComposeDelegate = self
        return messageVC
    }()
    
    public init(body: String, recipients: [String]) {
        self.body = body
        self.recipients = recipients
    }
    
}

// MARK: - MFMessageCompose ViewController Delegate

extension MessageManager: MFMessageComposeViewControllerDelegate {
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        switch (result) {
        case .cancelled:
            print(result.rawValue)
        case .failed:
            print(result.rawValue)
        case .sent:
            print(result.rawValue)
        default:
            return
        }
//        dismiss(animated: true, completion: nil)11
    }
}
