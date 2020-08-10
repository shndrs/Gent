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
    case phoneRegisterDesc
    case simNumber
    
    // MARK: - Menu
    
    case lock
    case unlock
    case connectDisconnect1
    case connectDisconnect2
    case instantOutput1
    case instantOutput2
    case timer
    case menu
    
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
        case .phoneRegisterDesc:
            return "Please enter the SIM card number inside VISION 45"
        case .simNumber:
            return "SIM Card Number"
        case .lock:
            return "Lock"
        case .unlock:
            return "Unlock"
        case .connectDisconnect1:
            return "Connect Disconnect 1"
        case .connectDisconnect2:
            return "Connect Disconnect 2"
        case .timer:
            return "Timer"
        case .instantOutput1:
            return "Instant Output 1"
        case .instantOutput2:
            return "Instant Output 2"
        case .menu:
            return "Menu"
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
        case .phoneRegisterDesc:
            return "لطفا شماره سیم کارت داخل VISION 45 را وارد نمایید."
        case .simNumber:
            return "شماره سیم کارت"
        case .lock:
            return "قفل کردن"
        case .unlock:
            return "باز کردن قفل"
        case .connectDisconnect1:
            return "قطع و وصل ۱"
        case .connectDisconnect2:
            return "قطع و وصل ۲"
        case .timer:
            return "تایمر"
        case .instantOutput1:
            return "خروجی لحظه ای ۱"
        case .instantOutput2:
            return "خروجی لحظه ای ۲"
        case .menu:
            return "منو"
        }
    }
    
}
