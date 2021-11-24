//
//  Float.swift
//  leboncoin
//
//  Created by Arnaud DALBIN on 23/11/2021.
//

import Foundation

extension Float {
    var clean: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
