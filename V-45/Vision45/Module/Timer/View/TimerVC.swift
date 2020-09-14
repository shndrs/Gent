//
//  TimerVC.swift
//  Vision45
//
//  Created by NP2 on 9/8/20.
//  Copyright © 2020 Sahand Raeisi. All rights reserved.
//

import UIKit

final class TimerVC: BaseViewController {
    
    @IBOutlet private weak var timedExitLabel: LabelBold!
    @IBOutlet private weak var inputTypeTextField: PickerViewTextFiled!
    @IBOutlet private weak var connectionTimeLabel: LabelBold!
    @IBOutlet private weak var connectionTimePicker: BaseDatePicker!
    @IBOutlet private weak var disconnectTimeLabel: LabelBold!
    @IBOutlet private weak var disconnectTimePicker: BaseDatePicker!
    @IBOutlet private weak var repeatEverydayLabel: LabelBold!
    @IBOutlet private weak var repeatEverydaySwitch: BaseSwitch!
    @IBOutlet private weak var setButton: SetButton!
    @IBOutlet private weak var cancelButton: CancelButton!
    
}

// MARK: - Methods

fileprivate extension TimerVC {
    
    func setup() {
        title = Strings.timer.value()
        inputTypeTextField.placeholder = Strings.select.value()
        timedExitLabel.text = Strings.timedExit.value()
        connectionTimeLabel.text = Strings.connectionTime.value()
        disconnectTimeLabel.text = Strings.disconnectTime.value()
        repeatEverydayLabel.text = Strings.repeatEveryday.value()
    }
    
    @IBAction func cancelButtonPressed(_ sender: CancelButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func setButtonPressed(_ sender: SetButton) {
        
    }
    
}

// MARK: - Life Cycle

extension TimerVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
}
