//
//  commonClass.swift
//  KLICKAT_replication3
//
//  Created by Sierra 4 on 09/03/17.
//  Copyright © 2017 code-brew. All rights reserved.
//

import Foundation


class CommonClass {
    var category: [English]?
    
    func setTheValue(categorySent: [English]) {
        category = categorySent
        print(category?[2].name ?? "no value fetched")
    }
}
