//
//  TableBaseViewController.swift
//  Vision45
//
//  Created by Sahand Raeisi on 8/7/20.
//  Copyright © 2020 Sahand Raeisi. All rights reserved.
//

import UIKit

class TableBaseViewController<T>: UIViewController {
    
    private(set) var items: [T]?
    
    var largeTitle: Bool = false {
        willSet(newVal) {
            navigationController?.navigationBar.prefersLargeTitles = newVal
        }
    }
    
    @IBOutlet internal weak var tableView: UITableView! {
        didSet {
            tableSetup()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func tableSetup() {
        tableView.cleanFooterView()
    }
    
    func register(reuseIds: Array<String>) {
        for id in reuseIds {
            Register.in(component: tableView, id: id)
        }
    }
    
}

// MARK: - View Implementation

extension TableBaseViewController: ListView {
    
    typealias Model = T
    
    func set(with array: [T]) {
        items = array
        tableView.asyncReload()
    }
    
}
