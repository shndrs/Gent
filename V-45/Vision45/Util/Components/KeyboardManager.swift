//
//  KeyboardManager.swift
//  WTFUserInterface
//
//  Created by shndrs on 5/18/20.
//  Copyright © 2020 shndrs. All rights reserved.
//

import IQKeyboardManager

struct KeyboardManager {
    
    public static func applyConfig() {
        let keyboardManager = IQKeyboardManager.shared()
        keyboardManager.isEnabled = true
        keyboardManager.toolbarTintColor = Colors.lightGray
        keyboardManager.toolbarBarTintColor = Colors.darkGray
        keyboardManager.toolbarDoneBarButtonItemText = Strings.done.rawValue
        keyboardManager.isEnableAutoToolbar = true
    }
}
