//
//  FriendCollectionViewCell.swift
//  MyVK_IOSapp
//
//  Created by Ниязов Ринат Раимжанович on 2/6/21.
//

import UIKit

class FriendCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var userPhoto: UIImageView!
    @IBOutlet weak var likeButton: UIImageView!
    @IBOutlet weak var likeCounter: UILabel!
    @IBOutlet weak var commentButton: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.userPhoto.image = nil
    }
    
    func setupCell(userPhoto:UIImage){
        self.userPhoto.image = userPhoto
    }
    
}
