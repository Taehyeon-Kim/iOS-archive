//
//  MainViewController.swift
//  CoordinatorPattern
//
//  Created by taehy.k on 2021/05/24.
//

import UIKit

class MainViewController: UIViewController, Storyboarded {

    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func nextVC(_ sender: Any) {
        coordinator?.showSecondVC()
    }
    
}
