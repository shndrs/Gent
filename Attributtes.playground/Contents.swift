import UIKit

// MARK: - @objcMembers

@objcMembers class Person {
    var firstName: String?
    var lastName: String?
}

class Personn {
    @objc var firstName: String?
    @objc var lastName: String?
}

// MARK: - @autoclosure
/// This attribute can magically turn a function with a closure parameter that has no arguments,
/// but a return type, into a function with a parameter type of
/// that original closure return type, so you can call it much more easy.

func log(_ closure: @autoclosure () -> String) {
    print(closure())
}

log("shndrs")
