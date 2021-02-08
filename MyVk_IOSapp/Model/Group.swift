//
//  Group.swift
//  MyVK_IOSapp
//
//  Created by Ниязов Ринат Раимжанович on 2/6/21.
//

import Foundation
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
