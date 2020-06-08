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
    print("Inside Function 2")
    print(clo())
}

complexFunction2(clo: "Nothing 2")

/// EX-3

func performComplexComputation() -> String {
    return "Complex"
}

func complexFunction3(clo: @autoclosure () -> String, condition: Bool = false) {
    print("Inside Function 3")
    if (condition) {
        _ = clo()
    }
}

complexFunction3(clo: performComplexComputation(), condition: false)

var tempClosure: (() -> String)?
func complexFunction4(clo: @autoclosure @escaping () -> String) {
    print("Inside Function 4")
    tempClosure = clo
}

complexFunction4(clo: performComplexComputation())

// MARK: - @_exported
/// If you want to import an external module for your whole module
/// you can use the @_exported keyword before your import.
/// From now the imported module will be available everywhere. Remember PCH files?

@_exported import Dispatch

// MARK: - @_specialize

/// With the @_specialize Swift attribute you can give hints for the
/// compiler by listing concrete types for the generic signature.

@_specialize(where T == (UITableView, UICollectionView))
public func `in`<T>(component: T, id: String) {
    
    let nib = UINib(nibName: id, bundle: nil)
    
    switch component {
        
    case is UITableView:
        
        guard let cell = component as? UITableView else { return }
        cell.register(nib, forCellReuseIdentifier: id)
    
    case is UICollectionView:
        
        guard let cell = component as? UICollectionView else { return }
        cell.register(nib, forCellWithReuseIdentifier: id)
    
    default:
        break;
    }
}

