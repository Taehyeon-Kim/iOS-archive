//
//  Coordinator.swift
//  CoordinatorPattern
//
//  Created by taehy.k on 2021/05/24.
//

// Coordinator 프로토콜
// 가장 먼저 해야할 작업

import UIKit

protocol Coordinator {
    func start()
    func coordinate(to coordinator: Coordinator)
    
}

extension Coordinator {
    func coordinate(to coordinator: Coordinator) {
        coordinator.start()
    }
}
