//
//  PhoneRegisterVC.swift
//  Vision45
//
//  Created by Sahand Raeisi on 8/6/20.
//  Copyright © 2020 Sahand Raeisi. All rights reserved.
//

import UIKit
import MessageUI

final class PhoneRegisterVC: ErrorViewController {
    
    private lazy var presenter: PhoneRegisterPresenter = {
        return PhoneRegisterPresenter(view: self)
    }()
    
    @IBOutlet private weak var descriptionLabel: LabelMedium! {
        didSet {
            descriptionLabel.text = Strings.phoneRegisterDesc.value()
        }
    }
    @IBOutlet private weak var phoneNumberTextField: PhoneTextField!
    @IBOutlet private weak var submitButton: SubmitButton!
    
}

// MARK: - Methods

fileprivate extension PhoneRegisterVC {
    
    @IBAction func submitButtonPressed(_ sender: SubmitButton) {
        self.view.endEditing(true)
//        let messageVC = MFMessageComposeViewController()
//        messageVC.body = "Enter a message details here";
//        messageVC.recipients = ["09360909897"]
//        messageVC.messageComposeDelegate = self
//        self.present(messageVC, animated: true, completion: nil)
        presenter.validate(phoneNumber: phoneNumberTextField.text ?? "")
    }
    
    @IBAction func message(_ sender: UIButton) {
        let messageVC = MFMessageComposeViewController()
        messageVC.body = "Enter a message details here";
        messageVC.recipients = ["recipients_number_here"]
        messageVC.messageComposeDelegate = self
        self.present(messageVC, animated: true, completion: nil)
    }
    
}

// MARK: - Life Cycle

extension PhoneRegisterVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneNumberTextField.text = "09360909897"
        title = Strings.simNumber.value()
        descriptionLabel.fade(duration: 0.4, delay: 0.6)
        phoneNumberTextField.fade(duration: 0.4, delay: 0.0)
        submitButton.fade(duration: 0.4, delay: 0.3)
    }
    
}

// MARK: - View Implementation

extension PhoneRegisterVC: PhoneRegisterView {
    
    func startLoading() {
        HUD.default.show()
    }
    
    func stopLoading() {
        HUD.default.dismiss()
    }
    
    func goToMenu() {
        let viewController = MenuVC.instantiate(storyboard: .menu)
        self.show(viewController, sender: nil)
    }
    
}

// MARK: - MFMessageCompose ViewController Delegate

extension PhoneRegisterVC: MFMessageComposeViewControllerDelegate {
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        switch (result) {
        case .cancelled:
            print("Message was cancelled")
        case .failed:
            print("Message failed")
        case .sent:
            print("Message was sent")
        default:
            return
        }
        dismiss(animated: true, completion: nil)
    }
    
}
