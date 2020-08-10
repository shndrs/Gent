//
//  Language.swift
//  Vision45
//
//  Created by Sahand Raeisi on 8/6/20.
//  Copyright © 2020 Sahand Raeisi. All rights reserved.
//

import Foundation

enum Language: String {
    
    case english = "English"
    case persian = "Persian"
    
}

// MARK: - Methods

extension Language {
    
    static func getLang(with string: String) -> Language {
        switch string {
        case Language.english.rawValue:
            return Language.english
        case Language.persian.rawValue:
            return Language.persian
        default:
            return Language.english
        }
    }
    
    static func current() -> Language {
        let database = Database()
        return getLang(with: database[DBKeys.language.rawValue] ?? "")
    }
    
}
