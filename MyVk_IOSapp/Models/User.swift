import UIKit
import RealmSwift

class User: Codable {
    var response: UserResponse

    init(response: UserResponse) {
        self.response = response
    }
}

// MARK: - Response
class UserResponse: Codable {
    var count: Int
    var items = [UserItem]()

    init(count: Int) {
        self.count = count
    }
}

// MARK: - Item
class UserItem: Object, Codable {
    dynamic var firstName: String? = ""
    var id = RealmOptional<Int>()
    dynamic var lastName: String? = ""
    dynamic var deactivated: String? = ""
    dynamic var photo50: String? = ""
    dynamic var domain: String? = ""
    dynamic var trackCode: String? = ""
    var can_access_closed = RealmOptional<Bool>()
    var is_closed = RealmOptional<Bool>()
    var city: City?

    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case id
        case lastName = "last_name"
        case deactivated
        case photo50 = "photo_50"
        case domain
        case trackCode = "track_code"
//        case canAccessClosed = "can_access_closed"
//        case isClosed = "is_closed"
        case city
    }

//    init(firstName: String, id: Int, lastName: String, deactivated: String?, photo50: String, domain: String, trackCode: String, canAccessClosed: Bool?, isClosed: Bool?, city: City?) {
//        self.firstName = firstName
//        self.id = id
//        self.lastName = lastName
//        self.deactivated = deactivated
//        self.photo50 = photo50
//        self.domain = domain
//        self.trackCode = trackCode
//        self.canAccessClosed = canAccessClosed ?? false
//        self.isClosed = isClosed ?? false
//        self.city = city
//    }
    
    override class func primaryKey() -> String? {
        "id"
    }
    
    override class func indexedProperties() -> [String] {
        ["id", "firstName", "lastName"]
    }
}

// MARK: - City
class City:Object, Codable {
    var id = RealmOptional<Int>()
    dynamic var title: String? = ""

//    init(id: Int, title: String) {
//        self.id = id
//        self.title = title
//    }
    
    override class func primaryKey() -> String? {
        "id"
    }
    
    override class func indexedProperties() -> [String] {
        ["id"]
    }
}
