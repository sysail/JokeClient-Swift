//
//  YXLatestViewController.swift
//  JokeClient-Swift
//
//  Created by Yvan Feng on 2017/6/22.
//  Copyright © 2017年 Yvan Feng. All rights reserved.
//

import UIKit

class YXLatestViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    let identifier = "JokeCell"
    
    var dataArray = NSMutableArray()
    
    
    lazy var tableView = { () -> UITableView in
        let tv : UITableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - (self.tabBarController?.tabBar.frame.size.height)!), style: UITableViewStyle.plain)
        tv.separatorStyle = UITableViewCellSeparatorStyle.none
        tv.dataSource = self
        tv.delegate = self
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view .addSubview(self.tableView)
        self.tableView .register(UINib.init(nibName: "YXJokeCell", bundle: nil), forCellReuseIdentifier: identifier)
        loadData()
    }

    
    //MARK: Request
    func loadData(){
        let url = "http://m2.qiushibaike.com/article/list/suggest?count=20&page=1"
        YXHttpTool .requestWithURL(url) { (data) in
            if data == NSNull(){
                return
            }
            
            let array = data["items"] as! NSArray
            for a in array {
                self.dataArray .add(a)
            }
            
            self.tableView.reloadData()
        }
    }
    
    //MARK: DataSource & Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! YXJokeCell
        cell.data = dataArray[indexPath.row] as! NSDictionary
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let dict = dataArray[indexPath.row] as! NSDictionary
        return YXJokeCell.cellHeightByData(dict)
    }
    
}

