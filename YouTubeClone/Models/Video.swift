//
//  Video.swift
//  YouTubeClone
//
//  Created by Thi Danny on 2019/05/16.
//  Copyright © 2019 Spawn Camping Panda. All rights reserved.
//

import Foundation

class Video {
    
    var thumbnailImageName: String!
    var title: String!
    var numberOfViews: NSNumber!
    var uploadDate: NSDate!
    
    var channel: Channel!
}

class Channel {
    var name: String!
    var profileImageName: String!
}
