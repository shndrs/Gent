//
//  MenuPresenter.swift
//  Vision45
//
//  Created by Sahand Raeisi on 8/8/20.
//  Copyright © 2020 Sahand Raeisi. All rights reserved.
//

import Foundation

protocol MenuView: ListView {
    func get()
}

final class MenuPresenter<T: MenuView>: NSObject {
    
    private weak var view: T?
    
    init(view: T?) {
        self.view = view
    }
    
}

// MARK: - Methods

extension MenuPresenter {
    
    public func getItems() {
        let items = [T.Model]()
        self.view?.set(with: items)
    }
    
}
