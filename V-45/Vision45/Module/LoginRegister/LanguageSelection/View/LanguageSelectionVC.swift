//
//  LanguageSelectionVC.swift
//  Vision45
//
//  Created by Sahand Raeisi on 8/6/20.
//  Copyright © 2020 Sahand Raeisi. All rights reserved.
//

import UIKit

final class LanguageSelectionVC: BaseViewController {

    @IBOutlet private weak var persianButton: FirstInitialButton!
    @IBOutlet private weak var englishButton: FirstInitialButton!
    
}

// MARK: - Methods

fileprivate extension LanguageSelectionVC {
    
    @IBAction func persianButtonPressed(_ sender: FirstInitialButton) {
        
    }
    
    @IBAction func englishButtonPressed(_ sender: FirstInitialButton) {
        
    }
    
}


// MARK: - Life Cycle

extension LanguageSelectionVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Strings.languageSelection.value()
    }
    
}
