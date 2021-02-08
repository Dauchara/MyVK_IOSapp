//
//  GroupsTableViewCell.swift
//  MyVK_IOSapp
//
//  Created by Ниязов Ринат Раимжанович on 2/8/21.
//

import UIKit

class GroupsTableViewCell: UITableViewCell {

    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var groupPhoto: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.groupName.text = nil
        self.groupPhoto.image = nil
    }
    
    func setupCell(group:GroupModel){
        self.groupName.text = group.name
        self.groupPhoto.image = group.mainPhoto
    }
}
