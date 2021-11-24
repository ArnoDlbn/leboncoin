//
//  AdTableViewCellView.swift
//  leboncoin
//
//  Created by Arnaud Dalbin on 19/11/2021.
//

import UIKit

class AdTableViewCell: UITableViewCell {
    
    // MARK: - Properties

    var adImage = UIImageView()
    var adCategory = UILabel()
    var adTitle = UILabel()
    var price = UILabel()
    var isUrgent = UILabel()
    var creationDate = UILabel()
    var adPriority = UILabel()
    var adPriorityImage = UIImageView()
    
    //MARK: - Initialization

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        adImage = UIImageView(frame: CGRect(x:0, y:0, width:0, height:0))
        adImage.translatesAutoresizingMaskIntoConstraints = false
        adImage.contentMode = .scaleAspectFill
        adImage.clipsToBounds = true
        adImage.layer.borderWidth = 1
        adImage.layer.cornerRadius = 10
        adImage.layer.borderColor = UIColor.black.cgColor
        contentView.addSubview(adImage)

        adCategory = UILabel()
        adCategory.translatesAutoresizingMaskIntoConstraints = false
        adCategory.textAlignment = .left
        adCategory.font = UIFont.systemFont(ofSize: 15)
        adCategory.textColor = .gray
        contentView.addSubview(adCategory)
        
        adTitle.translatesAutoresizingMaskIntoConstraints = false
        adTitle.textAlignment = .left
        adTitle.font = UIFont.boldSystemFont(ofSize: 20)
        adTitle.textColor = .black
        adTitle.numberOfLines = 1
        contentView.addSubview(adTitle)
        
        price.translatesAutoresizingMaskIntoConstraints = false
        price.textAlignment = .right
        price.font = UIFont.boldSystemFont(ofSize: 20)
        price.textColor = .black
        contentView.addSubview(price)
        
        creationDate = UILabel()
        creationDate.translatesAutoresizingMaskIntoConstraints = false
        creationDate.textAlignment = .left
        creationDate.font = UIFont.systemFont(ofSize: 15)
        creationDate.textColor = .gray
        contentView.addSubview(creationDate)

        adPriority = UILabel()
        adPriority.translatesAutoresizingMaskIntoConstraints = false
        adPriority.textAlignment = .left
        adPriority.font = UIFont.systemFont(ofSize: 15)
        adPriority.textColor = .gray
        contentView.addSubview(adPriority)
        
        adPriorityImage = UIImageView()
        adPriorityImage.translatesAutoresizingMaskIntoConstraints = false
        adPriorityImage.tintColor = UIColor.orange
        contentView.addSubview(adPriorityImage)

        NSLayoutConstraint.activate([
            adImage.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            adImage.widthAnchor.constraint(equalTo: self.layoutMarginsGuide.widthAnchor, constant: -(UIScreen.main.bounds.width / 1.6)),
            adImage.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor),
            adImage.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor),
            
            adCategory.topAnchor.constraint(equalTo: adTitle.bottomAnchor),
            adCategory.leadingAnchor.constraint(equalTo: adImage.trailingAnchor, constant: 10),
            
            adTitle.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 5),
            adTitle.leadingAnchor.constraint(equalTo: adImage.trailingAnchor, constant: 10),
            adTitle.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -5),

            price.bottomAnchor.constraint(equalTo: creationDate.topAnchor, constant: -5),
            price.leadingAnchor.constraint(equalTo: adImage.trailingAnchor, constant: 10),
            
            creationDate.bottomAnchor.constraint(equalTo: adPriority.topAnchor),
            creationDate.leadingAnchor.constraint(equalTo: adImage.trailingAnchor, constant: 10),
            
            adPriority.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor, constant: -5),
            adPriority.leadingAnchor.constraint(equalTo: adPriorityImage.trailingAnchor, constant: 10),
            
            adPriorityImage.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor, constant: -5),
            adPriorityImage.leadingAnchor.constraint(equalTo: adImage.trailingAnchor, constant: 10),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
