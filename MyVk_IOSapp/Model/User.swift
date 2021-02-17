//
//  User.swift
//  MyVK_IOSapp
//
//  Created by Ниязов Ринат Раимжанович on 2/6/21.
//

import Foundation
import UIKit


struct UserModel {
    var id:Int
    var sName:String
    var fName:String
    var mainPhoto:UIImage
}

struct UserInfoModel {
    var status:String
    var photoList:Array<UIImage>?
}

class User {
    var users = [UserModel]()
    
    init(){
        setup()
    }
    
    func setup() {
        let user1 = UserModel(id: 1, sName: "Задирайнес", fName: "Эд", mainPhoto: UIImage(named: "Ed1")!)
        let user2 = UserModel(id: 2, sName: "Серый", fName: "Геральт", mainPhoto: UIImage(named: "Geralt2")!)
        let user3 = UserModel(id: 3, sName: "Чакраборти", fName: "Митхун", mainPhoto: UIImage(named: "Mithun1")!)
        let user4 = UserModel(id: 4, sName: "Максимов", fName: "Ванда", mainPhoto: UIImage(named: "Wanda1")!)
        let user5 = UserModel(id: 5, sName: "Шан", fName: "Сатель", mainPhoto: UIImage(named: "Satel1")!)
        let user6 = UserModel(id: 6, sName: "ЗШан", fName: "ЭСатель", mainPhoto: UIImage(named: "Satel2")!)
        self.users = [user1,user2,user3,user4,user5,user6]
    }
}

class UserInfo {
    var userInfo = UserInfoModel(status: "", photoList: [UIImage(named:"deadVK")!])
    
    init(_ id:Int){
        setup(id)
    }
    
    func setup(_ id:Int) {
        switch(id){
        case 1 : self.userInfo = UserInfoModel(status: "Задирайнес", photoList: [UIImage(named: "Ed1")!, UIImage(named: "Ed2")!])
        case 2 : self.userInfo = UserInfoModel(status: "Серый", photoList: [UIImage(named: "Geralt1")!, UIImage(named: "Geralt2")!])
        case 3 : self.userInfo = UserInfoModel(status: "Чакраборти", photoList: [UIImage(named: "Mithun1")!, UIImage(named: "Mithun2")!])
        case 4 : self.userInfo = UserInfoModel(status: "Максимов", photoList: [UIImage(named: "Wanda1")!, UIImage(named: "Wanda2")!])
        case 5 : self.userInfo = UserInfoModel(status: "Шан", photoList: [UIImage(named: "Satel1")!, UIImage(named: "Satel2")!])
        default:
            self.userInfo = UserInfoModel(status: "none", photoList: [UIImage(named:"deadVK")!])
        }
    }
}
