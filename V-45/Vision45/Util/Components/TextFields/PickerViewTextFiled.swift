//
//  PickerViewTextFiled.swift
//  Vision45
//
//  Created by NP2 on 9/6/20.
//  Copyright © 2020 Sahand Raeisi. All rights reserved.
//

import UIKit

final class PickerViewTextFiled: BaseTextField {
    
    public typealias TextFiledItemHandler = (_ item: String,_ index: Int) -> Void
    var itemSelectionHandler: TextFiledItemHandler?
    
    var selectedIndex: Int? {
        didSet {
            guard items.count > 0, selectedIndex! < items.count else { return }
            self.pickerView.selectRow(selectedIndex!, inComponent: 0, animated: false)
            self.text = items[selectedIndex!]
            self.itemSelectionHandler?(self.text ?? "" ,selectedIndex!)
        }
    }
    var items: [String]! = [] {
        didSet {
            self.pickerView.list = items
        }
    }
    
    private lazy var pickerView: BasePickerView = {
        let tmp = BasePickerView()
        return tmp
    }()
    
    override func setup() {
        super.setup()
        self.inputView = self.pickerView
        self.delegate = self
        self.undoManager?.removeAllActions()
        pickerView.selectionChanged = {
            value,idx in
            self.text = value
            if self.itemSelectionHandler != nil {
                self.itemSelectionHandler!(value,idx)
            }
        }
    }

}

// MARK: - UITextField Delegate

extension PickerViewTextFiled : UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let currentIndex = self.pickerView.selectedRow(inComponent: 0)
        let idx = (currentIndex == -1) ? 0 : currentIndex
        let value = self.pickerView.list[idx]
        self.text = value
        self.itemSelectionHandler?(value,idx)
    }
    
}
