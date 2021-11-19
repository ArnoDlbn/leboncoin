//
//  UIViewController.swift
//  leboncoin
//
//  Created by Arnaud Dalbin on 19/11/2021.
//

import UIKit

extension UIViewController {
   
    // method to display an alert
    func alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style:.default, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    
    // method to manage activity controller
    func activityIndicator(activityIndicator: UIActivityIndicatorView, showActivityIndicator: Bool){
        activityIndicator.isHidden = !showActivityIndicator
        if showActivityIndicator == true {
            activityIndicator.startAnimating()
        }
    }
}
