//
//  PhoneRegisterPresenter.swift
//  Vision45
//
//  Created by Sahand Raeisi on 8/7/20.
//  Copyright © 2020 Sahand Raeisi. All rights reserved.
//

import Foundation

protocol PhoneRegisterView: ErrorView, LoadView {
    func goToMenu()
}

final class PhoneRegisterPresenter: NSObject {
    
    private weak var view: PhoneRegisterView?
    
    init(view: PhoneRegisterView?) {
        self.view = view
    }
    
}

// MARK: - Methods

extension PhoneRegisterPresenter {
    
    public func validate(phoneNumber: String) {
        let error = phoneNumber.validate(phoneNumber: phoneNumber)
        error != nil ? view?.showError(message: error ?? "") : goToMenu()
    }
    
    private func goToMenu() {
        self.view?.startLoading()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.4) { [weak self] in
            self?.view?.stopLoading()
            self?.view?.goToMenu()
        }
    }
}
