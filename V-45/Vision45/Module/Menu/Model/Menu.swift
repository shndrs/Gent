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
    private(set) var desc: String = "GitHub, Inc. is an American multinational corporation that provides hosting for software development and version control using Git."
    private(set) var action: Action!
    public var animatedOnce = false
    
    init(icon: UIImage, title: String, action: @escaping Action) {
        self.icon = icon
        self.title = title
        self.action = action
    }
    
}
