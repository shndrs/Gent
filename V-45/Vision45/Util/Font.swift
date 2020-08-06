//
//  Font.swift
//  Vision45
//
//  Created by Sahand Raeisi on 6/30/20.
//  Copyright © 2020 Sahand Raeisi. All rights reserved.
//

import UIKit

enum Font: String {
    
    case bold
    case medium
    case regular
    case light
    
}

// MARK: - Methods

extension Font {
    
    func `return`(size: CGFloat) -> UIFont {
        
        switch self {
        
        case .bold:
            return self.bold(size: size)
        case .medium:
            return self.medium(size: size)
        case .regular:
            return self.regular(size: size)
        case .light:
            return self.light(size: size)
        }
    }
    
    private func bold(size: CGFloat) -> UIFont {
        switch getLang() {
            
        case .english:
            return UIFont(name: "AvenirNext-Bold", size: size)!
        case .persian:
            return UIFont(name: "IRANSansMonoSpacedNum-Bold", size: size)!
        }
    }
    
    private func medium(size: CGFloat) -> UIFont {
        switch getLang() {
            
        case .english:
            return UIFont(name: "AvenirNext-Medium", size: size)!
        case .persian:
            return UIFont(name: "IRANSansMonoSpacedNum", size: size)!
        }
    }
    
    private func regular(size: CGFloat) -> UIFont {
        switch getLang() {
            
        case .english:
            return UIFont(name: "AvenirNext-Regular", size: size)!
        case .persian:
            return UIFont(name: "IRANSansMonoSpacedNum", size: size)!
        }
    }
    
    private func light(size: CGFloat) -> UIFont {
        switch getLang() {
            
        case .english:
            return UIFont(name: "AvenirNext-UltraLight", size: size)!
        case .persian:
            return UIFont(name: "IRANSansMonoSpacedNum-Light", size: size)!
        }
    }
    
    private func getLang() -> Language {
        let database = Database()
        let langString = database[DBKeys.language.rawValue]
        return Language.getLang(with: langString ?? "")
    }
    
}
