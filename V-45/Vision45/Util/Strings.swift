//
//  Strings.swift
//  WTFUserInterface
//
//  Created by shndrs on 10/12/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import Foundation

enum Ids: String {
    
    case menuTVC = "MenuTVC"
    case bannerTVC = "BannerTVC"
    case customHeader = "CustomHeader"
}

enum Strings: String {
    
    case expand = "Expand"
    case collapse = "Collapse"
    case wait = "Please Wait"
    case yes = "Yes"
    case no = "No"
    case areYouSure = "Are you sure about this?"
    case done = "Done"
    case ok = "Okay"
    case error = "Error"
    
    // MARK: - Category
    
    case category = "Category"
    case byMe = "by shndrs"
    
    // MARK: - Settings Items
    
    case settings = "Settings"
    case favorites = "Favorites"
    case cart = "Your Cart"
    case logout = "Logout"
    case archive = "Transactions Archive"
    
    // MARK: - CAKeyframeAnimation
    
    case transformScale = "transform.scale"
    case cubic
    
    // MARK: - Buttons
    
    case submit = "Submit"
    
    // MARK: - Login
    
    case login = "Login"
    case inCorrectPassUser = "Username or Password is Incorrect"
    
    // MARK: - Register
    
    case register = "Register"
    case usernameIsEmpty = "Username is empty!"
    case passIsEmpty = "Password is empty!"
    case repeatPassIsEmpty = "Repeat password is empty!"
    case repeatPassIsNotEqual = "Repeat password is not equal to password!"
    case emailIsEmpty = "Email is empty!"
    case emailIsInvalid = "Email is invalid"
    case successfulRegistration = "User registered successfully!!! :)"
}
