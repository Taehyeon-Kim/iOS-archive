//
//  ConfirmViewController.swift
//  CoordinatorPattern
//
//  Created by taehy.k on 2021/05/26.
//

import UIKit

class ConfirmViewController: BaseViewController {
    
    var coordinator: ConfirmCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func confirmButtonClicked(_ sender: Any) {
        coordinator?.coordinateToSignIn()
    }
}
