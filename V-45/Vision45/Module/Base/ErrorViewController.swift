//
//  ErrorViewController.swift
//  Vision45
//
//  Created by Sahand Raeisi on 8/7/20.
//  Copyright © 2020 Sahand Raeisi. All rights reserved.
//

import UIKit
import Toast_Swift

class ErrorViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension ErrorViewController: ErrorView {
    
    func showError(message: String) {
        show(error: message)
    }
    
}

