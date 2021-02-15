//
//  GroupsTableViewController.swift
//  MyVK_IOSapp
//
//  Created by Ниязов Ринат Раимжанович on 2/8/21.
//

import UIKit

class GroupsTableViewController: UITableViewController {

    @IBOutlet var groupsTableView: UITableView!
    
    var groupList = Group()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groupsTableView.register(UINib(nibName: "GroupsTableViewCell", bundle: nil), forCellReuseIdentifier: "groupCell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groupList.groups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath) as! GroupsTableViewCell
        let group = groupList.groups[indexPath.row]
        cell.setupCell(group: group)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}
