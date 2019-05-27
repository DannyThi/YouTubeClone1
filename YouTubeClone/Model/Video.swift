//
//  Video.swift
//  YouTubeClone
//
//  Created by Thi Danny on 2019/05/16.
//  Copyright © 2019 Spawn Camping Panda. All rights reserved.
//

import Foundation

class Video {
    
    private(set) var title: String!
    private(set) var subtitle: String!
    private(set) var thumbnailImageName: String!
    var numberOfViews: NSNumber!
    
    private var uploadDate: Date!
    
    public var dateUploaded: String {
        get {
            let dateformatter = DateFormatter()
            dateformatter.dateStyle = .medium
            return dateformatter.string(from: uploadDate)
        }
    }
    
    private(set) var channel: Channel!
    
    init(title: String, subtitle: String, thumbnailImageName: String, channel: Channel) {
        self.title = title
        self.subtitle = subtitle
        self.thumbnailImageName = thumbnailImageName
        numberOfViews = 0
        uploadDate = Date()
        
        self.channel = channel
    }
}


