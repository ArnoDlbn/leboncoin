//
//  Item.swift
//  leboncoin
//
//  Created by Arnaud Dalbin on 18/11/2021.
//

import Foundation

// structures to manage data
struct Ad: Decodable {
    let id: Int
    let category_id: Int
    let title: String
    let description: String
    let price: Float
    let images_url: AdImage
    let creation_date: String
    let is_urgent: Bool
}

struct AdImage: Decodable {
    let small: String?
    let thumb: String?
}

extension Ad {
    var formattedCreationDate : String? {
        DateFormatter.getFullDate(date: self.creation_date)
    }
}
