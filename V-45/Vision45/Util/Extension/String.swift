//
//  String.swift
//  Vision45
//
//  Created by Sahand Raeisi on 8/6/20.
//  Copyright © 2020 Sahand Raeisi. All rights reserved.
//

import Foundation

extension String {
    
    var englishNumbers: String {
        var copy = self
        let persianFormatter = NumberFormatter()
        persianFormatter.locale = Locale(identifier: "fa")
        let arabicFormatter = NumberFormatter()
        arabicFormatter.locale = Locale(identifier: "ar")
        for index in 0..<10 {
            let number : NSNumber = NSNumber(value : index)
            copy = copy.replacingOccurrences(of: persianFormatter.string(from: number)!,
                                             with: number.stringValue)
            copy = copy.replacingOccurrences(of: arabicFormatter.string(from: number)!,
                                             with: number.stringValue )
        }
        return copy
    }
    
    var isPersian: Bool {
        let persianLocale = Locale(identifier: "fa")
        let arabicLocale = Locale(identifier: "ar")
        if let set = persianLocale.exemplarCharacterSet?
            .union(arabicLocale.exemplarCharacterSet!)
            .union(CharacterSet.whitespacesAndNewlines)
            .union(CharacterSet.punctuationCharacters)
            .union(CharacterSet.decimalDigits) {
            return set.isSuperset(of: CharacterSet(charactersIn: self))
        }
        return false
    }
    
}
