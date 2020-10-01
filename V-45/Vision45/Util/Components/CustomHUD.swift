//
//  CustomHUD.swift
//  WTFUserInterface
//
//  Created by shndrs on 12/30/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import EZProgressHUD

struct HUD {
    
    public static var `default` = HUD()
    private init() {}
    
    private lazy var hud: EZProgress = {
        let options = EZProgressOptions()
        options.radius = 120
        options.secondLayerStrokeColor = Colors.yellow
        options.strokeWidth = 13
        options.thirdLayerStrokeColor = Colors.yellow
        options.firstLayerStrokeColor = .black
        options.animationOption = .lineLayer
        options.title = Strings.wait.value()
        options.font = Font.regular.return(size: 17)
        let hud = EZProgressHUD.setProgress(with: options)
        return hud
    }()
    
}

// MARK: - Methods

extension HUD {
    
    public mutating func show() {
        hud.show()
    }
    
    public mutating func dismiss() {
        hud.dismiss(completion: nil)
    }
    
}
