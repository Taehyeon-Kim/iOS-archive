//
//  BaseViewController.swift
//  CoordinatorPattern
//
//  Created by taehy.k on 2021/05/26.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true
    }

}
