//
//  OffersTableViewCell.swift
//  KLICKAT_replication3
//
//  Created by Sierra 4 on 08/03/17.
//  Copyright © 2017 code-brew. All rights reserved.
//

import UIKit

class OffersTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitleName: UILabel!
    @IBOutlet weak var btnViewAll: UIButton!
    @IBOutlet weak var offersCollection: UICollectionView!
    
    let offersNibName = collectionCellsNibNames.offersCollection.rawValue
    let collectionCellID = collectionCellsReuseID.offersCollection.rawValue
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let nibname = UINib(nibName: offersNibName, bundle: nil)
        offersCollection.register(nibname, forCellWithReuseIdentifier: collectionCellID)
        offersCollection.delegate = self
        offersCollection.dataSource = self

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension OffersTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let CollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCellID, for: indexPath) as! OffersCollectionViewCell
        return CollectionCell
    }

}
