//
//  BackFunctionality.swift
//  KLICKAT_replication3
//
//  Created by Sierra 4 on 10/03/17.
//  Copyright © 2017 code-brew. All rights reserved.
//

import Foundation
import UIKit


class Back
{
    class func backPanel(obj: UIViewController,opr: Direction)
    {
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            obj.view.frame = CGRect(x: opr.backdirection, y: 0, width: UIScreen.main.bounds.size.width,height: UIScreen.main.bounds.size.height)
            obj.view.layoutIfNeeded()
            obj.view.backgroundColor = UIColor.clear
        }, completion: { (finished) -> Void in
            obj.view.removeFromSuperview()
            obj.removeFromParentViewController()
        })
    }
}
