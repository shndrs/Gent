//
//  UIView.swift
//  Vision45
//
//  Created by Sahand Raeisi on 6/30/20.
//  Copyright © 2020 Sahand Raeisi. All rights reserved.
//

import UIKit

extension UIView {
    
    static func loadFromXib<T>(withOwner: Any? = nil,
                               options: [AnyHashable : Any]? = nil) -> T where T: UIView {
        let bundle = Bundle(for: self)
        let nib = UINib(nibName: "\(self)", bundle: bundle)

        guard let view = nib.instantiate(withOwner: withOwner,
                                         options: options as? [UINib.OptionsKey : Any]).first as? T else {
            fatalError("Could not load view from nib file.")
        }
        return view
    }
    
    public class var nibName: String {
        
        let name = "\(self)".components(separatedBy: ".").first ?? ""
        return name
    }
    
    public class var nib: UINib? {
        if let _ = Bundle.main.path(forResource: nibName, ofType: "nib") {
            return UINib(nibName: nibName, bundle: nil)
        } else {
            return nil
        }
    }
    
    public class func fromNib(nibNameOrNil: String? = nil) -> Self {
        return fromNib(nibNameOrNil: nibNameOrNil, type: self)
    }

    public class func fromNib<T : UIView>(nibNameOrNil: String? = nil, type: T.Type) -> T {
        let v :T? = fromNib(nibNameOrNil: nibNameOrNil, type: T.self)
        return v!
    }

    public class func fromNib<T : UIView>(nibNameOrNil: String? = nil, type: T.Type) -> T? {
        var view: T?
        let name: String
        if let nibName = nibNameOrNil {
            name = nibName
        } else {
            name = nibName
        }
        let nibViews = Bundle.main.loadNibNamed(name, owner: nil, options: nil)
        for v in nibViews! {
            if let tog = v as? T {
                view = tog
            }
        }
        return view
    }
    
    public func addCornerRadius(radius:CGFloat) {
        self.clipsToBounds = true;
        self.layer.cornerRadius = CGFloat(radius)
    }
    
    public func addCornerRadius(radius:CGFloat, inset : UIEdgeInsets) {
        let padding = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
        self.layer.frame = bounds.inset(by: padding)
        self.layer.cornerRadius = CGFloat(radius)
    }
    
    public func addBorder(color: UIColor = UIColor.white,
                          thickness: CGFloat = 1.0) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = thickness
    }
    
}
