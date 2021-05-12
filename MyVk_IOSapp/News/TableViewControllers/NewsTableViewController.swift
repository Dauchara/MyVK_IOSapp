//
//  NewsTableViewController.swift
//  MyVK_IOSapp
//
//  Created by Ниязов Ринат Раимжанович on 2/18/21.
//

import UIKit

class NewsTableViewController: UITableViewController {

    @IBOutlet var NewsTableView: UITableView!
    let news = News()
//    let users = User()
//    let groups = Group()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NewsTableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return news.news.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewsTableViewCell
        
        let content = news.news[indexPath.row]
        let owner = NewsOwnerModel(name: "", photo: UIImage(named: "deadVK"))
        cell.setupCell()
//        if content.isGroup {
//            guard let group = self.groups.groups.first(where: { $0.id == content.ownerID }) else { return cell }
//            let owner = NewsOwnerModel(name: group.name, photo: group.mainPhoto)
//            cell.setupCell(news: content, newsOwner: owner)
//            return cell
//        } else {
//            guard let user = self.users.users.first(where: { $0.id == content.ownerID }) else { return cell }
//            let owner = NewsOwnerModel(name: "\(user.fName) \(user.sName)", photo: user.mainPhoto)
//            cell.setupCell(news: content, newsOwner: owner)
//            return cell
//        }
        return cell
    }

}
