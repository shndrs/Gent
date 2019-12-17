import UIKit

protocol Summable { static func +(lhs:Self, rhs:Self) -> Self }
protocol Divisionable { static func /(lhs:Self, rhs:Self) -> Self}

extension Double:Divisionable{}
extension String:Summable{}
extension Int:Divisionable{}

func add<T:Summable>(x:T, y:T) -> T {
    return x + y
}
func division<T:Divisionable>(x:T, y:T) -> T {
    return x / y
}

add(x: "Sahand", y: "Raeisi")
division(x: 8, y: 7)
division(x: Int(4), y: Int(3))
    
let array:Array<Int> = [1,2,3,4]
let array2:Array<String> = ["Vettel","Leclerc","Raikonen"]

func mid<T:Comparable>(array: ([T])) -> T? {
    guard !array.isEmpty else { return nil }
    return array.sorted()[(array.count - 1) / 2]
}

mid(array: [1,56,7,8,12,5,9])

func pairs<Key,Value>(from dictionary: [Key:Value]) -> Array<(Key,Value)> {
    return Array(dictionary)
}
let somePairs = pairs(from: ["Ferrari":1,"Alfa Romeo":2,"Lamborghini":3])


enum Result<Value> {
    case success(Value),failure(Error)
}
enum MathError:Error {
    case divisionByZero
}

func divide(x:Int, by y:Int) -> Result<Int> {
    guard y != 0 else {
        return .failure(MathError.divisionByZero)
    }
    return .success(x/y)
}

divide(x: 8, by: 0)
divide(x: 13, by: 7)
