//
//  ProductCategoryTableViewCell.swift
//  KLICKAT_replication3
//
//  Created by Sierra 4 on 08/03/17.
//  Copyright © 2017 code-brew. All rights reserved.
//

import UIKit
import Kingfisher

class ProductCategoryTableViewCell: UITableViewCell {
    var itemCount = Int()
    
    var categoryName = [String]()
    var categoryImageUrls = [String]()
    var frameWidth = Int()
    
    let productNibName = collectionCellsNibNames.productCollection.rawValue
    let collectionCellID = collectionCellsReuseID.productCollection.rawValue
    
    @IBOutlet weak var collectionProductCategory: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let nibname = UINib(nibName: productNibName, bundle: nil)
        collectionProductCategory.register(nibname, forCellWithReuseIdentifier: collectionCellID)
        collectionProductCategory.delegate = self
        collectionProductCategory.dataSource = self
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
extension ProductCategoryTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryName.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCellID, for: indexPath) as! ProductCategoryCollectionViewCell
        let name = categoryName[indexPath.item]
        let image = categoryImageUrls[indexPath.item]
        let url = URL(string: image)
        collectionCell.btnProductCategoryName.setTitle(name, for: .normal)
        collectionCell.imgBackground.kf.setImage(with: url)
        if indexPath.row == (categoryName.count - 1) {
            collectionCell.frame.size.width = CGFloat(frameWidth - 20)
            collectionCell.frame.size.height = 150
        }
        
        return collectionCell
    }
    
}
