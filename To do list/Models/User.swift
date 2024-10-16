
import Foundation

//Codable: allowing a type to be encoded and decoded
struct User: Codable{
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
    
}
