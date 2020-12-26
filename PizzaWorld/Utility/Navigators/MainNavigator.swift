//
//  MainNavigator.swift
//  PizzaWorld
//
//  Created by Muhammad Ewaily on 26/12/2020.
//

import Foundation
import UIKit

class MainNavigator: Navigator {    
    var coordinator: Coordinator
    enum Destination {
        case Home
        case ItemDetails(product: Product)
    }
    
    required init(coordinator: Coordinator) {
        self.coordinator = coordinator
    }

    func viewController(for destination: Destination, coordinator: Coordinator) -> UIViewController {
        switch destination {
        case .Home:
            let viewModel = HomeViewModel()
            let view = HomeViewController(viewModel: viewModel, coordinator: coordinator)
            return view
        case .ItemDetails(product: let product):
            let viewModel = ItemDetailsViewModel(product: product)
            let view = ItemDetailsViewController(viewModel: viewModel, coordinator: coordinator)
            return view
        }
    }
}
