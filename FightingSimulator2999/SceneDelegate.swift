//
//  SceneDelegate.swift
//  FightingSimulator2999
//
//  Created by Teacher on 11.03.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: scene)
        let coordinator: AppCoordinator = .shared

        #if TESTS
        let configurator = AppConfigurator()
//        #else
//        let configurator = RestConfigurator()
        #endif
        configurator.configure()

        coordinator.window = window
        coordinator.start()
        window.makeKeyAndVisible()
        self.window = window
    }

}

