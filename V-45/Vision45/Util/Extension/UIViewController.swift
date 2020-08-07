//
//  UIViewController.swift
//  Vision45
//
//  Created by Sahand Raeisi on 8/6/20.
//  Copyright © 2020 Sahand Raeisi. All rights reserved.
//

import UIKit

// MARK: - Storyboard Instantiate

extension UIViewController {
    
    public class func instantiate(from storyboard: UIStoryboard? = nil) -> Self {
        return get(storyboard: storyboard)
    }
    
    public class func instantiate(storyboard: StoryboardId) -> Self {
        return instantiate(from: UIStoryboard(name: storyboard.rawValue, bundle: nil))
    }
       
    @discardableResult
    private class func get<T: UIViewController>(storyboard: UIStoryboard? = nil) -> T {
        let className = String(describing: self)
        var story = storyboard
        if story == nil {
            story = UIStoryboard(name: className, bundle: .main)
        }
        return story!.instantiateViewController(withIdentifier: className) as! T
    }
    
}

import Toast_Swift

// MARK: - Toast View

extension UIViewController {
    
    func show(error message: String) {
        let toast = CustomToast(view: self.view)
        toast.show(error: message)
    }
    
}
