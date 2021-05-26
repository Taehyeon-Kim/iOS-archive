//
//  AppCoordinator.swift
//  CoordinatorPattern
//
//  Created by taehy.k on 2021/05/26.
//

import UIKit

class AppCoordinator: Coordinator {

    let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let navigationController = UINavigationController()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        // 시작 Coordinator 지정
        let signInCoordinator = SignInCoordinator(navigationController: navigationController)
        coordinate(to: signInCoordinator)
    }

}
