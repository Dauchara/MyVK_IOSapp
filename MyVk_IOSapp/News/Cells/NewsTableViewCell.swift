//
//  NewsTableViewCell.swift
//  MyVK_IOSapp
//
//  Created by Ниязов Ринат Раимжанович on 2/18/21.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet var nameOfGroupOrUser: UILabel!
    @IBOutlet var photoView: UIView!
    @IBOutlet var photoGroupOrUser: UIImageView!
    @IBOutlet var publishDate: UILabel!
    @IBOutlet var contentText: UILabel!
    @IBOutlet var contentPhoto: UIImageView!
    
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
        self.nameOfGroupOrUser.text = nil
        self.photoGroupOrUser.image = nil
        self.publishDate.text = nil
        self.contentText.text = nil
        self.contentText.isHidden = true
        self.contentPhoto.isHidden = true
    }
    
    func setupCell(news:NewsModel, newsOwner:NewsOwnerModel){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        if newsOwner.photo != nil {
            contentPhoto.isHidden = false
        }
        self.nameOfGroupOrUser.text = newsOwner.name
        self.photoGroupOrUser.image = newsOwner.photo
        self.photoGroupOrUser.applyshadowWithCorner(containerView: self.photoView, cornerRadious: 30)
        self.photoGroupOrUser.layer.contentsGravity = CALayerContentsGravity.resize
        self.publishDate.text = dateFormatter.string(from: news.dateTime)
        self.contentText.text = news.text
        self.contentPhoto.image = news.photo
    }
    
}
