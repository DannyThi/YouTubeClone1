//
//  MenuBar.swift
//  YouTubeClone
//
//  Created by Thi Danny on 2019/05/12.
//  Copyright © 2019 Spawn Camping Panda. All rights reserved.
//

import UIKit

class MenuBar: UIView, UICollectionViewDelegate,
                UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    lazy var collectionView = UICollectionView(frame: .zero,
                                               collectionViewLayout: UICollectionViewFlowLayout())

    override init(frame: CGRect) {
        super.init(frame: frame)
        collectionView.backgroundColor = .rbg(red: 230, green: 32, blue: 31)
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: "menuCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        
        setupViews()
    }
    
    private func setupViews() {
        addSubview(collectionView)
        addConstraints(withVisualFormat: "H:|[v0]|", views: collectionView)
        addConstraints(withVisualFormat: "V:|[v0]|", views: collectionView)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath)
        
        //cell.backgroundColor = .blue
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / 4, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
