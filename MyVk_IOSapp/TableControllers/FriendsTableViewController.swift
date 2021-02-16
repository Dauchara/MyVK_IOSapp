//
//  FriendsTableViewController.swift
//  MyVK_IOSapp
//
//  Created by Ниязов Ринат Раимжанович on 2/6/21.
//

import UIKit

class FriendsTableViewController: UITableViewController {

    
//    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var friendsTableView: UITableView!
    let searchBar = UISearchBar()
    
    var userList = [UserModel]()
    var groupedFriends = [[UserModel]]()
    var searchedFriends = [UserModel]()
    var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.hidesBarsOnSwipe = true
        friendsTableView.register(UINib(nibName: "FriendsViewCell", bundle: nil), forCellReuseIdentifier: "friendCell")
        
        // сохраним для истории))
//        let searchTextField = self.searchBar.searchTextField
//                searchTextField.textColor = UIColor.white
//                searchTextField.clearButtonMode = .never
//                searchTextField.backgroundColor = UIColor.black
//        
//        let glassIconView = searchTextField.leftView as! UIImageView
//                glassIconView.image = glassIconView.image?.withRenderingMode(.alwaysTemplate)
//                glassIconView.tintColor = UIColor.red
        self.searchBar.frame = CGRect(x: 0, y: 0, width: 200, height: 70)
        self.searchBar.delegate = self
        self.searchBar.showsCancelButton = true
        self.searchBar.searchBarStyle = UISearchBar.Style.default
        self.searchBar.placeholder = "Поиск"
        self.searchBar.sizeToFit()
        
        friendsTableView.tableHeaderView = searchBar
        
        userList = User().users
        createFirstDigitHeader()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        if searching {
            return self.searchedFriends.count
        } else {
            return userList.count
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
//        if searching {
//            return self.searchedFriends[section].count
//        } else {
        return self.groupedFriends[section].count
//        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath) as! FriendsViewCell
//        if searching {
//            let user = self.searchedFriends[indexPath.section][indexPath.row]
//            cell.setupCell(user: user)
//        } else {
        if indexPath.row == 0 {
            let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header")
            view?.textLabel?.text = String(groupedFriends[indexPath.section][indexPath.row].fName.prefix(1))
        }
        let user = groupedFriends[indexPath.section][indexPath.row]
        cell.setupCell(user: user)
//        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "friendPageSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! FriendCollectionViewController
        
        let index = friendsTableView.indexPathForSelectedRow?.row
        vc.userId = groupedFriends[0][index ?? 0].id
    }

    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func createFirstDigitHeader() {
        groupedFriends.removeAll()
        
        if searching {
            for index in 0..<searchedFriends.count {
                let tempSymbol = String(searchedFriends[index].fName.prefix(1)).lowercased()
                
                let tempItems = searchedFriends.filter { $0.fName.lowercased().prefix(1) == tempSymbol }
                
                for item in tempItems {
                    groupedFriends[index].append(item)
                    searchedFriends.removeAll(where: ({ $0.fName == item.fName }))
                }
            }
        } else {
            var tempUserList = userList
            for index in 0..<tempUserList.count {
                let tempSymbol = String(tempUserList[index].fName.prefix(1)).lowercased()
                
                let tempItems = tempUserList.filter { $0.fName.lowercased().prefix(1) == tempSymbol }
                
                for item in tempItems {
                    groupedFriends[index].append(item)
                    tempUserList.removeAll(where: ({ $0.fName == item.fName }))
                }
            }
        }
    }

}

extension FriendsTableViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchedFriends = userList.filter { $0.sName.lowercased().prefix(searchText.count) == searchText.lowercased() }
//        searching = true
        createFirstDigitHeader()
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        searching = false
        searchBar.text = ""
        tableView.reloadData()
    }
}
