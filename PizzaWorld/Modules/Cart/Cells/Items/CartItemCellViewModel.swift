//
//  CartItemCellViewModel.swift
//  PizzaWorld
//
//  Created by Muhammad Ewaily on 29/12/2020.
//

import Foundation

class CartItemCellViewModel {
    let topString: String
    let notesString: String?
    let price: Double
    
    init(_ cartItem: CartItem) {
        let quantity = cartItem.product.quantity
        self.topString = "\(cartItem.product.title) x \(quantity)"
        self.notesString = cartItem.notes
        self.price = cartItem.product.price
    }
}
