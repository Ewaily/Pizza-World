//
//  SizeItemCellViewModel.swift
//  PizzaWorld
//
//  Created by Muhammad Ewaily on 28/12/2020.
//

import Foundation

struct SizeItemCellViewModel {
    var topStrings: String
    
    init(size: Size, showPrice: Bool) {
        self.topStrings = size.name
    }
}
