//
//  CartManager.swift
//  PizzaWorld
//
//  Created by Muhammad Ewaily on 29/12/2020.
//

import Foundation
import RxCocoa
import RxSwift

class CartManager {
    static var shared = CartManager()
    
    private var items: BehaviorRelay<[CartItem]> = .init(value: [])
    var itemsObservable: Observable<[CartItem]>
    
    var totalCoast: Double {
        var totalCoast: Double = 0
        for item in items.value {
            totalCoast += item.product.price
        }
        return totalCoast
    }
    
    var itemsCount: Int {
        return items.value.count
    }
    
    init() {
        itemsObservable = items.asObservable()
    }
    
    func add(product: Product, notes: String? = nil) {
        if let productIndex = items.value.firstIndex(where: { (item) -> Bool in
            item.product.title == product.title
        }) {
            var dataCopy = items.value
            dataCopy[productIndex].product.quantity += 1
            items.accept(dataCopy)
        }
        else {
            let cartItem = convertProductToCartItem(product, notes: notes)
            var newData = items.value
            newData.append(cartItem)
            items.accept(newData)
        }
    }
    
    private func convertProductToCartItem(_ product: Product, notes: String? = nil) -> CartItem {
        return .init(product: product, notes: notes)
    }
}
