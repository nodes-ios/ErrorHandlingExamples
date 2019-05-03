//
//  AppCoordinator.swift
//  ErrorHandling
//
//  Created by Chris Combs on 02/05/2019.
//Copyright © 2019 Nodes. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    let tabBarController = UITabBarController()
    
    let window: UIWindow
    var children: [Coordinator] = []

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        setupAfterLaunch()
        showMain()
        window.makeKeyAndVisible()
    }

    // MARK: - Flows -

    func showMain() {
        let listNavController = UINavigationController()
        listNavController.tabBarItem = UITabBarItem(title: "List", image: nil, selectedImage: nil)
        let listCoordinator = ErrorListCoordinator(navigationController: listNavController)
        children.append(listCoordinator)
        listCoordinator.start()
     
        
        let loginNavController = UINavigationController()
        loginNavController.tabBarItem = UITabBarItem(title: "Login", image: nil, selectedImage: nil)
        let loginCoordinator = LoginErrorCoordinator(navigationController: loginNavController)
        children.append(loginCoordinator)
        loginCoordinator.start()
        
       
        tabBarController.viewControllers = [listNavController, loginNavController]
        window.rootViewController = tabBarController
        
    }

    // MARK: - Additional Setup -

    func setupAfterLaunch() {
    }
}
