//
//  ProductViewModel.swift
//  PizzaWorld
//
//  Created by Muhammad Ewaily on 27/12/2020.
//

import Foundation

class ProductViewModel {
    let mainTitle: String
    
    init(_ product: Product) {
        self.mainTitle = product.title 
    }
}
