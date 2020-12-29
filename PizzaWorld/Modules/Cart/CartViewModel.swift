//
//  CartViewModel.swift
//  PizzaWorld
//
//  Created by Muhammad Ewaily on 29/12/2020.
//

import Foundation
import RxCocoa
import RxSwift

protocol CartViewModelOutput {
    var cartItemsObservables: Observable<[CartItemCellViewModel]> { get }
    var itemHeaderDidChangeObservable: Observable<CartHeaderCellViewModel> {get}
}

protocol CartViewModelInput {}

class CartViewModel: ViewModel, CartViewModelInput, CartViewModelOutput {
    var itemHeaderDidChangeObservable: Observable<CartHeaderCellViewModel>
    var cartHeaderViewModel: CartHeaderCellViewModel?
    
    var inputs: CartViewModelInput {
        return self
    }

    var outputs: CartViewModelOutput {
        return self
    }

    var cartItemsObservables: Observable<[CartItemCellViewModel]>
    let disposeBag = DisposeBag()

    private var cartItems: BehaviorRelay<[CartItemCellViewModel]> = .init(value: [])
    private var itemHeaderDidChange: PublishSubject<CartHeaderCellViewModel> = .init()

    init() {
        cartItemsObservables = cartItems.asObservable()
        itemHeaderDidChangeObservable = itemHeaderDidChange.asObserver()
        bind()
    }

    func bind() {
        CartManager.shared.itemsObservable.subscribe { [weak self] items in
            guard let self = self, let items = items.element else { return }
            let mappedItems = items.map(CartItemCellViewModel.init)
            self.cartHeaderViewModel = .init()
            self.cartItems.accept(mappedItems)
        }.disposed(by: disposeBag)
    }
}
