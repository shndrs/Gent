//
//  BaseNavigationController.swift
//  Vision45
//
//  Created by Sahand Raeisi on 8/6/20.
//  Copyright © 2020 Sahand Raeisi. All rights reserved.
//

import UIKit

final class BaseNavigationController: UINavigationController {}

// MARK: - Life Cycle

extension BaseNavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup(for: self.navigationBar)
    }
    
}

// MARK: - Methods

fileprivate extension BaseNavigationController {
    
    func setup(for navigationBar: UINavigationBar) {
        
        navigationBar.titleTextAttributes = [NSAttributedString.Key.font: Font.regular.return(size: 16),
                                             NSAttributedString.Key.foregroundColor: Colors.label]
        UIBarButtonItem.appearance()
            .setTitleTextAttributes([NSAttributedString.Key.font: Font.bold.return(size: 12),
                                    NSAttributedString.Key.foregroundColor: Colors.label],
                                    for: .normal)
    }
    
}

