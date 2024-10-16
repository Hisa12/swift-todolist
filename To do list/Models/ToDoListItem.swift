
import Foundation

// codable: encoded to and decoded
// Identifiable: requires a type to have a unique identifier (id)
struct ToDoListItem: Codable, Identifiable{
    let id: String
    let title: String
    let dueDate:TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    //mutating: allows a method in a struct or enum to modify its own properties
    // _ : when you call this method, you don't need to use the parameter name
    mutating func setDone(_ state: Bool){
        isDone = state
    }
}
