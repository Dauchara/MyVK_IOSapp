import UIKit
import Foundation
import RealmSwift

class User: Object, Codable {
    let response: UserResponse

    init(response: UserResponse) {
        self.response = response
    }
}

// MARK: - Response
class UserResponse: Codable {
    @objc dynamic var count: Int
    var items = List<UserItem>()

    init(count: Int) {
        self.count = count
    }
}

// MARK: - Item
class UserItem: Object, Codable {
    @objc dynamic var firstName: String
    @objc dynamic var id: Int
    @objc dynamic var lastName: String
    @objc dynamic var deactivated: String?
    @objc dynamic var photo50: String
    @objc dynamic var domain, trackCode: String
    @objc dynamic var canAccessClosed, isClosed: Bool
    @objc dynamic var city: City?
    @objc dynamic var lists: [Int]?

    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case id
        case lastName = "last_name"
        case deactivated
        case photo50 = "photo_50"
        case domain
        case trackCode = "track_code"
        case canAccessClosed = "can_access_closed"
        case isClosed = "is_closed"
        case city, lists
    }

    init(firstName: String, id: Int, lastName: String, deactivated: String?, photo50: String, domain: String, trackCode: String, canAccessClosed: Bool?, isClosed: Bool?, city: City?, lists: [Int]?) {
        self.firstName = firstName
        self.id = id
        self.lastName = lastName
        self.deactivated = deactivated
        self.photo50 = photo50
        self.domain = domain
        self.trackCode = trackCode
        self.canAccessClosed = canAccessClosed ?? false
        self.isClosed = isClosed ?? false
        self.city = city
        self.lists = lists
    }
}

// MARK: - City
class City:Object, Codable {
    @objc dynamic var id: Int
    @objc dynamic var title: String

    init(id: Int, title: String) {
        self.id = id
        self.title = title
    }
}
