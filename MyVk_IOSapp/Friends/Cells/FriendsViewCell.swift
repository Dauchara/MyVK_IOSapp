//
//  FriendsViewCell.swift
//  MyVK_IOSapp
//
//  Created by Ниязов Ринат Раимжанович on 2/6/21.
//

import UIKit

class FriendsViewCell: UITableViewCell {

    @IBOutlet weak var friendName: UILabel!
    @IBOutlet var friendMainPhoto: UIControl!
    @IBOutlet weak var photo: UIImageView!
    var imageTemp = UIImage(named: "deadVK")!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.friendMainPhoto.addTarget(self, action: #selector(photoAnimation), for: .touchUpInside)
//        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.friendName.text = nil
        self.friendMainPhoto.layer.contents = imageTemp.cgImage
    }
    
    func setupCell(user:UserModel){
        self.friendName.text = "\(user.fName) \(user.sName)"
        self.photo.image = user.mainPhoto
        self.photo.applyshadowWithCorner(containerView: self.friendMainPhoto, cornerRadious: 30)
        self.photo.layer.contentsGravity = CALayerContentsGravity.resize
        friendCellAnimation()
//        self.friendMainPhoto.layer.masksToBounds = false
//        self.friendMainPhoto.layer.cornerRadius = 30
//        self.friendMainPhoto.layer.shadowOffset = CGSize(width: 10,height: 10)

//        self.friendMainPhoto.layer.shadowOpacity = 0.7
//        self.friendMainPhoto.layer.shadowRadius = 5
//        self.friendMainPhoto.layer.shadowColor = UIColor(red: 44.0/255.0, green: 62.0/255.0, blue: 80.0/255.0, alpha: 1.0).cgColor
        
//        let translation3D = CATransform3DMakeTranslation(10, 20, 100)
//        let rotation3D = CATransform3DMakeRotation(.pi / 4, 0, 0, 1)
//        let scale3D = CATransform3DMakeScale(0.5, 0.5, 1)
//        self.friendMainPhoto.layer.transform = translation3D
//        self.friendMainPhoto.layer.transform = rotation3D
//        self.friendMainPhoto.layer.transform = scale3D

    }
    
    @objc
    func photoAnimation() {
        let animation = CASpringAnimation(keyPath: "transform.scale")
        animation.fromValue = 0.9
        animation.toValue = 1
        animation.stiffness = 500
        animation.mass = 10
        animation.duration = 2
        animation.beginTime = CACurrentMediaTime()-0.5
        animation.fillMode = CAMediaTimingFillMode.backwards
        
        self.friendMainPhoto.layer.add(animation, forKey: nil)
    }
    
    func friendCellAnimation() {
        let animation = CASpringAnimation(keyPath: "transform.scale")
        animation.fromValue = 0.8
        animation.toValue = 1
        animation.stiffness = 500
        animation.mass = 50
        animation.duration = 2
        animation.beginTime = CACurrentMediaTime()-0.3
        animation.fillMode = CAMediaTimingFillMode.backwards
        
        self.layer.add(animation, forKey: nil)
    }
}

extension UIImageView {
    func applyshadowWithCorner(containerView : UIView, cornerRadious : CGFloat){
        containerView.clipsToBounds = false
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.7
        containerView.layer.shadowOffset = CGSize(width: 5,height: 5)
        containerView.layer.shadowRadius = 4
        containerView.layer.cornerRadius = cornerRadious
        containerView.layer.shadowPath = UIBezierPath(roundedRect: containerView.bounds, cornerRadius: cornerRadious).cgPath
        self.clipsToBounds = true
        self.layer.cornerRadius = cornerRadious
    }
}
