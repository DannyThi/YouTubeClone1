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
    
    override func setupViews() {
        addSubview(imageView)
        
        addConstraints(withVisualFormat: "H:|[v0]|", views: imageView)
        addConstraints(withVisualFormat: "V:|[v0]|", views: imageView)
        
        //imageView.image = UIImage(named: "")
    }
    
}
