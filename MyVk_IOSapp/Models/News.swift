import UIKit


struct NewsModel {
    var id: Int
    var isGroup: Bool
    var ownerID: Int
    var dateTime: Date
    var text: String?
    var photo: UIImage?
}

struct NewsOwnerModel {
    var name: String?
    var photo: UIImage?
}

class News {
    var news = [NewsModel]()
    
    init() {
        setup()
    }
    
    func setup() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        let news1 = NewsModel(id: 1, isGroup: true, ownerID: 1, dateTime: formatter.date(from: "2021/02/18 12:34")!, text: "Сегодня наблюдается большая активность в виде кактусов", photo: UIImage(named: "news1")!)
        let news2 = NewsModel(id: 1, isGroup: false, ownerID: 2, dateTime: formatter.date(from: "2021/02/18 12:34")!, text: "Пустой текст", photo: UIImage(named: "news2")!)
        let news3 = NewsModel(id: 1, isGroup: true, ownerID: 2, dateTime: formatter.date(from: "2021/02/18 12:34")!, text: "Еще одна новость то паблика", photo: UIImage(named: "news3")!)
        let news4 = NewsModel(id: 1, isGroup: false, ownerID: 3, dateTime: formatter.date(from: "2021/02/18 12:34")!, text: "123", photo: UIImage(named: "news4")!)
        
        news = [news1,news2,news3,news4]
    }
}
