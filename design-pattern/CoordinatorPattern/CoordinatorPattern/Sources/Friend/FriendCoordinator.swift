//
//  FriendCoordinator.swift
//  CoordinatorPattern
//
//  Created by taehy.k on 2021/05/26.
//

import UIKit

protocol FriendFlow {
    func coordinateToFriendDetail()
}

class FriendCoordinator: Coordinator, FriendFlow {
    var navigationController = UINavigationController()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let friendVC = UIStoryboard(name: "FriendStoryboard", bundle: nil)
            .instantiateViewController(identifier: "FriendViewController") as! FriendViewController
        navigationController.pushViewController(friendVC, animated: true)
    }
    
    func coordinateToFriendDetail() {
        //
        
    }
}
