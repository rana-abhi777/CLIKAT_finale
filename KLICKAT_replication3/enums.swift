//
//  enums.swift
//  KLICKAT_replication3
//
//  Created by Sierra 4 on 15/03/17.
//  Copyright © 2017 code-brew. All rights reserved.
//

import Foundation
enum viewControllers: String {
    case LeftMenu = "LeftMenuViewController"
}

enum tableCellsNibNames: String {
    case imageTable = "ImageViewTableViewCell"
    case productTable = "ProductCategoryTableViewCell"
    case offersTable = "OffersTableViewCell"
    case recommendedTable = "RecommendedTableViewCell"
}

enum heightForTableCell: Int {
    case cell1 = 234
    case cell2 = 980
    case cell3 = 161
    // case 3 to be repeated for 4th cell also
    
}
enum collectionCellsReuseID: String {
    case imageCollection = "collectionCellImageView"
    case productCollection = "collectionCellProduct"
    case offersCollection = "collectionCellOffers"
    case recommendedCollection = "collectionCellRecommended"
}
enum collectionCellsNibNames: String {
    case imageCollection = "ImageViewCollectionViewCell"
    case productCollection = "ProductCategoryCollectionViewCell"
    case offersCollection = "OffersCollectionViewCell"
    case recommendedCollection = "RecommendedCollectionViewCell"

}
enum parameters: String {
    case areaid = "areaId"
    case countryid = "countryId"
}
enum leftMenuCellID: String {
    case header = "SideBarTableHeaderCell"
    case cell = "SideBarTableCell"
}







