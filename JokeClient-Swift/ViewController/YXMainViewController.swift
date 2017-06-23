//
//  YXMainViewController.swift
//  JokeClient-Swift
//
//  Created by Yvan Feng on 2017/6/22.
//  Copyright © 2017年 Yvan Feng. All rights reserved.
//

import UIKit

class YXMainViewController: UITabBarController {
    
    let tabbarBGColor : UIColor = UIColor.init(red: 251/255.0, green: 173/255.0, blue: 60/255.0, alpha: 1)
    
    let itemArray = ["最新","热门","真相","关于"]
    
    
    //MARK: Life style
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = itemArray[0]
        
        initViewControllers()
    }

    //MARK: Private function
    func initViewControllers() -> Void {
        let latestVC = YXLatestViewController()
        latestVC.tabBarItem.title = itemArray[0]
        
        let hotVC = YXHotViewController()
        hotVC.tabBarItem.title = itemArray[1]
        
        let truethVC = YXTruthViewController()
        truethVC.tabBarItem.title = itemArray[2]

        let aboutVC = YXAboutViewController()
        aboutVC.tabBarItem.title = itemArray[3]
        
        self.viewControllers = [latestVC,hotVC,truethVC,aboutVC]
        
    }
    
    //MARK: Delegate
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        self.title = item.title
    }
    

}
