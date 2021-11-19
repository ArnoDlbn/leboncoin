//
//  AdTableViewCellView.swift
//  leboncoin
//
//  Created by Arnaud Dalbin on 19/11/2021.
//

import UIKit

class AdTableViewCell: UITableViewCell {

    let adTitle = UILabel()
    let adDescription = UILabel()
    let price = UILabel()
    let adImage = UIImageView()
    let isUrgent = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()

        adImage.backgroundColor = UIColor.darkGray

        adTitle.translatesAutoresizingMaskIntoConstraints = false
        adDescription.translatesAutoresizingMaskIntoConstraints = false
        price.translatesAutoresizingMaskIntoConstraints = false
        adImage.translatesAutoresizingMaskIntoConstraints = false
        isUrgent.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(adTitle)
        contentView.addSubview(adDescription)
        contentView.addSubview(price)
        contentView.addSubview(adImage)
        contentView.addSubview(isUrgent)

        
    }
}
