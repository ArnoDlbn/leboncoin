//
//  Item.swift
//  leboncoin
//
//  Created by Arnaud Dalbin on 18/11/2021.
//

import Foundation

// structures to manage data
struct Ads: Decodable {
    let ads: [Ad]
}

struct Ad: Decodable {
    let id: Int
    let categoryId: Category
    let title: String
    let description: String
    let price: Float
    let imagesUrl: [AdImage]
    let creationDate: String
    let isUrgent: Bool
}

struct AdImage: Decodable {
    let small: String
    let thumb: String
}
