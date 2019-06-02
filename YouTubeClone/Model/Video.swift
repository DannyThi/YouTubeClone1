//
//  Video.swift
//  YouTubeClone
//
//  Created by Thi Danny on 2019/05/16.
//  Copyright © 2019 Spawn Camping Panda. All rights reserved.
//

import Foundation

// this is bad!
var imageCache = NSCache<NSString, AnyObject>()

class Video: ObjectWithImageData {
    
    private(set) var title: String!
    private(set) var subtitle: String!
    private(set) var thumbnailImageURL: String {
        get {
            return imageURL
        }
        set {
            imageURL = newValue
        }
    }

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
    
    init(title: String, subtitle: String, thumbnailImageURL: String, channel: Channel) {
        super.init()
        self.title = title
        self.subtitle = subtitle
        self.thumbnailImageURL = thumbnailImageURL
        numberOfViews = 0
        uploadDate = Date()
        
        self.channel = channel
    }
}


class ObjectWithImageData {

    open var imageURL: String!

    func getImageData() {
        let url = URL(string: imageURL)!
        let fetch = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            DispatchQueue.main.async {
                [weak self] in
                guard let self = self else { return }
                imageCache.setObject(data as AnyObject, forKey: NSString(string: self.imageURL))
                print("Image: [\(String(describing: self.imageURL))] downloaded")
                NotificationCenter.default.post(name: Notification.Name(rawValue: self.imageURL), object: self)
            }
        }
        fetch.resume()
    }
}


