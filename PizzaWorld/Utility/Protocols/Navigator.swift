//
//  Navigator.swift
//  PizzaWorld
//
//  Created by Muhammad Ewaily on 26/12/2020.
//

import Foundation
import UIKit

enum NavigatorTypes {
    case push
    case present
//    case presentWithNavigation
    case root
}

protocol Navigator {
    associatedtype Destination
    func viewController(for destination: Destination, coordinator: Coordinator) -> UIViewController
    init(coordinator: Coordinator)
    var coordinator: Coordinator { get }
    func navigate(to destination: Destination, with navigationType: NavigatorTypes)
}


extension Navigator {
    func navigate(to destination: Destination,
                  with navigationType: NavigatorTypes = .push) {
        let viewController = self.viewController(for: destination, coordinator: coordinator)
        switch navigationType {
        case .push:
            coordinator.navigationController?.pushViewController(viewController, animated: true)
        case .present:
            coordinator.navigationController?.present(viewController, animated: true, completion: nil)
//            viewController.modalPresentationStyle = .overCurrentContext
//            coordinator.tabBar.present(viewController, animated: true, completion: nil)
//        case .presentWithNavigation:
//            let newVC = self.viewController(for: destination, coordinator: coordinator.subCoordinator)
////            let navigationController = coordinator.navigationController.root
//            coordinator.navigationController?.setViewControllers([newVC], animated: true)
//            coordinator.tabBar.present(coordinator.navigationController!, animated: true, completion: nil)
        case .root:
            coordinator.navigationController?.setViewControllers([viewController], animated: true)
        }
    }
}
