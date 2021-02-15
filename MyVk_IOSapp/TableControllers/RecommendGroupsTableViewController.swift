//
//  RecommendGroupsTableViewController.swift
//  MyVK_IOSapp
//
//  Created by Ниязов Ринат Раимжанович on 2/8/21.
//

import UIKit

class RecommendGroupsTableViewController: UITableViewController {

    @IBOutlet var recommendGroupsTableVC: UITableView!
    
    var recGroups = RecommendGroup()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        recommendGroupsTableVC.register(UINib(nibName: "GroupsTableViewCell", bundle: nil), forCellReuseIdentifier: "recommendGroupCell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return recGroups.recommendGroups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recommendGroupCell", for: indexPath) as! GroupsTableViewCell
        let recGroup = recGroups.recommendGroups[indexPath.row]
        cell.setupCell(group: recGroup)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
}
