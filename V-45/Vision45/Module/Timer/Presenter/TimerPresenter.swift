//
//  TimerPresenter.swift
//  Vision45
//
//  Created by NP2 on 9/14/20.
//  Copyright © 2020 Sahand Raeisi. All rights reserved.
//

import Foundation

protocol TimerView: BaseView {
    func setPickerView(with array: [String])
}

final class TimerPresenter: NSObject {
    
    private weak var view: TimerView?
    
    public init(view: TimerView?) {
        self.view = view
    }
    
}

// MARK: - Methods

extension TimerPresenter {
    
    func pickerViewItems() {
        let array = [
            Strings.connectDisconnect1.value(), Strings.connectDisconnect2.value(),
            Strings.instantOutput1.value(), Strings.instantOutput2.value()
        ]
        DispatchQueue.main.async { [weak self] in
            self?.view?.setPickerView(with: array)
        }
    }
    
}
