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
        let url = URL(string: string)!
        
        let fetch = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
            }
        }
        fetch.resume()
    }
}
