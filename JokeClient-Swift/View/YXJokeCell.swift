//
//  YXJokeCell.swift
//  JokeClient-Swift
//
//  Created by Yvan Feng on 2017/6/22.
//  Copyright © 2017年 Yvan Feng. All rights reserved.
//

import UIKit

class YXJokeCell: UITableViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nicknameLbl: UILabel!
    @IBOutlet weak var contentLbl: UILabel!
    @IBOutlet weak var imageIV: UIImageView!
    @IBOutlet weak var topCountLbl: UILabel!
    @IBOutlet weak var upCountLbl: UILabel!
    @IBOutlet weak var commentLbl: UILabel!
    
    var data : NSDictionary!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard self.data != nil else {
            return
        }
        
        let content = self.data["content"]
        self.contentLbl.text = content as? String
    }
    
    
}
