import UIKit
import Alamofire

class GroupsTableViewController: UITableViewController {

    @IBOutlet var groupsTableView: UITableView!
    
    var groupList = [GroupItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groupsTableView.register(UINib(nibName: "GroupsTableViewCell", bundle: nil), forCellReuseIdentifier: "groupCell")
        GetGroups()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groupList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath) as! GroupsTableViewCell
        let group = groupList[indexPath.row]
        cell.setupCell(item: group)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}

extension GroupsTableViewController {
    func GetGroups() {
        let session = CustomSession.instance
        let path = "groups.get"
        
        let parameters: Parameters = [
            "access_token": session.token,
            "v": "5.130",
            "count": "200",
            "extended":1,
            "fields": "photo_50",
            "user_id": session.userId
        ]
        
        let url = session.baseUrl + path
        
        AF.request(url, method: .get, parameters: parameters).responseDecodable(of: Group.self) { (response) in
            print(response.value)
            guard let groups = response.value else { return }
            self.groupList = groups.response.items
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func SearchGroups(_ query: String) {
        let session = CustomSession.instance
        let path = "groups.search"
        
        let parameters: Parameters = [
            "access_token": session.token,
            "v": "5.130",
            "count": "20",
            "fields": "photo_50",
            "sort": "0",
            "q": query
        ]
        
        let url = session.baseUrl + path
        
        AF.request(url, method: .get, parameters: parameters).validate().responseDecodable(of: Group.self) { (response) in
            
            guard let groups = response.value else { return }
            self.groupList = groups.response.items
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}
