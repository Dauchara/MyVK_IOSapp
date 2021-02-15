//
//  FriendCollectionViewCell.swift
//  MyVK_IOSapp
//
//  Created by Ниязов Ринат Раимжанович on 2/6/21.
//

import UIKit

class FriendCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var userPhoto: UIImageView!
    
    @IBOutlet var userContentBlockView: UIView!
    
    var currentLikes = 1000

    lazy var likeButton = LikeControl(initialState: .disliked(self.currentLikes))

    var isNeededToLike = true
    
    override func awakeFromNib() {
        super.awakeFromNib()
        userContentBlockView.addSubview(self.likeButton)
        self.likeButton.addTarget(self, action: #selector(handleLikeTap), for: .touchUpInside)
        self.likeButton.frame = CGRect(x: 30, y: 120, width: 20, height: 20)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.userPhoto.image = nil
    }
    
    func setupCell(userPhoto:UIImage){
        self.userPhoto.image = userPhoto
    }
    
    @objc
    func handleLikeTap() {
        if self.isNeededToLike {
            self.currentLikes += 1009
            self.likeButton.applyState(.liked(self.currentLikes))
        } else {
            self.currentLikes -= 1009
            self.likeButton.applyState(.disliked(self.currentLikes))
        }

        self.isNeededToLike.toggle()
    }
}
