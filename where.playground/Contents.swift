import UIKit

enum Action {
    case createUser(age: Int)
    case createPost
    case logout
}

func printAction(action: Action) {
    switch action {
    case .createUser(let age) where age < 21:
        print("Young and wild!")
    case .createUser:
        print("Older and wise!")
    case .createPost:
        print("Creating a post")
    case .logout:
        print("Logout")
    }
}

printAction(action: Action.createUser(age: 18)) // Young and wild
printAction(action: Action.createUser(age: 25)) // Older and wise
