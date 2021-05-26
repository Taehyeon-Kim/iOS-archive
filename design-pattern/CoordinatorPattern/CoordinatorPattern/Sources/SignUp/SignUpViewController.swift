//
//  SignUpViewController.swift
//  CoordinatorPattern
//
//  Created by taehy.k on 2021/05/26.
//

import UIKit

class SignUpViewController: BaseViewController {
    
    var coordinator: SignUpCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func signUpCompleteButtonClicked(_ sender: Any) {
        coordinator?.coordinateToConfirm()
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
//        coordinator?.dismissToSignIn()
        coordinator?.coordinateToSignIn()
    }
}
