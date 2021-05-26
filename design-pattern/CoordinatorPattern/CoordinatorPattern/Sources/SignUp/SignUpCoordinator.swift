//
//  SignUpCoordinator.swift
//  CoordinatorPattern
//
//  Created by taehy.k on 2021/05/26.
//

import UIKit

protocol SignUpFlow: AnyObject {
    func coordinateToConfirm()
    func coordinateToSignIn()
    func dismissToSignIn()
}

class SignUpCoordinator: Coordinator, SignUpFlow {

    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let signUpViewController = UIStoryboard(name: "SignUpStoryboard", bundle: nil).instantiateViewController(identifier: "SignUpViewController") as! SignUpViewController
        signUpViewController.coordinator = self
        navigationController.pushViewController(signUpViewController, animated: true)
    }
    

    func coordinateToConfirm() {
        let confirmCoordinator = ConfirmCoordinator(navigationController: navigationController)
        confirmCoordinator.coordinate(to: confirmCoordinator)
    }
    
    func coordinateToSignIn() {
        let signInCoordinator = SignInCoordinator(navigationController: navigationController)
        signInCoordinator.start()
    }
    
    func dismissToSignIn() {
        navigationController.popViewController(animated: true)
    }
    
}
