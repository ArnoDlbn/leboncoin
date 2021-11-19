//
//  Categories.swift
//  leboncoin
//
//  Created by Arnaud Dalbin on 19/11/2021.
//

import Foundation

// structures to manage data
struct Categories: Decodable {
    let categories: [Category]
}

struct Category: Decodable {
    let id: Int
    let name: String
}
