import UIKit
import Foundation

class User: Codable {
    let response: UserResponse

    init(response: UserResponse) {
        self.response = response
    }
}

// MARK: - Response
class UserResponse: Codable {
    let count: Int
    let items: [UserItem]

    init(count: Int, items: [UserItem]) {
        self.count = count
        self.items = items
    }
}

// MARK: - Item
class UserItem: Codable {
    let firstName: String
    let id: Int
    let lastName: String
    let deactivated: String?
    let photo50: String
    let domain, trackCode: String
    let canAccessClosed, isClosed: Bool?
    let city: City?
    let lists: [Int]?

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
        self.canAccessClosed = canAccessClosed
        self.isClosed = isClosed
        self.city = city
        self.lists = lists
    }
}

// MARK: - City
class City: Codable {
    let id: Int
    let title: String

    init(id: Int, title: String) {
        self.id = id
        self.title = title
    }
}
