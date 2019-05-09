//
//  VideoCell.swift
//  YouTubeClone
//
//  Created by Thi Danny on 2019/05/07.
//  Copyright © 2019 Spawn Camping Panda. All rights reserved.
//

import UIKit

class VideoCell: UICollectionViewCell {
    
    let thumbnailImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor.blue
        return view
    }()
    
    
    let seperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }

    func setupView() {
        // We need to add the views before we can apply constraints.
        addSubview(thumbnailImageView)
        addSubview(seperatorView)

        // Thumbnail Image View
        addConstraints(withVisualFormat: "H:|-16-[v0]-16-|", views: thumbnailImageView)
        
        // Seperator View
        addConstraints(withVisualFormat: "H:|[v0]|", views: seperatorView)

        
        // Vertical Spacing
        addConstraints(withVisualFormat: "V:|-16-[v0]-16-[v1(1)]|", views: thumbnailImageView, seperatorView)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
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
