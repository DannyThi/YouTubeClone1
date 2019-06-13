//
//  Channel.swift
//  YouTubeClone
//
//  Created by Thi Danny on 2019/05/17.
//  Copyright © 2019 Spawn Camping Panda. All rights reserved.
//

import Foundation

class Channel {
    var name: String!
    private(set) var profileImageURL: String!
    
    init(name: String, profileImageURL: String) {
        self.name = name
        self.profileImageURL = profileImageURL
    }
}
