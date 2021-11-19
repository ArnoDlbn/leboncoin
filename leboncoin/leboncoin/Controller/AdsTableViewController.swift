//
//  AdsTableViewController.swift
//  leboncoin
//
//  Created by Arnaud Dalbin on 19/11/2021.
//

import UIKit

class AdsTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    let service = AdService()
    let service2 = CategoryService()
    var listOfAds = [Ad]()
    var listOfCat = [Category]()
    
    let adsTableViewCell = "adsTableViewCell"
    var searchActivity = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "ADS"
        
        searchActivity.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(searchActivity)
        NSLayoutConstraint.activate([
            searchActivity.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            searchActivity.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        
        activityIndicator(activityIndicator: searchActivity, showActivityIndicator: true)
        service.getAds(completionHandler: { (ads, error) in
            DispatchQueue.main.async {
                if error == nil {
                    if let data = ads {
                        self.listOfAds = data
                    } else {
                        self.alert(title: "Erreur", message: "Veuillez vérifier votre connexion !")
                    }
                } else {
                    self.alert(title: "Erreur", message: "\(String(describing: error))")
                }
                self.tableView.reloadData()
                self.activityIndicator(activityIndicator: self.searchActivity, showActivityIndicator: false)
            }
        })
        //        service2.getCategories(completionHandler: { (cat, error) in
        //            DispatchQueue.main.async {
        //                if error == nil {
        //                    if let data = cat {
        //                        self.listOfCat = data.categories
        //                    } else {
        //                        self.alert(title: "Erreur", message: "Veuillez vérifier votre connexion !")
        //                    }
        //                } else {
        //                    self.alert(title: "Erreur", message: "\(String(describing: error))" + "2")
        //                }
        //                self.tableView.reloadData()
        //                self.activityIndicator(activityIndicator: self.searchActivity, showActivityIndicator: false)
        //            }
        //        })
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: adsTableViewCell)
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfAds.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: adsTableViewCell, for: indexPath)
        let ad = listOfAds[indexPath.row]
        
        cell.textLabel?.text = ad.title
        
        if let smallImage = ad.images_url.small {
            if let imageData = NSData(contentsOf: NSURL(string: "\(smallImage)")! as URL) {
                cell.imageView?.image = UIImage(data: imageData as Data)
            }
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let adInfo = listOfAds[indexPath.row]
        let adDetailViewController = AdDetailViewController()
        adDetailViewController.adInfo = adInfo
        self.navigationController?.pushViewController(adDetailViewController, animated: true)
    }
}
