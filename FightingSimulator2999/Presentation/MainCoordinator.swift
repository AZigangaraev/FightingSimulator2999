//
//  MainCoordinator.swift
//  FightingSimulator2999
//
//  Created by Лада on 11.03.2023.
//

import UIKit

class MainCoordinator {

    func start() -> UIViewController {
        let viewController = UIViewController()
        self.viewController = viewController
        viewController.viewControllers = [ shopping(), profile(), ]
        return viewController
    }

    private let storyboard: UIStoryboard = .init(name: "Main", bundle: nil)

    private func shopping() -> UIViewController {
        let controller: CatalogViewController = storyboard.instantiateViewController(identifier: "FighViewController")
//        controller.tabBarItem = .init(
//            title: "Catalog",
//            image: .init(systemName: "cart"),
//            selectedImage: .init(systemName: "cart.fill")
//        )
        return controller
    }

    private func profile() -> UIViewController {
        let controller: ProfileViewController = storyboard.instantiateViewController(identifier: "ProfileViewController")
        controller.tabBarItem = .init(
            title: "Profile",
            image: .init(systemName: "person.circle"),
            selectedImage: .init(systemName: "person.circle.fill")
        )
        return controller
    }
}
