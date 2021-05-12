//
//  NewsTableViewCell.swift
//  MyVK_IOSapp
//
//  Created by Ниязов Ринат Раимжанович on 2/18/21.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    lazy var nameOfGroupOrUser: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.backgroundColor = .green
        label.textColor = .black
        label.text = "Test Owner"
        return label
    }()
    lazy var iconView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = true
        view.backgroundColor = .blue
        view.frame = CGRect(x: 5,y: 5,width: 50,height: 50)
        return view
    }()
    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "deadVK")
        return imageView
    }()
    lazy var publishDate: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.backgroundColor = .yellow
        label.textColor = .black
        label.text = "5 minutes ago"
        return label
    }()
    lazy var contentText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.backgroundColor = .red
        label.textColor = .black
        label.text = "test tes tes test"
        return label
    }()
    lazy var contentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .clear
//        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "news2")
        return imageView
    }()
    
    var currentLikes = 1000
    lazy var likeButton = LikeControl(initialState: .disliked(self.currentLikes))
    var isNeededToLike = true

    
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
        
    }
    
    func setupCell(){
        contentView.addSubview(contentImageView)
        contentView.addSubview(contentText)
        contentView.addSubview(nameOfGroupOrUser)
        contentView.addSubview(publishDate)
        contentView.addSubview(iconView)
        iconView.addSubview(iconImageView)
        self.iconImageView.applyshadowWithCorner(containerView: self.iconView, cornerRadious: 25)
        
        contentView.addSubview(self.likeButton)
        self.likeButton.addTarget(self, action: #selector(handleLikeTap), for: .touchUpInside)
//        self.likeButton.frame = CGRect(x: 5, y: 500, width: 20, height: 20)
        
        self.likeButton.frame.size.height = 20
        self.likeButton.frame.size.width = 20
        
        var scaledHeight = self.contentImageView.image?.size.height
        if let image = self.contentImageView.image {
            let contentImageSizeWidth = image.size.width
            let contentImageSizeHeight = image.size.height
            let ratio = contentView.frame.size.width/contentImageSizeWidth
            scaledHeight = contentImageSizeHeight * ratio
        }
        
        
        
        NSLayoutConstraint.activate([
            iconView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            iconView.bottomAnchor.constraint(lessThanOrEqualTo: contentText.topAnchor, constant: -5),
            iconView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            iconView.trailingAnchor.constraint(lessThanOrEqualTo: nameOfGroupOrUser.leadingAnchor, constant: -5),
            iconView.trailingAnchor.constraint(lessThanOrEqualTo: publishDate.leadingAnchor, constant: -5),
            
            iconImageView.topAnchor.constraint(equalTo: iconView.topAnchor),
            iconImageView.bottomAnchor.constraint(equalTo: iconView.bottomAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: iconView.leadingAnchor),
            iconImageView.trailingAnchor.constraint(equalTo: iconView.trailingAnchor),
                        
            nameOfGroupOrUser.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            nameOfGroupOrUser.bottomAnchor.constraint(lessThanOrEqualTo: publishDate.topAnchor, constant: -2),
            nameOfGroupOrUser.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 5),
            nameOfGroupOrUser.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -5),
            
            publishDate.topAnchor.constraint(equalTo: nameOfGroupOrUser.bottomAnchor, constant: 2),
            publishDate.bottomAnchor.constraint(lessThanOrEqualTo: contentText.bottomAnchor, constant: -5),
            publishDate.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 5),
            publishDate.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -5),
            
            contentText.topAnchor.constraint(equalTo: iconView.bottomAnchor, constant: 5),
            contentText.topAnchor.constraint(equalTo: publishDate.bottomAnchor, constant: 5),
            contentText.bottomAnchor.constraint(lessThanOrEqualTo: contentImageView.topAnchor, constant: -5),
            contentText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            contentText.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -5),
            
            contentImageView.topAnchor.constraint(equalTo: contentText.bottomAnchor, constant: 5),
            contentImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30),
            contentImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            contentImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            contentImageView.heightAnchor.constraint(equalToConstant: scaledHeight ?? 0),
            contentImageView.widthAnchor.constraint(equalToConstant: contentView.frame.size.width),
            
            likeButton.topAnchor.constraint(equalTo: contentImageView.topAnchor, constant: 5),
            likeButton.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -5),
            likeButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            likeButton.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -5),
            // Не могу разобраться почему все ломается при динамической высоте изображения
        ])
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
