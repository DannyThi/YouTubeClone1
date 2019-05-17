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
    
    private(set) var channel: Channel? // temp until channel has been set up
    
    init(title: String, subtitle: String, thumbnailImageName: String, channel: Channel) {
        self.title = title
        self.subtitle = subtitle
        self.thumbnailImageName = thumbnailImageName
        numberOfViews = 0
        uploadDate = Date()
        
        self.channel = channel
    }
}

class Channel {
    var name: String!
    var profileImageName: String!
    
    init(name: String, profileImageName: String) {
        self.name = name
        self.profileImageName = profileImageName
    }
}
