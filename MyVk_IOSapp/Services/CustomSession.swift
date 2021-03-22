import Foundation

class CustomSession {
    static let instance = CustomSession()
    
    private init(){}
    
    let baseUrl = "https://api.vk.com/method/"
    var token = ""
    var userId = 0
}
