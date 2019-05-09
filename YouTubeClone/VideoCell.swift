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
    
    let userProfileImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor.green
        view.layer.cornerRadius = view.bounds.width / 2
        view.clipsToBounds = false
        return view
    }()
    
    let titleLabel: UILabel = {
        let view = UILabel()
        //view.backgroundColor = UIColor.purple
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Title goes here"
        return view
    }()
    
    let subtitleTextView: UITextView = {
        let view = UITextView()
        //view.backgroundColor = UIColor.red
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Subtitle text goes here."
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
        addSubview(userProfileImageView)
        addSubview(titleLabel)
        addSubview(subtitleTextView)
        addSubview(seperatorView)

        // Thumbnail Image View
        addConstraints(withVisualFormat: "H:|-16-[v0]-16-|", views: thumbnailImageView)
        
        // User Profile Image View
        addConstraints(withVisualFormat: "H:|-16-[v0(44)]", views: userProfileImageView)
        
        // Title Label
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal,
                                         toItem: userProfileImageView, attribute: .top,
                                         multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .leading, relatedBy: .equal,
                                         toItem: userProfileImageView, attribute: .trailing,
                                         multiplier: 1, constant: 8))
        
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .trailing, relatedBy: .equal,
                                         toItem: contentView, attribute: .trailing,
                                         multiplier: 1, constant: -16))
        
        // Subtitle Text View
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .top, relatedBy: .equal,
                                         toItem: titleLabel, attribute: .bottom,
                                         multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .leading, relatedBy: .equal,
                                         toItem: titleLabel, attribute: .leading,
                                         multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .trailing, relatedBy: .equal,
                                         toItem: titleLabel, attribute: .trailing,
                                         multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .height, relatedBy: .equal,
                                         toItem: contentView, attribute: .height,
                                         multiplier: 0, constant: 20))
        
        // Seperator View
        addConstraints(withVisualFormat: "H:|[v0]|", views: seperatorView)

        // Vertical Spacing
        addConstraints(withVisualFormat: "V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|",
                       views: thumbnailImageView, userProfileImageView, seperatorView)

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
