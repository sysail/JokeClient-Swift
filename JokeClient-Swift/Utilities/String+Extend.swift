//
//  String+Extend.swift
//  JokeClient-Swift
//
//  Created by Yvan Feng on 2017/6/26.
//  Copyright © 2017年 Yvan Feng. All rights reserved.
//

import UIKit

extension String {
    
    func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        return boundingBox.height
    }
    
    static func dateStringFromTimestamp(_ timeStamp:NSString)->String
    {
        let ts = timeStamp.doubleValue
        let  formatter = DateFormatter ()
        formatter.dateFormat = "yyyy年MM月dd日 HH:MM:ss"
        let date = Date(timeIntervalSince1970 : ts)
        return  formatter.string(from: date)
        
    }
}
