//
//  MenuVC.swift
//  Vision45
//
//  Created by Sahand Raeisi on 8/8/20.
//  Copyright © 2020 Sahand Raeisi. All rights reserved.
//

import UIKit

final class MenuVC: TableBaseViewController {
    
    private var items = [Menu]()
    private lazy var presenter: MenuPresenter = {
        return MenuPresenter(view: self)
    }()

    override func tableSetup() {
        super.tableSetup()
        tableView.delegate = self
        tableView.dataSource = self
        register(reuseIds: ReuseIds.menu)
    }
    
}

// MARK: - Life Cycle

extension MenuVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.getItems()
    }
    
}

// MARK: - View Implementation

extension MenuVC: MenuView {
    
    func setTableView(with array: [Menu]) {
        items = array
        tableView.asyncReload()
    }
    
}

// MARK: - TableView Implementation

extension MenuVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuTVC.reuseIdentifier) as! MenuTVC
        cell.fill(cell: items[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        items[indexPath.row].action()
    }
    
}
