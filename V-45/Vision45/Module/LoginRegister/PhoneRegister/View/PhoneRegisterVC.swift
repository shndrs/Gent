//
//  PhoneRegisterVC.swift
//  Vision45
//
//  Created by Sahand Raeisi on 8/6/20.
//  Copyright © 2020 Sahand Raeisi. All rights reserved.
//

import UIKit

final class PhoneRegisterVC: BaseViewController {
    
    @IBOutlet private weak var descriptionLabel: LabelMedium!
    @IBOutlet private weak var phoneNumberTextField: UITextField!
    @IBOutlet private weak var submitButton: SubmitButton!
    
}

// MARK: - Methods

fileprivate extension PhoneRegisterVC {
    
    @IBAction func submitButtonPressed(_ sender: SubmitButton) {
        
    }
    
}

// MARK: - Life Cycle

extension PhoneRegisterVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
