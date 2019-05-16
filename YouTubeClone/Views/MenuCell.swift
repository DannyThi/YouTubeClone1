//
//  MenuCell.swift
//  YouTubeClone
//
//  Created by Thi Danny on 2019/05/12.
//  Copyright © 2019 Spawn Camping Panda. All rights reserved.
//

import UIKit

class MenuCell: BaseCell {
    
    let imageView = UIImageView()
    
//    override var isHighlighted: Bool {
//        didSet {
//            imageView.tintColor = isHighlighted ? UIColor.white : Constants.itemDeselectedColor
//        }
//    }
    
//    override var isSelected: Bool {
//        didSet {
//            imageView.tintColor = isSelected ? UIColor.white : Constants.itemDeselectedColor
//        }
//    }
    
    override func setupViews() {
        addSubview(imageView)
        
        addConstraints(withVisualFormat: "H:[v0(28)]", views: imageView)
        addConstraints(withVisualFormat: "V:[v0(28)]", views: imageView)
        
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal,
                                         toItem: self, attribute: .centerX,
                                         multiplier: 1, constant: 0))
        
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal,
                                         toItem: self, attribute: .centerY,
                                         multiplier: 1, constant: 0))
    }
    
}
