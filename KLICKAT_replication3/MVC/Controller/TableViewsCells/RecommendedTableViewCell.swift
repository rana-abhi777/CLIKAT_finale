//
//  RecommendedTableViewCell.swift
//  KLICKAT_replication3
//
//  Created by Sierra 4 on 08/03/17.
//  Copyright © 2017 code-brew. All rights reserved.
//

import UIKit

class RecommendedTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitleSection: UILabel!
    @IBOutlet weak var RecommendedCollection: UICollectionView!
    
    let recommendedNibName = collectionCellsNibNames.recommendedCollection.rawValue
    let collectionCellID = collectionCellsReuseID.recommendedCollection.rawValue
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let nibName = UINib(nibName: recommendedNibName, bundle:nil)
//        let nibName = UINib(nibName: "RecommendedCollectionViewCell", bundle:nil)
        RecommendedCollection.register(nibName, forCellWithReuseIdentifier: collectionCellID)
        RecommendedCollection.delegate = self
        RecommendedCollection.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension RecommendedTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCellID, for: indexPath) as! RecommendedCollectionViewCell
        return collectionCell
    }
}
