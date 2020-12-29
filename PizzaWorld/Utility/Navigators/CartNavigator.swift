//
//  CartNavigator.swift
//  PizzaWorld
//
//  Created by Muhammad Ewaily on 29/12/2020.
//

import Foundation
import UIKit

class CartNavigator: Navigator {
    var coordinator: Coordinator
    
    private let storyboard: AppStoryboard = .Cart
    enum Destination {
        case Cart
    }

    required init(coordinator: Coordinator) {
        self.coordinator = coordinator
    }

    func viewController(for destination: Destination, coordinator: Coordinator) -> UIViewController {
        switch destination {
        case .Cart:
            let view = CartViewController.instantiate(fromAppStoryboard: storyboard)
            let viewModel = CartViewModel()
            view.coordinator = coordinator
            view.viewModel = viewModel
            return view
        }
    }
}
