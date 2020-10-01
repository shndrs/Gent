//
//  CellAnimator.swift
//  Vision45
//
//  Created by NP2 on 8/25/20.
//  Copyright © 2020 Sahand Raeisi. All rights reserved.
//

import UIKit

final class CellAnimator: NSObject {
    
    private var cell: UITableViewCell?
    
    init(cell: UITableViewCell) {
        self.cell = cell
    }
    
}

// MARK: - Methods

extension CellAnimator {
    
    public func fadeAnimation() {
        cell?.alpha = 0
        UIView.animate(withDuration: 0.2) { [weak self] in
            self?.cell?.alpha = 1
        }
    }
    
    public func zoomIn() {
        cell?.alpha = 0
        cell?.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        UIView.animate(withDuration: 1.3, delay: 0,
                       options: .curveEaseIn, animations: { [weak self] in
            self?.cell?.transform = CGAffineTransform.identity
            self?.cell?.alpha = 1
        })
    }
    
    public func sweepIn() {
        cell?.transform = CGAffineTransform(translationX: 0, y: -UIScreen.main.bounds.height)
        UIView.animate(withDuration: 0.9, delay: 0,
                       options: .curveEaseInOut, animations: { [weak self] in
            self?.cell?.transform = .identity
        })
    }
    
}
