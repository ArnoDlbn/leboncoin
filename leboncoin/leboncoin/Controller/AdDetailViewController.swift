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
        (self.view as! AdDetailView).categorie.text = "\(adInfo!.category_id)"
        (self.view as! AdDetailView).price.text = "\(adInfo!.price)"
        (self.view as! AdDetailView).creationDate.text = "\(adInfo!.creation_date)"
        (self.view as! AdDetailView).priority.text = "\(adInfo!.is_urgent)"
        
        if let thumbImage = adInfo?.images_url.thumb {
            if let imageData = NSData(contentsOf: NSURL(string: "\(thumbImage)")! as URL) {
                (self.view as! AdDetailView).adImage.image = UIImage(data: imageData as Data)
            }
        }
    }
}
