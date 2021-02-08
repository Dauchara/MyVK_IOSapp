//
//  FriendsViewCell.swift
//  MyVK_IOSapp
//
//  Created by Ниязов Ринат Раимжанович on 2/6/21.
//

import UIKit

class FriendsViewCell: UITableViewCell {

    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var friendMainPhoto: UIImageView!
    
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
        self.friendName.text = nil
        self.friendMainPhoto.image = nil
    }
    
    func setupCell(user:UserModel){
        self.friendName.text = "\(user.fName) \(user.sName)"
        self.friendMainPhoto.image = user.mainPhoto
    }
    
}
