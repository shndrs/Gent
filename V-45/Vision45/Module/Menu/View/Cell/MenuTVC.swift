//
//  MenuTVC.swift
//  Vision45
//
//  Created by Sahand Raeisi on 8/8/20.
//  Copyright © 2020 Sahand Raeisi. All rights reserved.
//

import UIKit

class MenuTVC: UITableViewCell {
    
    @IBOutlet private weak var iconImage: UIImageView! {
        didSet {
            iconImage.addCornerRadius(radius: iconImage.bounds.width/2)
        }
    }
    @IBOutlet private weak var titleLabel: LabelMedium!

}

// MARK: - Methods

extension MenuTVC {
    
    public func fill(cell with: Menu?) {
        guard let object = with else { return }
        iconImage.image = object.icon
//        titleLabel.text = object.title
    }
    
}

// MARK: - Life Cycle

extension MenuTVC {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
