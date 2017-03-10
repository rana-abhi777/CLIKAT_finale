//
//  AppearFunctionality.swift
//  KLICKAT_replication3
//
//  Created by Sierra 4 on 10/03/17.
//  Copyright © 2017 code-brew. All rights reserved.
//

import Foundation
import UIKit


class Appearance
{
    class func ShowPanel(obj: UIViewController , opr : Direction, identifier: String, completionHandler: @escaping () -> ())
    {
        let OptionViewController : UIViewController = obj.storyboard!.instantiateViewController(withIdentifier: identifier)
        obj.view.addSubview(OptionViewController.view)
        obj.addChildViewController(OptionViewController)
        OptionViewController.view.layoutIfNeeded()
        OptionViewController.view.frame = CGRect(x: opr.direction , y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            OptionViewController.view.frame=CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
        }, completion:{ completed in
            if completed {
                completionHandler()
            }
        })
    }
}
