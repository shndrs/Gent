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
    
    case appName
    case done
    case error
    
    // MARK: - Components
    
    case submit
    case wait
    
    // MARK: - LoginRegister
    
    case languagesName
    case languageSelection
    case phoneNumberIsEmpty
    case phoneNumberIsInvalid
    
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
        case .languageSelection:
            return "Language Selection"
        case .appName:
            return "Vision 45"
        case .phoneNumberIsEmpty:
            return "Phone number is empty."
        case .phoneNumberIsInvalid:
            return "Phone number is invalid."
        case .error:
            return "Error!"
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
        case .languageSelection:
            return "انتخاب زبان"
        case .appName:
            return "Vision 45"
        case .phoneNumberIsEmpty:
            return "فیلد شماره موبایل خالی می باشد."
        case .phoneNumberIsInvalid:
            return "فیلد شماره موبایل معتبر نمی باشد."
        case .error:
            return "خطا"
        }
    }
    
}
