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
    
    private lazy var settingButton: UIBarButtonItem = {
        return UIBarButtonItem(image: Images.setting,
                               style: .plain,
                               target: self,
                               action: #selector(settingButtonAction))
    }()

    override func tableSetup() {
        super.tableSetup()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 55
        register(reuseIds: ReuseIds.menu)
    }
    
}

// MARK: - Class Methods

fileprivate extension MenuVC {
    
    @objc func settingButtonAction() {
        
    }
    
}

// MARK: - Life Cycle

extension MenuVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Strings.menu.value()
        self.navigationItem.setRightBarButton(settingButton, animated: true)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        self.navigationItem.setHidesBackButton(true, animated: self.isBeingPresented)
        presenter.getItems()
    }
    
}

// MARK: - View Implementation

extension MenuVC: MenuView {
    
    func setTableView(with array: [Menu]) {
        items = array
        tableView.reloadData()
    }
    
    func lockTapped() {
        
    }
    
    func unlockTapped() {
        
    }
    
    func connectDisconnect1Tapped() {
        
    }
    
    func connectDisconnect2Tapped() {
        
    }
    
    func instantOutput1Tapped() {
        
    }
    
    func instantOutput2Tapped() {
        
    }
    
    func timerTapped() {
        let viewController = TimerVC.instantiate(storyboard: .timer)
        self.show(viewController, sender: self)
    }
    
}

// MARK: - TableView Implementation

extension MenuVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch Language.current() {   
        case .english:
            let cell = tableView.dequeueReusableCell(withIdentifier: MenuTVCLeft.reuseIdentifier) as! MenuTVCLeft
            cell.fill(cell: items[indexPath.row])
            return cell
        case .persian:
            let cell = tableView.dequeueReusableCell(withIdentifier: MenuTVCRight.reuseIdentifier) as! MenuTVCRight
            cell.fill(cell: items[indexPath.row])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        items[indexPath.row].action()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if !items[indexPath.row].animatedOnce {
            items[indexPath.row].animatedOnce = true
            CellAnimator(cell: cell).sweepIn()
        }
    }
    
}
