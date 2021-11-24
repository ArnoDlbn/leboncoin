//
//  AdsTableViewController.swift
//  leboncoin
//
//  Created by Arnaud Dalbin on 19/11/2021.
//

import UIKit

class AdsTableViewController: UITableViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    // MARK: - Properties
    
    let service = AdService()
    let service2 = CategoryService()
    var listOfAds = [Ad]()
    var listOfFilteredAds = [Ad]()
    var listOfCat = [Category]()
    
    let adsTableViewCell = "adsTableViewCell"
    var searchActivity = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
    var categoriesPickerView = UIPickerView()
    var pickerViewRow: Int = 0
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Annonces"
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        let backBarButtonImage = UIImage(systemName: "xmark.circle.fill")
        self.navigationController?.navigationBar.backIndicatorImage = backBarButtonImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backBarButtonImage
        self.navigationController?.navigationBar.tintColor = UIColor.lightGray
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(AdsTableViewController.filtersTapped(_:)))
        let rightBarButtonImage = UIImage(systemName: "slider.horizontal.3")
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.gray
        self.navigationItem.rightBarButtonItem?.image = rightBarButtonImage
        
        searchActivity.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(searchActivity)

        NSLayoutConstraint.activate([
            searchActivity.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            searchActivity.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ])
        
        activityIndicator(activityIndicator: searchActivity, showActivityIndicator: true)
        service.getAds(completionHandler: { (ads, error) in
            DispatchQueue.main.async {
                if error == nil {
                    if let data = ads {
                        self.listOfAds = data.sorted {
                            if $0.is_urgent == $1.is_urgent {
                                return $0.creation_date < $1.creation_date
                            } else {
                                return $0.is_urgent && !$1.is_urgent
                            }
                        }
                        self.listOfFilteredAds = self.listOfAds
                    } else {
                        self.alert(title: "Erreur", message: "Veuillez vérifier votre connexion !")
                    }
                }
                self.tableView.reloadData()
                self.activityIndicator(activityIndicator: self.searchActivity, showActivityIndicator: false)
            }
        })
        service2.getCategories(completionHandler: { (cat, error) in
            DispatchQueue.main.async {
                if error == nil {
                    if let data = cat {
                        self.listOfCat = data
                        let newCategory: Category = Category(id: 0, name: "Toutes")
                        self.listOfCat.insert(newCategory, at: 0)
                    } else {
                        self.alert(title: "Erreur", message: "Veuillez vérifier votre connexion !")
                    }
                }
                self.tableView.reloadData()
                self.activityIndicator(activityIndicator: self.searchActivity, showActivityIndicator: false)
            }
        })
        
        tableView.register(AdTableViewCell.self, forCellReuseIdentifier: adsTableViewCell)
        self.tableView.reloadData()
        
    }
    
    @objc func filtersTapped(_ sender: AnyObject) {
        categoriesPickerView = UIPickerView.init()
        categoriesPickerView.delegate = self
        categoriesPickerView.dataSource = self
        categoriesPickerView.backgroundColor = UIColor.white
        categoriesPickerView.layer.borderColor = UIColor.lightGray.cgColor
        categoriesPickerView.layer.borderWidth = 2
        categoriesPickerView.layer.cornerRadius = 10
        categoriesPickerView.translatesAutoresizingMaskIntoConstraints = false
        categoriesPickerView.setValue(UIColor.black, forKey: "textColor")
        categoriesPickerView.contentMode = .center
        categoriesPickerView.selectRow(pickerViewRow, inComponent: 0, animated: true)
        self.tableView.addSubview(categoriesPickerView)
        
        categoriesPickerView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        categoriesPickerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfFilteredAds.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: adsTableViewCell, for: indexPath) as! AdTableViewCell
        
        if listOfFilteredAds.count == 0 {
            return cell
        } else {
            let ad = listOfFilteredAds[indexPath.row]
            
            cell.adTitle.text = ad.title
            cell.price.text = "\(ad.price.clean) €"
            
            if ad.is_urgent == true {
                cell.adPriority.text = "Vente urgente"
                cell.adPriorityImage.image = UIImage(systemName: "exclamationmark.triangle.fill")
            }
            
            if let creationDate = ad.formattedCreationDate {
                cell.creationDate.text = "\(creationDate)"
            }
            
            for category in listOfCat {
                if category.id == ad.category_id {
                    cell.adCategory.text = "\(category.name)"
                }
            }
            
            if let smallImage = ad.images_url.small {
                if let imageData = NSData(contentsOf: NSURL(string: "\(smallImage)")! as URL) {
                    cell.adImage.image = UIImage(data: imageData as Data)
                } else {
                    cell.adImage.image = UIImage(named: "noPhoto")
                    cell.adImage.contentMode = .scaleAspectFit
                }
            }
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let adInfo = listOfFilteredAds[indexPath.row]
        let adDetailViewController = AdDetailViewController()
        adDetailViewController.adInfo = adInfo
        adDetailViewController.listOfCategories = listOfCat
        self.navigationController?.pushViewController(adDetailViewController, animated: true)
    }
    
    // MARK: - Picker view data source
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return listOfCat.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return listOfCat[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if listOfCat[row].id == 0 {
            listOfFilteredAds = listOfAds
        } else {
            listOfFilteredAds = listOfAds.filter {
                $0.category_id == listOfCat[row].id
            }
        }
        self.pickerViewRow = row
        categoriesPickerView.removeFromSuperview()
        self.tableView.reloadData()
    }
}
