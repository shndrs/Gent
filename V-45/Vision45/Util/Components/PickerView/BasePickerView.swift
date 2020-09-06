//
//  BasePickerView.swift
//  Vision45
//
//  Created by NP2 on 9/6/20.
//  Copyright © 2020 Sahand Raeisi. All rights reserved.
//

import UIKit

class BasePickerView: UIPickerView {
    
    var selectionChanged: ListSelectionBlock?
    var list = [String]() {
        didSet {
            self.reloadAllComponents()
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.config()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.config()
    }
    
    internal func config() {
        self.dataSource = self
        self.delegate = self
    }

}

// MARK: - UIPickerView DataSource

extension BasePickerView: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.list.count
    }
    
}

// MARK: - UIPickerView Delegate

extension BasePickerView: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView,
                    viewForRow row: Int,
                    forComponent component: Int,
                    reusing view: UIView?) -> UIView{
        let label = LabelBold()
        label.text = self.list[row]
        label.textColor = (row == 0) ? Colors.label : Colors.secondaryLabel
        label.font = Font.bold.return(size: 16)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        return label
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selectionChanged?(self.list[row],row)
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 60
    }
}
