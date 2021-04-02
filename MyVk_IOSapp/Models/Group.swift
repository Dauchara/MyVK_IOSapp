import UIKit
import Foundation
import RealmSwift

class Group: Object, Codable {
    let response: GroupResponse

    init(response: GroupResponse) {
        self.response = response
    }
}

// MARK: - Response
class GroupResponse: Object, Codable {
    @objc dynamic var count: Int
    var items = List<GroupItem>()

    init(count: Int) {
        self.count = count
    }
}

// MARK: - Item
class GroupItem: Object, Codable {
    @objc dynamic var  id: Int
    @objc dynamic var  name, screenName: String
    @objc dynamic var  isClosed: Int
    dynamic var type: TypeEnum
    @objc dynamic var  isAdmin, isMember, isAdvertiser: Int
    @objc dynamic var  photo50: String

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
