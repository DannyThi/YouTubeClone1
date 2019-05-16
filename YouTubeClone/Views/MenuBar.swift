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

    private let menuItems = ["home","trending","subscriptions","account"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        collectionView.backgroundColor = Constants.youtubeRed
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: "menuCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        //collectionView.allowsSelection = true

        setupViews()
    }
    
    private func setupViews() {
        addSubview(collectionView)
        addConstraints(withVisualFormat: "H:|[v0]|", views: collectionView)
        addConstraints(withVisualFormat: "V:|[v0]|", views: collectionView)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? MenuCell {
            toggleIconColor(forCell: cell)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? MenuCell {
            toggleIconColor(forCell: cell)
        }
    }
    
    private func toggleIconColor(forCell cell: MenuCell) {
        cell.imageView.tintColor = cell.isSelected ? UIColor.white : Constants.itemDeselectedColor
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as? MenuCell else {
            fatalError("Could not dequeue cell.")
        }
        cell.imageView.image = UIImage(named: menuItems[indexPath.item])?.withRenderingMode(.alwaysTemplate)
        cell.imageView.tintColor = Constants.itemDeselectedColor

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
