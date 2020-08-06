//
//  Strings.swift
//  WTFUserInterface
//
//  Created by shndrs on 10/12/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import Foundation

enum Ids: String {
    
    case menuTVC = "MenuTVC"
    case bannerTVC = "BannerTVC"
    case customHeader = "CustomHeader"
}

enum Strings: String {
    
    // MARK: - Common
    
    case done
    
    // MARK: - Components
    
    case submit
    case wait
    
    // MARK: - LoginRegister
    
    case languagesName
    
    func getLang() -> Language {
        let database = Database()
        let langString = database[DBKeys.language.rawValue]
        return Language.getLang(with: langString ?? "")
    }
    
}

// MARK: - Methods

extension Strings {
    
    func value() -> String {
        let database = Database()
        let langString = database[DBKeys.language.rawValue]
        let lang = Language.getLang(with: langString ?? "")
        
        switch lang {
        case .english:
            return english()
        case .persian:
            return persian()
        }
    }
    
    private func english() -> String {
        switch self {
        case .languagesName:
            return "English"
        case .done:
            return "Done"
        case .submit:
            return "Submit"
        case .wait:
            return "Please Wait..."
        }
    }
    
    private func persian() -> String {
        switch self {
        case .languagesName:
            return "فارسی"
        case .done:
            return "باشه"
        case .submit:
            return "ارسال"
        case .wait:
            return "لطفا صبر کنید..."
        }
    }
    
}
