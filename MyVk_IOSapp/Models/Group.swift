import UIKit

struct GroupModel {
    var id: Int
    var name: String
    var mainPhoto: UIImage
}

class Group {
    var groups = [GroupModel]()
    
    init(){
        setup()
    }
    
    func setup() {
        groups = [
            GroupModel(id: 1, name: "Группа 1", mainPhoto: UIImage(named: "Group1")!),
            GroupModel(id: 2, name: "Группа 2", mainPhoto: UIImage(named: "Group1")!),
            GroupModel(id: 3, name: "Группа 3", mainPhoto: UIImage(named: "Group1")!),
            GroupModel(id: 4, name: "Группа 4", mainPhoto: UIImage(named: "Group1")!),
            GroupModel(id: 5, name: "Группа 5", mainPhoto: UIImage(named: "Group1")!),
            GroupModel(id: 6, name: "Группа 6", mainPhoto: UIImage(named: "Group1")!),
            GroupModel(id: 7, name: "Группа 7", mainPhoto: UIImage(named: "Group1")!)
        ]
    }
}

class RecommendGroup {
    var recommendGroups = [GroupModel]()
    
    init() {
        setup()
    }
    
    func setup() {
        recommendGroups = [
            GroupModel(id: 8, name: "Рек группа 1", mainPhoto: UIImage(named: "RecGroup1")!),
            GroupModel(id: 9, name: "Рек группа 2", mainPhoto: UIImage(named: "RecGroup1")!),
            GroupModel(id: 10, name: "Рек группа 3", mainPhoto: UIImage(named: "RecGroup1")!),
            GroupModel(id: 11, name: "Рек группа 4", mainPhoto: UIImage(named: "RecGroup1")!),
            GroupModel(id: 12, name: "Рек группа 5", mainPhoto: UIImage(named: "RecGroup1")!),
            GroupModel(id: 13, name: "Рек группа 6", mainPhoto: UIImage(named: "RecGroup1")!)
        ]
    }
}
