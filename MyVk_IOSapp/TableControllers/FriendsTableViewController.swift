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
    
    let userList = User()
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
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if searching {
            return self.searchedFriends.count
        } else {
            return self.userList.users.count
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath) as! FriendsViewCell
        if searching {
            let user = self.searchedFriends[indexPath.row]
            cell.setupCell(user: user)
        } else {
            let user = userList.users[indexPath.row]
            cell.setupCell(user: user)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "friendPageSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! FriendCollectionViewController
        let index = tableView.indexPathForSelectedRow?.row
        vc.userId = userList.users[index ?? 0].id
    }

    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }

}

extension FriendsTableViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchedFriends = userList.users.filter { $0.sName.lowercased().prefix(searchText.count) == searchText.lowercased() }
        searching = true
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        tableView.reloadData()
    }
}
