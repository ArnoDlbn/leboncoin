//
//  AdDetailViewController.swift
//  leboncoin
//
//  Created by Arnaud Dalbin on 19/11/2021.
//

import UIKit

class AdDetailViewController: UIViewController {
    
    // MARK: - Properties
    
    var adView: AdDetailView!
    var adInfo: Ad?
    var listOfCategories: [Category]?
    
    // MARK: - View life cycle
    
    override func loadView() {
        let view = AdDetailView()
        view.backgroundColor = .white
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        (self.view as! AdDetailView).adTitle.text = "\(adInfo!.title)"
        (self.view as! AdDetailView).adDescription.text = "\(adInfo!.description)"
        
        if let categories = listOfCategories {
            for category in categories {
                if category.id == adInfo?.category_id {
                    (self.view as! AdDetailView).categorie.text = "\(category.name)"
                }
            }
        }
        
        (self.view as! AdDetailView).price.text = "\(adInfo!.price.clean) €"
        
        if let creationDate = adInfo?.formattedCreationDate {
            (self.view as! AdDetailView).creationDate.text = "\(creationDate)"
        }
        
        if adInfo?.is_urgent == true {
            (self.view as! AdDetailView).priority.text = "Vente urgente"
        }
        
        if let thumbImage = adInfo?.images_url.thumb {
            if let imageData = NSData(contentsOf: NSURL(string: "\(thumbImage)")! as URL) {
                (self.view as! AdDetailView).adImage.image = UIImage(data: imageData as Data)
            } else {
                (self.view as! AdDetailView).adImage.image = UIImage(named: "noPhoto")
                (self.view as! AdDetailView).adImage.contentMode = .scaleAspectFit
            }
        }
    }
}
