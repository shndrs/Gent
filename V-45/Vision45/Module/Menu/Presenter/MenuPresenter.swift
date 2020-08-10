//
//  MenuPresenter.swift
//  Vision45
//
//  Created by Sahand Raeisi on 8/8/20.
//  Copyright © 2020 Sahand Raeisi. All rights reserved.
//

import UIKit

protocol MenuView: ListView {
    func setTableView(with array: [Menu])
    func lockTapped()
    func unlockTapped()
    func connectDisconnect1Tapped()
    func connectDisconnect2Tapped()
    func instantOutput1Tapped()
    func instantOutput2Tapped()
    func timerTapped()
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
        self.view?.setTableView(with: setItems())
    }
    
    private func setItems() -> [Menu] {
        
        let lock = Menu(icon: UIImage(named: "")!, title: Strings.lock.value()) {
            self.view?.lockTapped()
        }
        let unlock = Menu(icon: UIImage(named: "")!, title: Strings.unlock.value()) {
            self.view?.unlockTapped()
        }
        let connectDisconnect1 = Menu(icon: UIImage(named: "")!, title: Strings.connectDisconnect1.value()) {
            self.view?.connectDisconnect1Tapped()
        }
        let connectDisconnect2 = Menu(icon: UIImage(named: "")!, title: Strings.connectDisconnect2.value()) {
            self.view?.connectDisconnect2Tapped()
        }
        let instantOutput1 = Menu(icon: UIImage(named: "")!, title: Strings.instantOutput1.value()) {
            self.view?.instantOutput1Tapped()
        }
        let instantOutput2 = Menu(icon: UIImage(named: "")!, title: Strings.instantOutput2.value()) {
            self.view?.instantOutput2Tapped()
        }
        let timer = Menu(icon: UIImage(named: "")!, title: Strings.timer.value()) {
            self.view?.timerTapped()
        }
        return [lock, unlock, connectDisconnect1, connectDisconnect2,
                instantOutput1, instantOutput2, timer]
    }
    
}
