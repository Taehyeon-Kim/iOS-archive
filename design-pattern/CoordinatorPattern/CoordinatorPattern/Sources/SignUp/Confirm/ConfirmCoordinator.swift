//
//  ConfirmCoordinator.swift
//  CoordinatorPattern
//
//  Created by taehy.k on 2021/05/26.
//

import UIKit

protocol ConfirmFlow: AnyObject {
    func coordinateToSignIn()
}

class ConfirmCoordinator: Coordinator, ConfirmFlow {
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = UIStoryboard(name: "ConfirmStoryboard", bundle: nil)
            .instantiateViewController(identifier: "ConfirmViewController") as! ConfirmViewController
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func coordinateToSignIn() {
        let signInCoordinator = SignInCoordinator(navigationController: navigationController)
        coordinate(to: signInCoordinator)
    }
}
