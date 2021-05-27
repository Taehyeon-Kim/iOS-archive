//
//  ViewController.swift
//  PreviewPractice
//
//  Created by taehy.k on 2021/05/27.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameBackgroundView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        imageView.image = UIImage(named: "avatar4")
        
        backgroundView.backgroundColor = .blue
        backgroundView.layer.cornerRadius = backgroundView.frame.height / 2
        
        backgroundView.layer.shadowColor = UIColor.black.cgColor
        backgroundView.layer.shadowOffset = CGSize(width: 200, height: 200)
        backgroundView.layer.shadowRadius = 12
        
        nameLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        nameLabel.text = "말랑이"
        
        nameBackgroundView.layer.cornerRadius = nameBackgroundView.frame.height / 2
    }
}

