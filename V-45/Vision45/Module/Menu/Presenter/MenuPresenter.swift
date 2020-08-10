//
//  MenuPresenter.swift
//  Vision45
//
//  Created by Sahand Raeisi on 8/8/20.
//  Copyright © 2020 Sahand Raeisi. All rights reserved.
//

import Foundation

protocol MenuView: ListView {
    func setTableView(with array: [Menu])
}

final class MenuPresenter: NSObject {
    
    private weak var view: MenuView?
    
    init(view: MenuView?) {
        self.view = view
    }
    
}

// MARK: - Methods

extension MenuPresenter {
    
    public func getItems() {
        
    }
    
}
