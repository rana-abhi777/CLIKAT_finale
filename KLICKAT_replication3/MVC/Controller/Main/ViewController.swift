//
//  ViewController.swift
//  KLICKAT_replication3
//
//  Created by Sierra 4 on 08/03/17.
//  Copyright © 2017 code-brew. All rights reserved.
//

import UIKit
import ObjectMapper
import Alamofire
import SVProgressHUD


class ViewController: UIViewController {
    
    var superFrameWidth = Int()
    
    @IBOutlet weak var btnSideMenu: UIButton!
    @IBOutlet weak var tableMainTable: UITableView!
    
    var flag: Int = 0
    var categoryName = [String]()
    var categoryImageUrls = [String]()
    
    func handlePan(_ gestureRecognizer: UIPanGestureRecognizer)
    {    var difference : CGFloat
        let translation = gestureRecognizer.location(in: self.view)
        if( gestureRecognizer.state == .ended){
            let translation1 = view.frame.width/2
            difference = translation.x - translation1
            if(difference >= 0.0)
            {   if (flag == 0){
                Appearance.ShowPanel(obj: self,opr: .left,identifier: "LeftMenuViewController"){_ in
                    self.flag = 1
                    }
                }
            }
        }
    }
    func fetchData()
    {
        let param:[String:Any] = ["areaId": 201, "countryId": 1, "flag":"1"]
        
        SVProgressHUD.show()
        SVProgressHUD.setDefaultAnimationType(SVProgressHUDAnimationType.native)
        SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.custom)
        
        
        ApiHandler.fetchData(urlStr: "get_all_category", parameters: param) { (jsonData) in
            //print(jsonData!)
            SVProgressHUD.show()
            SVProgressHUD.setDefaultAnimationType(SVProgressHUDAnimationType.native)
            SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.custom)
            let userModel = Mapper<Categorydata>().map(JSONObject: jsonData)
            let categoryArray = userModel?.data?.english
            print(categoryArray?[0].name ?? "no value fetched")
            for category in categoryArray! {
                self.categoryName.append(category.name!)
                self.categoryImageUrls.append(category.image!)
            }
            SVProgressHUD.dismiss()
            self.tableMainTable.reloadData()
            
        }

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        view.addGestureRecognizer(gestureRecognizer)
        fetchData()
        superFrameWidth = Int(view.frame.size.width)
        
        
    }
    
    
    @IBAction func SideMenuClick(_ sender: Any) {
        self.btnSideMenu.isEnabled = false
        Appearance.ShowPanel(obj: self,opr: .left,identifier: "LeftMenuViewController"){_ in
            self.btnSideMenu.isEnabled = true
            }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tableCellMain", for: indexPath) as? MainTableViewCell else{
//            fatalError()
//        }
        switch(indexPath.row){
        case 0:
            let cell = Bundle.main.loadNibNamed("ImageViewTableViewCell", owner: self, options: nil)?.first as! ImageViewTableViewCell
            
            return cell
        case 1:
            let cell = Bundle.main.loadNibNamed("ProductCategoryTableViewCell", owner: self, options: nil)?.first as! ProductCategoryTableViewCell
            cell.categoryName = self.categoryName
            cell.frameWidth = self.superFrameWidth
            cell.categoryImageUrls = self.categoryImageUrls
            return cell
        case 2:
            let cell = Bundle.main.loadNibNamed("OffersTableViewCell", owner: self, options: nil)?.first as! OffersTableViewCell
            return cell
        case 3:
            let cell = Bundle.main.loadNibNamed("RecommendedTableViewCell", owner: self, options: nil)?.first as! RecommendedTableViewCell
            return cell
        default:
            let cell = Bundle.main.loadNibNamed("ImageTableViewCell", owner: self, options: nil)?.first as! ImageViewTableViewCell
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch(indexPath.row){
        case 0:
            return 234
        case 1:
            return 980
        case 2:
            return 161
        case 3:
            return 161
        default:
            return 100
        }
    }
}
