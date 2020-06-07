import UIKit

// MARK: - Usage in a switch

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

// MARK: - Usage in a for loop

let numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

for number in numbers where number % 2 == 0 {
    print(number) // 0, 2, 4, 6, 8, 10
}


