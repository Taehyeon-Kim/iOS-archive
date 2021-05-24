//
//  MainCoordinator.swift
//  CoordinatorPattern
//
//  Created by taehy.k on 2021/05/24.
//

import UIKit

class MainCoordinator: Coordinator {
    
    var presenter: UINavigationController
    
    var childCoordinators: [Coordinator]
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
        self.childCoordinators = []
    }
    
    func start() {
        let vc = MainViewController.instantiate(storyboardName: "Main")
        vc.coordinator = self
        presenter.pushViewController(vc, animated: false)
    }
    
    func showSecondVC() {
        let vc = SecondViewController.instantiate(storyboardName: "Main")
        vc.coordinator = self
        presenter.pushViewController(vc, animated: true)
    }

}
