//
//  Menu.swift
//  Vision45
//
//  Created by Sahand Raeisi on 8/7/20.
//  Copyright © 2020 Sahand Raeisi. All rights reserved.
//

import UIKit

final class Menu: NSObject {
    
    private(set) var icon: UIImage!
    private(set) var title: String!
    private(set) var action: Action!
    
    init(icon: UIImage, title: String, action: @escaping Action) {
        self.icon = icon
        self.title = title
        self.action = action
    }
    
}

