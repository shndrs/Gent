//
//  LanguageSelectionVC.swift
//  Vision45
//
//  Created by Sahand Raeisi on 8/6/20.
//  Copyright © 2020 Sahand Raeisi. All rights reserved.
//

import UIKit

final class LanguageSelectionVC: BaseViewController {
    
    private lazy var presenter: LanguageSelectionPresenter = {
        return LanguageSelectionPresenter(view: self)
    }()

    @IBOutlet private weak var persianButton: FirstInitialButton!
    @IBOutlet private weak var englishButton: FirstInitialButton!
    
}

// MARK: - Methods

fileprivate extension LanguageSelectionVC {
    
    @IBAction func persianButtonPressed(_ sender: FirstInitialButton) {
        presenter.setPersian()
    }
    
    @IBAction func englishButtonPressed(_ sender: FirstInitialButton) {
        presenter.setEnglish()
    }
    
}

// MARK: - Life Cycle

extension LanguageSelectionVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Strings.languageSelection.value()
    }
    
}

// MARK: View Implementation

extension LanguageSelectionVC: LanguageSelectionView {
    
    func goEnglish() {
        
    }
    
    func goPersian() {
        
    }
    
}
