//
//  ViewController.swift
//  floating
//
//  Created by huangyu on 16/8/26.
//  Copyright © 2016年 huangyu. All rights reserved.
//

import UIKit

enum ShowView{
    case Left
    case Center
    case Right
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var leftTableView: UITableView!
    var rightView: UIView!
    var centerView: UIView!
    let duration: NSTimeInterval = 0.3
    var curShowView: ShowView!
    
    let leftCellName = ["本地文件","远程回话","报警详情","推送设置","本地设置","远程遥控","远程设置","帮助"]
    

    override func viewDidLoad() {
//        sleep(1)
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        leftTableView = self.view.viewWithTag(1) as! UITableView
        leftTableView.delegate = self
        leftTableView.dataSource = self
        
        rightView = self.view.viewWithTag(2)
        centerView = self.view.viewWithTag(3)
        
        self.view.addSubview(leftTableView)
        self.view.addSubview(rightView)
        self.view.addSubview(centerView)
        
        curShowView = ShowView.Center
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
    
    
    @IBAction func showLeftView(sender: UIBarButtonItem) {
        if curShowView != ShowView.Left {
            UIView.animateWithDuration(duration) {
                self.centerView.frame.origin.x += 200
            }
            curShowView = ShowView.Left
        }
    }
}

