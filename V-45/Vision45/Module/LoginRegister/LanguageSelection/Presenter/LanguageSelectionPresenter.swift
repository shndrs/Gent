//
//  LanguageSelectionPresenter.swift
//  Vision45
//
//  Created by Sahand Raeisi on 8/6/20.
//  Copyright © 2020 Sahand Raeisi. All rights reserved.
//

import Foundation

protocol LanguageSelectionView: AnyObject {
    func goToRegisterPhone()
}

final class LanguageSelectionPresenter: NSObject {
    
    private weak var view: LanguageSelectionView?
    private lazy var database: Database = {
        return Database()
    }()
    
    init(view: LanguageSelectionView?) {
        self.view = view
    }
    
}

// MARK: - Methods

extension LanguageSelectionPresenter {
    
    public func setEnglish() {
        database[DBKeys.language.rawValue] = Language.english.rawValue
        view?.goToRegisterPhone()
    }
    
    public func setPersian() {
        database[DBKeys.language.rawValue] = Language.persian.rawValue
        view?.goToRegisterPhone()
    }
    
}
