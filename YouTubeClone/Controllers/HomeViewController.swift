//
//  ViewController.swift
//  YouTubeClone
//
//  Created by Thi Danny on 2019/05/07.
//  Copyright © 2019 Spawn Camping Panda. All rights reserved.
//

import UIKit

struct Constants {
    static let youtubeRed = UIColor.rbg(red: 230, green: 32, blue: 31)
    static let itemDeselectedColor = UIColor.rbg(red: 91, green: 14, blue: 13)
}

class HomeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let menuBar = MenuBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        //navigationItem.title = "Home"
        let homeLabel = UILabel(frame: CGRect(x: 0, y: 0,
                                              width: view.bounds.width - 32,
                                              height: view.bounds.height))
        homeLabel.text = "Home"
//        homeLabel.font.withSize(30)
//        homeLabel.adjustsFontSizeToFitWidth = false
        homeLabel.textColor = .white
        navigationItem.titleView = homeLabel
        
        collectionView.backgroundColor = .white
        collectionView.register(VideoCell.self, forCellWithReuseIdentifier: "videoCell")
        
        setupMenuBar()
    }
    
    private func setupMenuBar() {
        view.addSubview(menuBar)
        
        view.addConstraints(withVisualFormat: "H:|[v0]|", views: menuBar)
        view.addConstraints(withVisualFormat: "V:|[v0(50)]", views: menuBar)
    }
    
    // MARK:- Collection View Methods
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "videoCell", for: indexPath)
        

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.bounds.width - 32) * 9 / 16
        
        // includes all the insets and height of subviews.
        return CGSize(width: view.bounds.width, height: 16 + height + 68)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
