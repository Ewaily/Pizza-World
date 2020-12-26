//
//  CustomTabBarController.swift
//  PizzaWorld
//
//  Created by Muhammad Ewaily on 26/12/2020.
//

import UIKit

class CustomTabBarController: UITabBarController {
    var coordinator: Coordinator
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    enum TabBarItems: Int, CaseIterable {
        case Home
        case PizzaMaker
        case Cart
    }
    
    lazy var middleButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "pizza"), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9019607843, green: 0.1647058824, blue: 0.2509803922, alpha: 1)
        button.cornerRadius = 30.0
        button.imageEdgeInsets = .init(top: 0, left: 5, bottom: 0, right: 0)
        button.addTarget(self, action: #selector(didPressMiddleButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setValue(CustomTabBar(), forKey: "tabBar")
        setupTabBarItems()
        setupTabBarUI()
        createMiddleButton()
    }
    
    private func setupTabBarItems() {
        self.viewControllers = TabBarItems.allCases.map {
            let view = viewControllerForTabBarItem($0)
            let navigation = UINavigationController(rootViewController: view)
            return navigation
            
        }
    }
    
    private func setupTabBarUI() {
        tabBar.tintColor = #colorLiteral(red: 0.9019607843, green: 0.1647058824, blue: 0.2509803922, alpha: 1)
        tabBar.unselectedItemTintColor = #colorLiteral(red: 0.0431372549, green: 0.1254901961, blue: 0.1921568627, alpha: 1)
        tabBar.items?[TabBarItems.PizzaMaker.rawValue].isEnabled = false
    }
    
    func viewControllerForTabBarItem(_ item: TabBarItems) -> UIViewController {
        switch item {
        case .Home:
            let view = coordinator.main.viewController(for: .Home, coordinator: coordinator)
            view.tabBarItem = tabBarItem(for: item)
            return view
        case .PizzaMaker:
            let view = coordinator.main.viewController(for: .Home, coordinator: coordinator)
            view.tabBarItem = tabBarItem(for: item)
            return view
        case .Cart:
            let view = coordinator.main.viewController(for: .Home, coordinator: coordinator)
            view.tabBarItem = tabBarItem(for: item)
            return view
        }
    }
    
    private func tabBarItem(for item: TabBarItems) -> UITabBarItem? {
        let tabBarItem: UITabBarItem
        switch item {
        case .Home:
            tabBarItem = .init(title: "Home", image: #imageLiteral(resourceName: "group4"), selectedImage: #imageLiteral(resourceName: "group4"))
        case .PizzaMaker:
            return nil
        case .Cart:
            tabBarItem = .init(title: "Cart", image: #imageLiteral(resourceName: "iconfinderIcShoppingCart48Px3669231"), selectedImage: #imageLiteral(resourceName: "iconfinderIcShoppingCart48Px3669231"))
        }
        tabBarItem.titlePositionAdjustment = .init(horizontal: 0, vertical: 15)
        tabBarItem.imageInsets = .init(top: 10, left: 0, bottom: -10, right: 0)
        return tabBarItem
    }
    
    private func createMiddleButton() {
        self.tabBar.addSubview(middleButton)
        middleButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            middleButton.centerXAnchor.constraint(equalTo: self.tabBar.centerXAnchor),
            middleButton.widthAnchor.constraint(equalToConstant: 60.0),
            middleButton.heightAnchor.constraint(equalToConstant: 60.0),
            middleButton.topAnchor.constraint(equalTo: self.tabBar.topAnchor, constant: -10)
        ])
    }
    
    @objc func didPressMiddleButton() {
        print("Middle Button Pressed!")
    }
}
