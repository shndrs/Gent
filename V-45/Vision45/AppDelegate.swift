//
//  AppDelegate.swift
//  Vision45
//
//  Created by Sahand Raeisi on 6/30/20.
//  Copyright © 2020 Sahand Raeisi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        KeyboardManager.applyConfig()
        
//        window = UIWindow(frame: UIScreen.main.bounds)
//        
//        let homeViewController = LanguageSelectionVC()
//        window!.rootViewController = homeViewController
//        window!.makeKeyAndVisible()
        
        
        return true
    }

}
