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

/// EX-1

func log(_ closure: @autoclosure () -> String) {
    print(closure())
}

log("shndrs")

/// EX-2

func goodMorning(morning: Bool, whom: @autoclosure () -> String) {
    if morning {
        print("Good morning, \(whom())")
    }
}

func nameGenerator() -> String {
    print("nameGenerator() is called")
    return "Sahand"
}

goodMorning(morning: true, whom: nameGenerator())

/// EX-2

func complexFunction(clo: () -> String) {
    print("Inside Function")
    print(clo())
}

complexFunction { () -> String in
    return "Nothing"
}

complexFunction(clo: { "Nothing" })
// complexFunction(clo: "Nothing") - Will give you an Error because of this error we will use @autoclosure attribute

func complexFunction2(clo: @autoclosure () -> String) {
    print("Inside Function2")
    print(clo())
}

complexFunction2(clo: "Nothing 2")
