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
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var contentLbl: UILabel!
    @IBOutlet weak var imageIV: UIImageView!
    @IBOutlet weak var voteUpCountLbl: UILabel!
    @IBOutlet weak var voteDownCountLbl: UILabel!
    @IBOutlet weak var commentLbl: UILabel!
    @IBOutlet weak var imageViewConstraintHeight: NSLayoutConstraint!
    
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
        
        let user = self.data["user"]
        if ((user as? NSDictionary) != nil)  {
            let userDict = user as! NSDictionary
            
            self.nicknameLbl.text = userDict["login"] as? String
            
            let icon : Any = userDict["thumb"] as Any
            //if value is <null>
            if (icon as! NSObject) != NSNull() {
                let iconUrl = icon as! String
                self.iconImageView.setImage(iconUrl,placeHolder: UIImage(named: "avatar"))
            }else{
                self.iconImageView.image = UIImage(named: "avatar")
            }
            
        }else{
            self.nicknameLbl.text = "匿名"
            self.iconImageView.image = UIImage(named: "avatar")
        }
        
        let time = self.data["published_at"] as! NSNumber
        self.timeLbl.text = String.dateStringFromTimestamp(time.stringValue as NSString)
        
        let vote : Any = self.data["votes"] as Any
        if (vote as! NSObject) != NSNull() {
            let voteDict = vote as! NSDictionary
            
            let voteUp = voteDict["up"] as! NSNumber
            let voteDown = voteDict["down"] as! NSNumber
            
            self.voteUpCountLbl.text = "顶(\(voteUp))"
            self.voteDownCountLbl.text = "踩(\(voteDown))"
        }else{
            self.voteUpCountLbl.text = "顶(0)"
            self.voteDownCountLbl.text = "踩(0)"
        }
        let comments : Any = self.data["comments_count"] as Any
        if comments as! NSObject != NSNull() {
            let commentsCount = comments as! NSNumber
            self.commentLbl.text = "评论(\(commentsCount))"
        }else{
            self.commentLbl.text = "评论(0)"
        }
        
        let imageSrc : NSString = data["image"] as! NSString
        if imageSrc.length == 0 {
            self.imageViewConstraintHeight.constant = 0
        }else{
            self.imageViewConstraintHeight.constant = 112
            let imageUrl : String = data["low_loc"] as! String
            self.imageIV.setImage("http:\(imageUrl)", placeHolder: UIImage(named: "avatar"))
        }
        
    }
    
    
    class func cellHeightByData(_ data: NSDictionary) -> CGFloat {
        let width = UIScreen.main.bounds.size.width;
        let conent = data["content"] as! String
        let height = conent.heightWithConstrainedWidth(width: width - 20, font: UIFont.italicSystemFont(ofSize: 17))
        
        let imageSrc : NSString = data["image"] as! NSString
        if imageSrc.length == 0 {
            
            return height + 121
        }else{
            
            return height + 231
        }
    }
    
}
