//
//  ImageViewTableViewCell.swift
//  KLICKAT_replication3
//
//  Created by Sierra 4 on 08/03/17.
//  Copyright © 2017 code-brew. All rights reserved.
//

import UIKit

class ImageViewTableViewCell: UITableViewCell {
    
    var imageNumber = 0
    
    @IBOutlet weak var searchProduct: UISearchBar!
    @IBOutlet weak var collectionImages: UICollectionView!
    @IBOutlet weak var collectionCellForImages: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let nibName = UINib(nibName: "ImageViewCollectionViewCell", bundle: nil)
        collectionImages.register(nibName, forCellWithReuseIdentifier: "collectionCellImageView")
        collectionImages.delegate = self
        collectionImages.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
extension ImageViewTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let CollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCellImageView", for: indexPath) as! ImageViewCollectionViewCell
        return CollectionCell
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        var visible = CGRect()
        visible.origin = collectionImages.contentOffset
        visible.size = collectionImages.bounds.size
        let visiblePoint = CGPoint(x: visible.midX, y: visible.midY)
        let visibleIndexPath  = collectionImages.indexPathForItem(at: visiblePoint)
        if visibleIndexPath == [0, 9] {
            imageNumber = imageNumber + 1
            print(imageNumber)
        }
        if imageNumber == 1 {
            collectionImages.scrollToItem(at: IndexPath(row: 0, section: 0 ), at: .centeredHorizontally, animated: true)
        }
    }

}
