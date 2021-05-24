//
//  AppDelegate.swift
//  CoordinatorPattern
//
//  Created by taehy.k on 2021/05/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: MainCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let presenter = UINavigationController()
        coordinator = MainCoordinator(presenter: presenter)
        coordinator?.start()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = presenter
        window?.makeKeyAndVisible()
        
        return true
    }


}

