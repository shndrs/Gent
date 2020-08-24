//
//  Colors.swift
//  WTFUserInterface
//
//  Created by shndrs on 12/30/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

struct Colors {
    
    public static let darkGray = UIColor(red: 85.0/255.0,
                                         green: 85.0/255.0,
                                         blue: 85.0/255.0,
                                         alpha: 1.0)
    
    public static let defOrange = UIColor.orange
    public static let lightGray = UIColor(red: 211/255,
                                          green: 211/255,
                                          blue: 211/255,
                                          alpha: 1.0)
    public static let submitGreen = UIColor(red: 10/255,
                                            green: 148/255,
                                            blue: 84/255,
                                            alpha: 1.0)
    public static let clear = UIColor.clear
    public static let label = UIColor.label
    public static let secondaryLabel = UIColor.secondaryLabel
    public static let tertiaryLabel = UIColor.tertiaryLabel
    public static let primaryBack = UIColor.systemBackground
    public static let secondaryBack = UIColor.secondarySystemBackground
    public static let tertiaryBack = UIColor.tertiarySystemBackground
    public static let error = #colorLiteral(red: 1, green: 0.03600227677, blue: 0.2423752917, alpha: 1).withAlphaComponent(0.9)
}
