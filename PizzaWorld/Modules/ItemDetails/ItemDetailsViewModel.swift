//
//  ItemDetailsViewModel.swift
//  PizzaWorld
//
//  Created by Muhammad Ewaily on 26/12/2020.
//

import Foundation
import RxCocoa
import RxSwift

protocol ItemDetailsViewModelOutput {
    var displayMainData: PublishSubject<ProductViewModel> { get }
}

protocol ItemDetailsViewModelInput {
    func viewDidLoad()
}

class ItemDetailsViewModel: ViewModel, ItemDetailsViewModelOutput, ItemDetailsViewModelInput {
    var displayMainData: PublishSubject<ProductViewModel> = .init()
    
    func viewDidLoad() {
        let productViewModel = ProductViewModel(product)
        displayMainData.onNext(productViewModel)
    }
    
    let product: Product
    
    init(product: Product) {
        self.product = product
    }
}
