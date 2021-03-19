import Foundation

class CustomSession {
    static let instance = CustomSession()
    
    private init(){}
    
    var token = ""
    var userId = 0
}
