//
//  FriendsTableViewController.swift
//  MyVK_IOSapp
//
//  Created by Ниязов Ринат Раимжанович on 2/6/21.
//

import UIKit

class FriendsTableViewController: UITableViewController {

    let userList = User()
    
    @IBOutlet var friendsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        friendsTableView.register(UINib(nibName: "FriendsViewCell", bundle: nil), forCellReuseIdentifier: "friendCell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.userList.users.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath) as! FriendsViewCell
        let user = userList.users[indexPath.row]
        cell.setupCell(user: user)
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
