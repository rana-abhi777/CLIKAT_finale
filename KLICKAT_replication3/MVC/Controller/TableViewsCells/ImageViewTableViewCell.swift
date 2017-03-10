//
//  ImageViewTableViewCell.swift
//  KLICKAT_replication3
//
//  Created by Sierra 4 on 08/03/17.
//  Copyright © 2017 code-brew. All rights reserved.
//

import UIKit

class ImageViewTableViewCell: UITableViewCell {

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
//    func scrollToNextCell(){
//        
//        //get cell size
//        let cellSize = CGSize(self.view.frame.width, self.collectionImages.frame.height)
//        
//        //get current content Offset of the Collection view
//        let contentOffset = collectionImages.contentOffset;
//        
//        if collectionView.contentSize.width <= collectionView.contentOffset.x + cellSize.width
//        {
//            collectionView.scrollRectToVisible(CGRectMake(0, contentOffset.y, cellSize.width, cellSize.height), animated: true);
//            
//        } else {
//            collectionView.scrollRectToVisible(CGRectMake(contentOffset.x + cellSize.width, contentOffset.y, cellSize.width, cellSize.height), animated: true);
//            
//        }
//        
//    }
//    
//    /**
//     Invokes Timer to start Automatic Animation with repeat enabled
//     */
//    func startTimer() {
//        Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(ImageViewTableViewCell.scrollToNextCell), userInfo: nil, repeats: true);
//    }
//    
}
extension ImageViewTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let CollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCellImageView", for: indexPath) as! ImageViewCollectionViewCell
        return CollectionCell
    }

}
