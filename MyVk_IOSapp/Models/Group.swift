import UIKit
import Foundation

class Group: Codable {
    let response: GroupResponse

    init(response: GroupResponse) {
        self.response = response
    }
}

// MARK: - Response
class GroupResponse: Codable {
    let count: Int
    let items: [GroupItem]

    init(count: Int, items: [GroupItem]) {
        self.count = count
        self.items = items
    }
}

// MARK: - Item
class GroupItem: Codable {
    let id: Int
    let name, screenName: String
    let isClosed: Int
    let type: TypeEnum
    let isAdmin, isMember, isAdvertiser: Int
    let photo50: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case screenName = "screen_name"
        case isClosed = "is_closed"
        case type
        case isAdmin = "is_admin"
        case isMember = "is_member"
        case isAdvertiser = "is_advertiser"
        case photo50 = "photo_50"
    }

    init(id: Int, name: String, screenName: String, isClosed: Int, type: TypeEnum, isAdmin: Int, isMember: Int, isAdvertiser: Int, photo50: String) {
        self.id = id
        self.name = name
        self.screenName = screenName
        self.isClosed = isClosed
        self.type = type
        self.isAdmin = isAdmin
        self.isMember = isMember
        self.isAdvertiser = isAdvertiser
        self.photo50 = photo50
    }
}

enum TypeEnum: String, Codable {
    case event = "event"
    case group = "group"
    case page = "page"
}
