//
//  NetworkManager.swift
//  YouTubeClone
//
//  Created by Hai Long Danny Thi on 2019/06/13.
//  Copyright © 2019 Spawn Camping Panda. All rights reserved.
//

import UIKit

var imageCache = NSCache<NSString, UIImage>()


class NetworkManager {
    
    static let urlString = "https://s3-us-west-2.amazonaws.com/youtubeassets/home.json"
    
    static func fetchVideoData() {
        guard let url = URL(string: urlString) else { return }
        
        var videos = [Video]()

        let dispatchGroup = DispatchGroup()
        DispatchQueue.global().async(group: dispatchGroup) {
            if let data = try? Data(contentsOf: url) {
                do {
                    if let serializedJSON =
                        try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [[String : AnyObject]]
                    {
                        for dictionary in serializedJSON {
                            let channelDictionary = dictionary["channel"] as! [String : AnyObject]
                            
                            let channel = Channel(name: channelDictionary["name"] as! String, profileImageURL: channelDictionary["profile_image_name"] as! String)
                            NetworkManager.downloadImageData(fromURL: channel.profileImageURL, group: dispatchGroup)
                            
                            let video = Video(title: dictionary["title"] as! String, subtitle: "", thumbnailImageURL: dictionary["thumbnail_image_name"] as! String, channel: channel)
                            NetworkManager.downloadImageData(fromURL: video.thumbnailImageURL, group: dispatchGroup)
                            videos.append(video)
                        }
                    }
                } catch let jsonError {
                    print(jsonError.localizedDescription)
                }
            }
        }
        
        dispatchGroup.notify(queue: DispatchQueue.main) {
            print("NetworkManager: All video data recieved.")
            NotificationCenter.default.post(name:.videoDataRecieved, object: self, userInfo: ["videos": videos])
        }
    }
    
    static func downloadImageData(fromURL urlString: String, group: DispatchGroup? = nil) {
        guard let url = URL(string: urlString) else { return }
        
        group?.enter()
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    defer { group?.leave() }
                    imageCache.setObject(image, forKey: NSString(string: urlString))
                    print("Networkmanager.downloadImageData: Image recieved.")
                }
            }
        }
    }
}
