//
//  FriendsTableViewController.swift
//  MyVK_IOSapp
//
//  Created by Ниязов Ринат Раимжанович on 2/6/21.
//

import UIKit
import Alamofire

class FriendsTableViewController: UITableViewController {

    
//    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var friendsTableView: UITableView!
    let searchBar = UISearchBar()
    
    var userList = [UserItem]()
    var groupedFriends = [[UserItem]]()
    var searchedFriends = [UserItem]()
    var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.hidesBarsOnSwipe = true
        friendsTableView.register(UINib(nibName: "FriendsViewCell", bundle: nil), forCellReuseIdentifier: "friendCell")
        friendsTableView.register(UINib(nibName: "FriendsCustomSectionHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "header")
        
        // сохраним для истории))
//        let searchTextField = self.searchBar.searchTextField
//                searchTextField.textColor = UIColor.white
//                searchTextField.clearButtonMode = .never
//                searchTextField.backgroundColor = UIColor.black
//        
//        let glassIconView = searchTextField.leftView as! UIImageView
//                glassIconView.image = glassIconView.image?.withRenderingMode(.alwaysTemplate)
//                glassIconView.tintColor = UIColor.red
        
//        let friends = Friends()
//        let users = friends.Get()
//        userList = users!.response.items
        GetFriends()
        
        self.searchBar.frame = CGRect(x: 0, y: 0, width: 200, height: 70)
        self.searchBar.delegate = self
        self.searchBar.showsCancelButton = true
        self.searchBar.searchBarStyle = UISearchBar.Style.default
        self.searchBar.placeholder = "Поиск"
        self.searchBar.sizeToFit()
        
        friendsTableView.tableHeaderView = searchBar
        
//        createFirstDigitHeader()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return self.groupedFriends.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
//        if searching {
//            return self.searchedFriends[section].count
//        } else {
        return self.groupedFriends[section].count
//        }
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as! FriendsCustomSectionHeader
        view.headerText.text = String(groupedFriends[section][0].firstName.prefix(1))
        return view
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath) as! FriendsViewCell
//        if searching {
//            let user = self.searchedFriends[indexPath.section][indexPath.row]
//            cell.setupCell(user: user)
//        } else {
        
        let user = groupedFriends[indexPath.section][indexPath.row]
        cell.setupCell(item: user)
//        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "friendPageSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! FriendCollectionViewController
        
        let section = friendsTableView.indexPathForSelectedRow!.section
        let row = friendsTableView.indexPathForSelectedRow!.row
        vc.userId = groupedFriends[section][row].id
    }

    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func createFirstDigitHeader(items: [UserItem]) {
        self.groupedFriends.removeAll()
        var index = -1
        var oldTempSymbol: String = ""
        
        for item in items {
            
            let tempSymbol = String(item.firstName.prefix(1)).lowercased()
            
            if tempSymbol != oldTempSymbol {
                oldTempSymbol = tempSymbol
                self.groupedFriends.append([])
                index += 1
            }
            self.groupedFriends[index].append(item)
        }
    }
}

extension FriendsTableViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != "" {
            searchedFriends = userList.filter { $0.lastName.lowercased().prefix(searchText.count) == searchText.lowercased() }
            searching = true
            createFirstDigitHeader(items: searchedFriends)
            tableView.reloadData()
        } else {
            searchBarCancelButtonClicked(searchBar) // Пришлось вызывать, так как не понимал почему не сбрасывается при пустом тексте
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        createFirstDigitHeader(items: self.userList)
        tableView.reloadData()
    }
}

extension FriendsTableViewController {
    func GetFriends() {
        let session = CustomSession.instance
        let path = "friends.get"
        
        let parameters: Parameters = [
            "access_token": session.token,
            "v": "5.130",
            "order": "name",
            "count": "200",
            "offset": "5",
            "fields": "city,domain,photo_50",
            "name_case": "nom",
            "user_id": session.userId
        ]
        
        let url = session.baseUrl + path
        
        AF.request(url, method: .get, parameters: parameters).validate().responseDecodable(of: User.self) { (response) in
            
            guard let users = response.value else { return }
            self.userList = users.response.items
            self.createFirstDigitHeader(items: self.userList)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}
