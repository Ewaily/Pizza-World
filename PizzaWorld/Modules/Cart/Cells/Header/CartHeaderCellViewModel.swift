//
//  CartHeaderCellViewModel.swift
//  PizzaWorld
//
//  Created by Muhammad Ewaily on 29/12/2020.
//

import Foundation

class CartHeaderCellViewModel {
    var itemsCount: String
    var totalCost: String
    
    init() {
        totalCost = "$\(CartManager.shared.totalCoast)"
        if CartManager.shared.itemsCount == 1 {
            itemsCount = "\(CartManager.shared.itemsCount) Item"
        }
        else {
            itemsCount = "\(CartManager.shared.itemsCount) Items"
        }
    }
}
