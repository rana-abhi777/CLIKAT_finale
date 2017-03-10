//
//  LeftMenuViewController.swift
//  KLICKAT_replication3
//
//  Created by Sierra 4 on 09/03/17.
//  Copyright © 2017 code-brew. All rights reserved.
//

import UIKit

class LeftMenuViewController: UIViewController {
    
    @IBOutlet weak var tableMenuMain: UITableView!
    @IBOutlet weak var viewSideMenu: UIView!
    @IBOutlet weak var btnProfilePic: UIButton!
    @IBOutlet weak var lblWelcomeMessage: UILabel!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var btnLocationOfUser: UIButton!
    var rowCount = Int()
    var nameArray = [["Home", "Live Support", "Cart", "Promotions", "Notifications", "Compare Products"],
                     ["Rate my order", "Order History", "Loyalit Points", "Share app", "Terms & Conditions", "About Us", "Settings"]
                     ]
    var MyAccountArray = ["Rate my order", "Order History", "Loyalit Points", "Share app", "Terms & Conditions", "About Us", "Settings"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableMenuMain.separatorStyle = .none
//        viewSideMenu.backgroundColor = UIColor(pattternImage: UIImage(named: "darkImg"))
        // Do any additional setup after loading the view.
        if !UIAccessibilityIsReduceTransparencyEnabled() {
            self.viewSideMenu.backgroundColor = UIColor.clear
            
            let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            
            //always fill the view
            blurEffectView.frame = self.viewSideMenu.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
            self.view.addSubview(blurEffectView) //if you have more UIViews, use an insertSubview API to place it where needed
            self.view.sendSubview(toBack: blurEffectView)
        
        } else {
            //self.viewSideMenu.backgroundColor = UIColor.black
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        Back.backPanel(obj: self,opr: .left)
    }
}
extension LeftMenuViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return nameArray.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            rowCount = 6
        }
        else if section == 1 {
            rowCount = 7
        }
        return rowCount
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "SideBarTableCell", for: indexPath) as! SideMenuTableViewCell
        tableCell.backgroundColor = UIColor.clear
        
//        if rowCount == 6 {
//            tableCell.btnMenuItems.setTitle(nameArray[0][indexPath.row], for: .normal)
//        }
//        else if rowCount == 7 {
//            tableCell.btnMenuItems.setTitle(nameArray[1][indexPath.row], for: .normal)
//        }
        tableCell.btnMenuItems.setTitle(MyAccountArray[indexPath.row], for: .normal)
        return tableCell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        
        switch section {
        case 0: 
            //headerCell.btnheaderName.setTitle("Main Section", for: .normal)
            let  headerCell = tableView.dequeueReusableCell(withIdentifier: "SideBarTableHeaderCell") as! SideMenuTableViewHeaderCell
        
            return headerCell
        default:
            let  headerCell = tableView.dequeueReusableCell(withIdentifier: "SideBarTableHeaderCell") as! SideMenuTableViewHeaderCell
            headerCell.btnheaderName.setTitle("Accounts", for: .normal)
            return headerCell
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return CGFloat.leastNormalMagnitude
        default:
            return 44
        }
    }
}
