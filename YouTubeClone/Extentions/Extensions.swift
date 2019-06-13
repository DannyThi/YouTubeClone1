//
//  Extensions.swift
//  YouTubeClone
//
//  Created by Thi Danny on 2019/05/11.
//  Copyright © 2019 Spawn Camping Panda. All rights reserved.
//

import UIKit

struct Constants {
    static let youtubeRed = UIColor.rbg(red: 230, green: 32, blue: 31)
    static let itemDeselectedColor = UIColor.rbg(red: 91, green: 14, blue: 13)
}

extension Notification.Name {
    static let videoDataRecieved = Notification.Name("videoDataReceived")
    static let imageRecieved = Notification.Name("imageRecieved")
}

extension UIView {
    func addConstraints(withVisualFormat format: String, views: UIView...) {
        
        var viewsDictionary = [String : UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        let constraint = NSLayoutConstraint.constraints(withVisualFormat: format,
                                                        options: NSLayoutConstraint.FormatOptions(),
                                                        metrics: nil,
                                                        views: viewsDictionary)
        addConstraints(constraint)
    }
}

extension UIColor {
    static func rbg(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}

extension UIImageView {
    func loadImageUsingURLString(string: String) {
        guard let url = URL(string: string) else { return }
        
        DispatchQueue.global().async {
            [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
