//
//  Extensions.swift
//  YouTubeClone
//
//  Created by Thi Danny on 2019/05/11.
//  Copyright © 2019 Spawn Camping Panda. All rights reserved.
//

import UIKit

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
