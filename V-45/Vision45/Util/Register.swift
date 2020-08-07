//
//  Register.swift
//  Vision45
//
//  Created by Sahand Raeisi on 8/7/20.
//  Copyright © 2020 Sahand Raeisi. All rights reserved.
//

import UIKit

final class Register: NSObject {
    
    private override init() {}
    
}

// MARK: - Methods

extension Register {
    
    /// This method register Cells in UITableView and UICollectionView
       /// - Parameters:
       ///   - component: It's a generic value (it should be UITableView/CollectionView)
       ///   - id: The name of the nib (use reuseIdentifier if you inherit from ReusableView protocol)
       /// - Note: Component should be sub class of UITableView or UICollectionView
       ///         otherwise it will break IN YOUR FACE!!! :D
    @_specialize(where T == (UITableView, UICollectionView))
    public static func `in`<T>(component: T, id: String) {
        
        let nib = UINib(nibName: id, bundle: nil)
        
        switch component {
            
        case is UITableView:
            guard let cell = component as? UITableView else { return }
            cell.register(nib, forCellReuseIdentifier: id)
        case is UICollectionView:
            guard let cell = component as? UICollectionView else { return }
            cell.register(nib, forCellWithReuseIdentifier: id)
        default:
            break;
        }
    }
    
}

