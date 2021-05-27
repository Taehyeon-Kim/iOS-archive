//
//  InstagramDMTVC.swift
//  PreviewPractice
//
//  Created by taehy.k on 2021/05/27.
//

import UIKit

class InstagramDMTVC: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        nameLabel.font = UIFont.systemFont(ofSize: 13)
        messageLabel.font = UIFont.systemFont(ofSize: 13)
        messageLabel.textColor = .blue
        timeLabel.font = UIFont.systemFont(ofSize: 13)
        timeLabel.textColor = .lightGray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setData(imageName: String, name: String, message: String, time: String) {
        if let image = UIImage(named: imageName) {
            self.profileImage.image = image
        }
        self.nameLabel.text = name
        self.messageLabel.text = message
        self.timeLabel.text = time
    }
    
}

#if DEBUG
import SwiftUI

struct InstagramDMTVCRepresentable: UIViewRepresentable {
    typealias UIViewType = InstagramDMTVC
    
    func makeUIView(context: Context) -> InstagramDMTVC {
        return UINib(nibName: "InstagramDMTVC", bundle: nil).instantiate(withOwner: nil, options: nil).first as! InstagramDMTVC
    }
    
    func updateUIView(_ uiView: InstagramDMTVC, context: Context) {
        uiView.setData(imageName: "profile",
                       name: "test_account",
                       message: "Sounds good 😂😂😂",
                       time: ".now")
    }
}

@available(iOS 13.0, *)
struct InstagramDMTVCPreview: PreviewProvider {
    static var previews: some View {
        Group {
            InstagramDMTVCRepresentable()
                .frame(width: 375, height: 72, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            InstagramDMTVCRepresentable()
                .frame(width: 320, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            InstagramDMTVCRepresentable()
                .frame(width: 320, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
        .previewLayout(.sizeThatFits)
        .padding(10)
    }
}
#endif
