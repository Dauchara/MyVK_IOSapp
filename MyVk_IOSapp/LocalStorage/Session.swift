import Foundation

class Session {
    static let instance = Session()
    
    private init(){}
    
    var token = ""
    var userId = 0
}
