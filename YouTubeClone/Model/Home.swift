//
//  Home.swift
//  YouTubeClone
//
//  Created by Thi Danny on 2019/05/26.
//  Copyright © 2019 Spawn Camping Panda. All rights reserved.
//

import Foundation

extension Notification.Name {
    static let dataRecieved = Notification.Name("dataReceived")
}

class Home {
    
    var videos = [Video]()
    
    let updateUI = Notification.Name("updateUI")
    
    // part of model
    func fetchVideos() {
        if let url = URL(string: "https://s3-us-west-2.amazonaws.com/youtubeassets/home.json") {
            let fetch = URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard error == nil else {
                    print(error!.localizedDescription)
                    return
                }
                
                do {
                    if let serializedJSON = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [[String : AnyObject]] {
                        for dictionary in serializedJSON {
                            
                            let channelDictionary = dictionary["channel"] as! [String : AnyObject]
                            let channel = Channel(name: channelDictionary["name"] as! String,
                                                  profileImageName: channelDictionary["profile_image_name"] as! String)
                            
                            let video = Video(title: dictionary["title"] as! String,
                                              subtitle: "",
                                              thumbnailImageName: dictionary["thumbnail_image_name"] as! String,
                                              channel: channel)
                            
                            self.videos.append(video)
                        }
                        
                        
                        // we should fire off another request for image data
                        
                        NotificationCenter.default.post(name:.dataRecieved, object: self)
                    }
                } catch let jsonError {
                    print(jsonError.localizedDescription)
                }
            }
            fetch.resume()
        } else {
            print("Couldnt load videos")
        }
    }
}
