//
//  SizesSelectorViewModel.swift
//  PizzaWorld
//
//  Created by Muhammad Ewaily on 27/12/2020.
//

import Foundation
import RxCocoa
import RxSwift

protocol SizesSelectorViewModelInputs {
    
}

protocol SizesSelectorViewModelOutputs {
    var itemsObservable: Observable<[SizeItemCellViewModel]> {get}
    var numberOfItems: Int {get}
}


class SizesSelectorViewModel: ViewModel, SizesSelectorViewModelInputs, SizesSelectorViewModelOutputs {
    var input: SizesSelectorViewModelInputs {
        return self
    }
    
    var output: SizesSelectorViewModelOutputs {
        return self
    }
    
    private var items: BehaviorRelay<[Size]> = .init(value: [
        .init(name: "Size 1"),
        .init(name: "Size 2")
    ])
    
    private var itemsViewModel: BehaviorRelay<[SizeItemCellViewModel]> = .init(value: [])
    //    Outputs
        var itemsObservable: Observable<[SizeItemCellViewModel]>
    
    init() {
        itemsObservable = itemsViewModel.asObservable()
        let mappedItems: [SizeItemCellViewModel] = items.value.map { (size) in
            return .init(size: size, showPrice: true)
        }
        itemsViewModel.accept(mappedItems)
    }

    var numberOfItems: Int {
        return items.value.count
    }
}
