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
    
    let imageNibName = collectionCellsNibNames.imageCollection.rawValue
    let collectionCellID = collectionCellsReuseID.imageCollection.rawValue
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let nibName = UINib(nibName: imageNibName, bundle: nil)
        collectionImages.register(nibName, forCellWithReuseIdentifier: collectionCellID)
        collectionImages.delegate = self
        collectionImages.dataSource = self
        //self.startTimer()
    }
    func scrollToNextCell(){
        
        let cellSize = CGSize(width: self.collectionImages.frame.width, height: self.collectionImages.frame.height)
        let contentOffset = collectionImages.contentOffset;
        collectionImages.scrollRectToVisible(CGRect(x: contentOffset.x, y: contentOffset.y, width: cellSize.width, height: cellSize.height), animated: true)
    }
    
    func startTimer() {
        
        _ = Timer.scheduledTimer(timeInterval: 2.0,
                                 target: self,
                                 selector: #selector(scrollToNextCell),
                                 userInfo: nil,
                                 repeats: false)
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
        self.startTimer()
        if indexPath.row == 9 {
            scrollViewDidEndScrollingAnimation(collectionImages)
        }
        let CollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCellID, for: indexPath) as! ImageViewCollectionViewCell
        return CollectionCell
    }
//    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//        let targetContentOffset = scrollView.contentOffset
//        // set acceleration to 0.0
//        var pageWidth = Float(self.collectionImages.bounds.size.width)
//        var minSpace: Int = 10
//        var cellToSwipe: Int = Int((scrollView.contentOffset.x)) / Int(pageWidth + Float(minSpace)) + Int(0.5)
//        // cell width + min spacing for lines
//        if cellToSwipe < 0 {
//            cellToSwipe = 0
//        }
//        else if cellToSwipe >= 9 {
//            cellToSwipe = self.articles.count - 1
//        }
//        
//        self.collectionImages.scrollToItem(at: IndexPath(row: cellToSwipe, section: 0), at: .left, animated: true)
//    }
    
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        var visible = CGRect()
//        visible.origin = collectionImages.contentOffset
//        visible.size = collectionImages.bounds.size
//        let visiblePoint = CGPoint(x: visible.midX, y: visible.midY)
//        let visibleIndexPath  = collectionImages.indexPathForItem(at: visiblePoint)
//        if visibleIndexPath == [0, 9] {
//            imageNumber = imageNumber + 1
//            print(imageNumber)
//        }
//        if imageNumber == 1 {
//            collectionImages.scrollToItem(at: IndexPath(row: 0, section: 0 ), at: .centeredHorizontally, animated: true)
//            imageNumber = 0
//        }
//    }
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
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
            imageNumber = 0
        }

    }

}
