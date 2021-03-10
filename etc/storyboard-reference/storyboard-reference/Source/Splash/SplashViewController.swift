//
//  SplashViewController.swift
//  storyboard-reference
//
//  Created by taehy.k on 2021/03/10.
//

import UIKit

class SplashViewController: BaseViewController {

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBAction
    @IBAction func presentMainButtonTouchUpInside(_ sender: UIButton) {
        let mainTabBarController = UIStoryboard(name: "MainStoryboard", bundle: nil).instantiateViewController(identifier: "MainTabBarController")
        
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = mainTabBarController
            UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: nil)
        } else {
            mainTabBarController.modalPresentationStyle = .overFullScreen
            self.present(mainTabBarController, animated: true, completion: nil)
        }
    }
}
