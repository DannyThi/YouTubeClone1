//
//  ViewController.swift
//  YouTubeClone
//
//  Created by Thi Danny on 2019/05/07.
//  Copyright © 2019 Spawn Camping Panda. All rights reserved.
//

import UIKit

class HomeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Properties
    
    private let menuBar = MenuBar()
    
    // Generate some temporary videos
    
    private var videos: [Video] = {
        let kanyeChannel = Channel(name: "Kanye West", profileImageName: "kayne_profile")
        let taylorChannel = Channel(name: "Taylor Swift", profileImageName: "taylor_swift_profile")
        
        let video0 = Video(title: "Bad blood - feat. some guy",
                           subtitle: "This is some random text.",
                           thumbnailImageName: "taylor_swift_bad_blood",
                           channel: taylorChannel)
        video0.numberOfViews = 5789529852807
        
        let video1 = Video(title: "Blank Space - ???",
                           subtitle: "This is some random text.",
                           thumbnailImageName: "taylor_swift_blank_space",
                           channel: taylorChannel)
        video1.numberOfViews = 509275053
        
        let video2 = Video(title: "Some Random Title that looks cool",
                           subtitle: "This is some random text.",
                           thumbnailImageName: "taylor_swift_blank_space",
                           channel: kanyeChannel)
        video2.numberOfViews = 94758292444
        
        return [video0, video1, video2]
    }()
    
    
    
    // MARK:- View Controller Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewController()
        setupMenuBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Preselects the first item in the MenuBar
        let indexPath = IndexPath(item: 0, section: 0)
        menuBar.collectionView.selectItem(at: indexPath, animated: false, scrollPosition: [])
        menuBar.collectionView(menuBar.collectionView, didSelectItemAt: indexPath)
    }
    
    

    
    // MARK:- Collection View Methods
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "videoCell", for: indexPath) as? VideoCell else {
            fatalError("Cannot dequeue menu cell")
        }
        
        cell.video = videos[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.bounds.width - 32) * 9 / 16
        // includes all the insets and height of subviews.
        return CGSize(width: view.bounds.width, height: 16 + height + 68)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    // MARK:- Setup code
    
    private func setupViewController() {
        let homeLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.bounds.width - 32, height: view.bounds.height))
        homeLabel.text = "Home"
        
        // TODO: Change the fontsize of the homeLabel
        
        homeLabel.textColor = .white
        navigationItem.titleView = homeLabel
        
        let searchIconImage = UIImage(named: "search_icon")?.withRenderingMode(.alwaysOriginal)
        let searchIcon = UIBarButtonItem(image: searchIconImage, style: .plain, target: self, action: #selector(handleSearch))
        
        let moreIconImage = UIImage(named: "nav_more_icon")?.withRenderingMode(.alwaysOriginal)
        let moreIcon = UIBarButtonItem(image: moreIconImage, style: .plain, target: self, action: #selector(handleMore))
        
        navigationItem.rightBarButtonItems = [moreIcon, searchIcon]
        
        collectionView.backgroundColor = .white
        collectionView.register(VideoCell.self, forCellWithReuseIdentifier: "videoCell")
    }
    
    private func setupMenuBar() {
        view.addSubview(menuBar)
        
        view.addConstraints(withVisualFormat: "H:|[v0]|", views: menuBar)
        view.addConstraints(withVisualFormat: "V:|[v0(50)]", views: menuBar)
    }
    
    @objc private func handleSearch() {
        print("Search")
    }
    
    @objc private func handleMore() {
        print("More")
    }
    
}
