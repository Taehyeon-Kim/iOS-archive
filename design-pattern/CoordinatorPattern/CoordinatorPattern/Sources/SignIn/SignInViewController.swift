//
//  SignInViewController.swift
//  CoordinatorPattern
//
//  Created by taehy.k on 2021/05/26.
//

import UIKit

class SignInViewController: BaseViewController {
    
    var coordinator: SignInCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func loginButtonClicked(_ sender: Any) {
        // 메인 탭바로 이동
        coordinator?.coordinateToTabBar()
    }
    
    @IBAction func signUpButtonClicked(_ sender: Any) {
        coordinator?.coordinateToSignUp()
    }

}
