//
//  ViewController.swift
//  NotificationBanner
//
//  Created by taehy.k on 2021/05/23.
//

import UIKit
import NotificationBannerSwift

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    // MARK: - Properties
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // MARK: - IBActions
    @IBAction func showBannerButtonClicked(_ sender: Any) {
        // 버튼 클릭 시에 배너 나오도록
        let banner = FloatingNotificationBanner(title: "배너 테스트",
                                        subtitle: "메시지가 도착했습니다🙋🏻‍♂️",
                                        style: .success)

        // cornerRadius랑 shadow 줄 수 있고, 안에 옵션 넣어줘야 원하는 floating 형태로 만들 수 있음
        banner.show(cornerRadius: 10,
                    shadowBlurRadius: 15)
        
        // tap으로 banner dismiss 가능
        banner.onTap = {
            print("tap")
        }
        
        // swipe로 banner dismiss 가능
        banner.onSwipeUp = {
            print("swipe")
        }
    }
}

