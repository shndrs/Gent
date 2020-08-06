//
//  PhoneTextField.swift
//  Vision45
//
//  Created by Sahand Raeisi on 8/6/20.
//  Copyright © 2020 Sahand Raeisi. All rights reserved.
//

import UIKit

class PhoneTextField: BaseTextField {
    
    typealias ShouldChangeCharactersBlock = (PhoneTextField, String) -> ()
    
    @IBInspectable var maximumChar: Int = 255
    var shouldChangeCharactersBlock : ShouldChangeCharactersBlock?
    
    override var text: String? {
        get {
            return super.text?.englishNumbers.keepOnlyDigits(isHexadecimal: false)
        } set {
            super.text = newValue?.englishNumbers.keepOnlyDigits(isHexadecimal: false)
        }
    }

}

// MARK: - Methods

extension PhoneTextField {
    
    override func setup() {
        super.setup()
        self.keyboardType = .numberPad
        self.textAlignment = .center
        self.delegate = self
    }
    
}

// MARK: - UITextField Delegate

extension PhoneTextField: UITextFieldDelegate {
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        let text: NSString = (textField.text ?? "") as NSString
        let newString = text.replacingCharacters(in: range, with: string).englishNumbers
        let alphabetSet = NSCharacterSet.decimalDigits.inverted
        let compSepByCharInSet = string.components(separatedBy: alphabetSet)
        let numberFiltered = compSepByCharInSet.joined(separator: "")
        let str = (newString.count <= self.maximumChar) ? newString : String(newString[...newString.index(newString.startIndex, offsetBy: self.maximumChar)])
        self.shouldChangeCharactersBlock?(self,str)
        return (string == numberFiltered && newString.count <= self.maximumChar)
    }
    
}
