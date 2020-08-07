//
//  MenuTVC.swift
//  Vision45
//
//  Created by Sahand Raeisi on 8/8/20.
//  Copyright © 2020 Sahand Raeisi. All rights reserved.
//

import UIKit

final class MenuTVC: UITableViewCell, ReusableView {
    
    @IBOutlet private weak var iconImage: UIImageView!
    @IBOutlet private weak var titleLabel: LabelMedium!

}

// MARK: - Methods

extension MenuTVC {
    
    public func fill(cell with: Menu) {
        iconImage.image = with.icon
        titleLabel.text = with.title
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
