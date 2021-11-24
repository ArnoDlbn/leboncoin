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
    let descriptionTitle = UILabel()
    var adDescription: UILabel!
    var categorie: UILabel!
    var price: UILabel!
    var adImage: UIImageView!
    var creationDate: UILabel!
    var priority: UILabel!
    
    //MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                
        adImage = UIImageView(frame: CGRect(x:0, y:44, width:UIScreen.main.bounds.width, height:UIScreen.main.bounds.height / 3))
        adImage.contentMode = .scaleAspectFill
        adImage.clipsToBounds = true
        adImage.layer.borderWidth = 2
        adImage.layer.cornerRadius = 10
        adImage.layer.borderColor = UIColor.black.cgColor
        addSubview(adImage)
        
        adTitle = UILabel()
        adTitle.translatesAutoresizingMaskIntoConstraints = false
        adTitle.textAlignment = .left
        adTitle.font = UIFont.boldSystemFont(ofSize: 25)
        adTitle.textColor = .black
        adTitle.numberOfLines = 0
        addSubview(adTitle)
        
        price = UILabel()
        price.translatesAutoresizingMaskIntoConstraints = false
        price.textAlignment = .right
        price.font = UIFont.boldSystemFont(ofSize: 20)
        price.textColor = .black
        addSubview(price)
        
        creationDate = UILabel()
        creationDate.translatesAutoresizingMaskIntoConstraints = false
        creationDate.textAlignment = .right
        creationDate.font = UIFont.systemFont(ofSize: 15)
        creationDate.textColor = .gray
        addSubview(creationDate)
        
        priority = UILabel()
        priority.translatesAutoresizingMaskIntoConstraints = false
        priority.textAlignment = .right
        priority.font = UIFont.systemFont(ofSize: 15)
        priority.textColor = .gray
        addSubview(priority)
        
        descriptionTitle.translatesAutoresizingMaskIntoConstraints = false
        descriptionTitle.textAlignment = .left
        descriptionTitle.font = UIFont.boldSystemFont(ofSize: 20)
        descriptionTitle.textColor = .black
        descriptionTitle.text = "Description"
        addSubview(descriptionTitle)
        
        adDescription = UILabel()
        adDescription.translatesAutoresizingMaskIntoConstraints = false
        adDescription.textAlignment = .left
        adDescription.font = UIFont.systemFont(ofSize: 18)
        adDescription.textColor = .black
        adDescription.numberOfLines = 0
        adDescription.contentMode = .scaleAspectFit
        addSubview(adDescription)
        
        categorie = UILabel()
        categorie.translatesAutoresizingMaskIntoConstraints = false
        categorie.textAlignment = .left
        categorie.font = UIFont.systemFont(ofSize: 15)
        categorie.textColor = .gray
        addSubview(categorie)
        
        NSLayoutConstraint.activate([
            adTitle.topAnchor.constraint(equalTo: adImage.bottomAnchor, constant: 10),
            adTitle.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: -5),
            adTitle.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -5),
            
            categorie.topAnchor.constraint(equalTo: adTitle.bottomAnchor),
            categorie.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: -5),
            
            price.topAnchor.constraint(equalTo: categorie.bottomAnchor, constant: 10),
            price.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: -5),
            
            creationDate.topAnchor.constraint(equalTo: price.bottomAnchor, constant: 10),
            creationDate.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: -5),
            
            priority.topAnchor.constraint(equalTo: creationDate.bottomAnchor),
            priority.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: -5),
            
            descriptionTitle.topAnchor.constraint(equalTo: priority.bottomAnchor, constant: 15),
            descriptionTitle.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: -5),

            adDescription.topAnchor.constraint(equalTo: descriptionTitle.bottomAnchor, constant: 5),
            adDescription.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: -5),
            adDescription.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -5),
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
