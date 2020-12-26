//
//  AppDelegate.swift
//  PizzaWorld
//
//  Created by Muhammad Ewaily on 10/20/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var coordinator: AppCoordinator!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        coordinator = AppCoordinator()
        coordinator.start()
        
        return true
    }
 
}

