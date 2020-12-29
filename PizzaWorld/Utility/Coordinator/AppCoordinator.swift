//
//  AppCoordinator.swift
//  PizzaWorld
//
//  Created by Muhammad Ewaily on 26/12/2020.
//

import Foundation
import UIKit

protocol Coordinator {
    var main: MainNavigator { get }
    var cart: CartNavigator { get }
    var navigationController: UINavigationController? { get }
}

class AppCoordinator: Coordinator {
    let window: UIWindow
    lazy var main: MainNavigator = {
        return .init(coordinator: self)
    }()
    
    lazy var cart: CartNavigator = {
        return .init(coordinator: self)
    }()
    
    private lazy var tabBar: CustomTabBarController = {
        return CustomTabBarController(coordinator: self)
    }()
    
    var navigationController: UINavigationController? {
        if let navigationController = tabBar.selectedViewController as? UINavigationController {
            return navigationController
        }
        return nil
    }
    
    init(window: UIWindow = UIWindow()) {
        self.window = window
    }
    
    func start() {
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
    
    var rootViewController: UIViewController {
        return tabBar
    }
}
