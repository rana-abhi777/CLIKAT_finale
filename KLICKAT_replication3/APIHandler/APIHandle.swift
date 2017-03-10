//
//  APIHandle.swift
//  KLICKAT_replication3
//
//  Created by Sierra 4 on 08/03/17.
//  Copyright © 2017 code-brew. All rights reserved.
//

import Foundation
import Alamofire

class ApiHandler {
    
    class func fetchData(urlStr:String, parameters:[String:Any], completionHandler: @escaping (Any?) -> ())  {
        
        
        Alamofire.request("https://appbean.clikat.com/"+urlStr, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
            
            switch(response.result) {
            case .success(_):
                if response.result.value != nil{
                    do{
                        let json : Any! = try JSONSerialization.jsonObject(with: response.data!, options: JSONSerialization.ReadingOptions.mutableContainers)
                        
                        
                        completionHandler(json)
                    }
                    catch {
                        print("error occured")
                    }
                }
                break
                
            case .failure(_):
                print(response.result.error ?? "error")
                break
                
            }
        }
        
    }
    
    
    
    
    
}
