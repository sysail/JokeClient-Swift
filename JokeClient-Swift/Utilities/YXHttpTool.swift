//
//  YXHttpTool.swift
//  JokeClient-Swift
//
//  Created by Yvan Feng on 2017/6/22.
//  Copyright © 2017年 Yvan Feng. All rights reserved.
//

import UIKit

class YXHttpTool: NSObject {
    
    
    class func requestWithURL(_ urlString: String,completionHandler: @escaping ((_ data: NSDictionary) -> Void )){
        
        let session = URLSession.shared
        var urlRequest = URLRequest.init(url: URL.init(string: urlString)!)
        urlRequest.httpMethod = "GET"
        let dataTask = session.dataTask(with: urlRequest) { (data, responce, error) in
            if error == nil {
                
                let jsonData = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)
                completionHandler(jsonData as! NSDictionary)
            }else{
                
            }
        }
       dataTask.resume()
        
    }
}
