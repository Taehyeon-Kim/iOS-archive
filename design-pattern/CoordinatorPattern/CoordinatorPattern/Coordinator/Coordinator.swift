//
//  Coordinator.swift
//  CoordinatorPattern
//
//  Created by taehy.k on 2021/05/24.
//

import UIKit

protocol Coordinator {
    
    var presenter: UINavigationController { get set }
    
    var childCoordinators: [Coordinator] { get set }
    
    func start()
    
}
