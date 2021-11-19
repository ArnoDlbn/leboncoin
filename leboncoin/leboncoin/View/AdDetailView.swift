//
//  AdDetailView.swift
//  leboncoin
//
//  Created by Arnaud Dalbin on 19/11/2021.
//

import UIKit

class AdDetailView: UIView {

    // MARK: - Properties
    
    var adTitle: UILabel!
    var adDescription: UILabel!
    var categorie: UILabel!
    var price: UILabel!
    var adImage: UIImageView!
    var creationDate: UILabel!
    var priority: UILabel!
    
    //MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        adTitle = UILabel()
        adTitle.translatesAutoresizingMaskIntoConstraints = false
        adTitle.textAlignment = .right
        adTitle.font = UIFont.boldSystemFont(ofSize: 20)
        adTitle.textColor = .black
        adTitle.text = "Title: "
        addSubview(adTitle)
        
        adDescription = UILabel()
        adDescription.translatesAutoresizingMaskIntoConstraints = false
        adDescription.textAlignment = .right
        adDescription.font = UIFont.systemFont(ofSize: 20)
        adDescription.textColor = .black
        adDescription.text = "Description: "
        addSubview(adDescription)
        
        categorie = UILabel()
        categorie.translatesAutoresizingMaskIntoConstraints = false
        categorie.textAlignment = .right
        categorie.font = UIFont.boldSystemFont(ofSize: 20)
        categorie.textColor = .black
        categorie.text = "Categorie: "
        addSubview(categorie)

        price = UILabel()
        price.translatesAutoresizingMaskIntoConstraints = false
        price.textAlignment = .right
        price.font = UIFont.boldSystemFont(ofSize: 20)
        price.textColor = .black
        price.text = "Price: "
        addSubview(price)

        adImage = UIImageView(frame: CGRect(x:0, y:200, width:300, height:300))
        adImage.contentMode = .scaleAspectFit
        adImage.clipsToBounds = true
        adImage.layer.borderWidth = 1
        adImage.layer.cornerRadius = 10
        adImage.layer.borderColor = UIColor.black.cgColor
        addSubview(adImage)
        
        creationDate = UILabel()
        creationDate.translatesAutoresizingMaskIntoConstraints = false
        creationDate.textAlignment = .right
        creationDate.font = UIFont.boldSystemFont(ofSize: 20)
        creationDate.textColor = .black
        creationDate.text = "Date: "
        addSubview(creationDate)
        
        priority = UILabel()
        priority.translatesAutoresizingMaskIntoConstraints = false
        priority.textAlignment = .right
        priority.font = UIFont.boldSystemFont(ofSize: 20)
        priority.textColor = .black
        priority.text = "Priority: "
        addSubview(priority)
        
        NSLayoutConstraint.activate([
            adTitle.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: -5),
            adTitle.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: -5),

            adDescription.topAnchor.constraint(equalTo: adTitle.bottomAnchor),
            adDescription.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: -5),

            categorie.topAnchor.constraint(equalTo: adDescription.bottomAnchor),
            categorie.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: -5),
            
            price.topAnchor.constraint(equalTo: categorie.bottomAnchor),
            price.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: -5),

            adImage.topAnchor.constraint(equalTo: price.bottomAnchor),
            adImage.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: -5),
            
            creationDate.topAnchor.constraint(equalTo: adImage.bottomAnchor),
            creationDate.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: -5),

            priority.topAnchor.constraint(equalTo: creationDate.bottomAnchor),
            priority.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: -5),
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
