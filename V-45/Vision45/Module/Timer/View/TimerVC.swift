//
//  TimerVC.swift
//  Vision45
//
//  Created by NP2 on 9/8/20.
//  Copyright © 2020 Sahand Raeisi. All rights reserved.
//

import UIKit

final class TimerVC: BaseViewController {
    
    @IBOutlet private weak var exitWithTimerLabel: LabelBold!
    @IBOutlet private weak var inputTypeTextField: PickerViewTextFiled!
    @IBOutlet private weak var connectionTimeLabel: LabelBold!
    @IBOutlet private weak var connectionTimePicker: BaseDatePicker!
    @IBOutlet private weak var disconnectTimeLabel: LabelBold!
    @IBOutlet private weak var disconnectTimePicker: BaseDatePicker!
    @IBOutlet private weak var repeatEverydayLabel: LabelBold!
    @IBOutlet private weak var repeatEverydaySwitch: BaseSwitch!
    
}

// MARK: - Life Cycle

extension TimerVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
