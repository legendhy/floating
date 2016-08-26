//
//  ViewController.swift
//  floating
//
//  Created by huangyu on 16/8/26.
//  Copyright © 2016年 huangyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var leftTableView: UITableView!
    var rightView: UIView!
    
    let leftCellName = ["本地文件","远程回话","报警详情","推送设置","本地设置","远程遥控","远程设置","帮助"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        leftTableView = self.view.viewWithTag(1) as! UITableView
        leftTableView.delegate = self
        leftTableView.dataSource = self
        
        rightView = self.view.viewWithTag(2)
        
        self.view.addSubview(leftTableView)
        self.view.addSubview(rightView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return leftCellName.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cellId = "leftViewCell"
        var cell = leftTableView.dequeueReusableCellWithIdentifier(cellId)
        if cell == nil
        {
            cell = leftCellTableViewCell(style: .Value1, reuseIdentifier: cellId)
        }
        cell?.textLabel?.textColor = UIColor.redColor()
        cell?.textLabel?.text = leftCellName[indexPath.row]
        return cell!
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("select row:\(indexPath.row)")
    }
}

