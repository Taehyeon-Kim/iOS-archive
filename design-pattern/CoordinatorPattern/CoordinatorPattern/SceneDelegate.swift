//
//  SceneDelegate.swift
//  CoordinatorPattern
//
//  Created by taehy.k on 2021/05/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var coordinator: MainCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let presenter = UINavigationController()
        coordinator = MainCoordinator(presenter: presenter)
        coordinator?.start()
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = presenter
        window?.makeKeyAndVisible()
    }
}

