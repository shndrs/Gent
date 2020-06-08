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

// MARK: - Usage in protocol extensions

/// EX-1

extension Array where Element == Int {
    func printAverageAge() {
        let total = reduce(0, +)
        let average = total / count
        print("Average age is \(average)")
    }
}

extension Dictionary where Value == Double {
    func printShit() {
        print("The value is Double")
    }
}


let dict = ["Strudle" : 5.8]
dict.printShit()

let ages = [20, 26, 40, 60, 84]
ages.printAverageAge()

/// EX-2

enum ScaleType {
    case multiScale
    case bariton
}

protocol Guitar: class {
    var brand: String { get }
    var price: Double { get set }
    var scaleType: ScaleType { get set }
    
    init(price: Double, scaleType: ScaleType)
}

final class Ibanez: Guitar {
    var brand: String = "Ibanez"
    var price: Double
    var scaleType: ScaleType
    
    init(price: Double, scaleType: ScaleType) {
        self.price = price
        self.scaleType = scaleType
    }
}

final class Skervesen: Guitar {
    var brand: String = "Skervesen"
    var price: Double
    var scaleType: ScaleType
    
    init(price: Double, scaleType: ScaleType) {
        self.price = price
        self.scaleType = scaleType
    }
}

extension Array where Element == Guitar {
    var totalPrice: Double {
        let total = self.map({$0.price}).reduce(0, +)
        return total
    }
}

let guitars: [Guitar] = [
    Ibanez(price: 2799, scaleType: .bariton),
    Skervesen(price: 4749, scaleType: .multiScale)
]

print(guitars.totalPrice)

// MARK: - Usage in first and contains

let names = ["Henk", "John", "Jack"]
let firstJname = names.first(where: { (name) -> Bool in
    return name.first == "J"
})

let fruits = ["Banana", "Apple", "Kiwi"]
let containsBanana = fruits.contains(where: { (fruit) in
    return fruit == "Banana"
})
