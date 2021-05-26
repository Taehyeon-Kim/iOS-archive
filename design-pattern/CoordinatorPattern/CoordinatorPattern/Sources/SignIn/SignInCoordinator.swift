//
//  SignInCoordinator.swift
//  CoordinatorPattern
//
//  Created by taehy.k on 2021/05/26.
//

import UIKit

protocol SignInFlow: AnyObject {
    func coordinateToSignUp()
    func coordinateToTabBar()
}

class SignInCoordinator: Coordinator, SignInFlow {

    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let signInViewController = UIStoryboard(name: "SignInStoryboard", bundle: nil).instantiateViewController(identifier: "SignInViewController") as! SignInViewController
        signInViewController.coordinator = self
        navigationController.pushViewController(signInViewController, animated: false)
    }
    
    func coordinateToSignUp() {
        print("move to sign up")
        
        let signUpCoordinator = SignUpCoordinator(navigationController: navigationController)
        coordinate(to: signUpCoordinator)
    }
    
    func coordinateToTabBar() {
        print("move to tab bar")
    }
}
