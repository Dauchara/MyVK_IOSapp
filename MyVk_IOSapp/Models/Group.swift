import UIKit
import Foundation
import RealmSwift

class Group: Codable {
    var response: GroupResponse

    init(response: GroupResponse) {
        self.response = response
    }
}

// MARK: - Response
class GroupResponse: Codable {
    var count: Int
    var items = [GroupItem]()

    init(count: Int) {
        self.count = count
    }
}

// MARK: - Item
class GroupItem: Object, Codable {
    var id = RealmOptional<Int>()
    dynamic var  name: String? = ""
    dynamic var screenName: String? = ""
    dynamic var isClosed = RealmOptional<Int>()
    dynamic var type: TypeEnum?
    var isAdmin = RealmOptional<Int>()
    var isMember = RealmOptional<Int>()
    var isAdvertiser = RealmOptional<Int>()
    dynamic var photo50: String? = ""

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

//    init(id: RealmOptional<Int>, name: String, screenName: String, isClosed: RealmOptional<Int>, isAdmin: RealmOptional<Int>, isMember: RealmOptional<Int>, isAdvertiser: RealmOptional<Int>, photo50: String) {
//        self.id = id
//        self.name = name
//        self.screenName = screenName
//        self.isClosed = isClosed
////        self.type = type
//        self.isAdmin = isAdmin
//        self.isMember = isMember
//        self.isAdvertiser = isAdvertiser
//        self.photo50 = photo50
//    }
    
    override class func primaryKey() -> String? {
        "id"
    }
    
    override class func indexedProperties() -> [String] {
        ["id", "screenName"]
    }
}

enum TypeEnum: String, Codable {
    case event = "event"
    case group = "group"
    case page = "page"
}
