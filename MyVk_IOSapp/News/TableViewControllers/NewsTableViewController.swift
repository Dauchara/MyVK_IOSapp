//
//  NewsTableViewController.swift
//  MyVK_IOSapp
//
//  Created by Ниязов Ринат Раимжанович on 2/18/21.
//

import UIKit
import Alamofire

class NewsTableViewController: UITableViewController {

    @IBOutlet var NewsTableView: UITableView!
    var newsItems = [NewsResponseItem]()
    var newsProfiles = [NewsProfile]()
    var newsGroups = [NewsGroup]()
    var newCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NewsTableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        GetNews()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return newCount
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewsTableViewCell
        
        let content = newsItems[indexPath.row]
        cell.setupCell()

        return cell
    }
}

extension NewsTableViewController {
    func GetNews() {
        let session = CustomSession.instance
        let path = "newsfeed.get"
        
        let parameters: Parameters = [
            "access_token": session.token,
            "v": "5.130",
            "filters":"post,photo,photo_tag,wall_photo",
            "count": "10",
            "user_id": session.userId
        ]
        
        let url = session.baseUrl + path
        
        AF.request(url, method: .get, parameters: parameters).responseDecodable(of: News.self) { (response) in
            print(response)
            guard let news = response.value else { return }
            self.newsItems = news.response.items
            self.newsGroups = news.response.groups
            self.newsProfiles = news.response.profiles
            self.newCount = news.response.items.count
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}
