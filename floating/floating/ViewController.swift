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
    var changeScreen: UITableView!
    
    let leftCellName = ["本地文件","远程回话","报警详情","推送设置","本地设置","远程遥控","远程设置","帮助"]
    let screenSplitName = ["1","3","4","6","8","9","16"]
    

    override func viewDidLoad() {
//        sleep(1)
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        leftTableView = self.view.viewWithTag(1) as! UITableView
        leftTableView.delegate = self
        leftTableView.dataSource = self
        
        rightView = self.view.viewWithTag(2)
        centerView = self.view.viewWithTag(3)
        
        changeScreen = self.view.viewWithTag(4) as! UITableView
        changeScreen.delegate = self
        changeScreen.dataSource = self
        
        self.view.addSubview(leftTableView)
        self.view.addSubview(rightView)
        self.view.addSubview(centerView)
        self.view.addSubview(changeScreen)
        
        curShowView = ShowView.Center
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if tableView == leftTableView {
            return leftCellName.count
        }
        else if tableView == changeScreen
        {
            return screenSplitName.count
        }
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cellId = "leftViewCell"
        var cell: UITableViewCell!
        if tableView == leftTableView {
            cell = leftTableView.dequeueReusableCellWithIdentifier(cellId)
            if cell == nil
            {
                cell = leftCellTableViewCell(style: .Value1, reuseIdentifier: cellId)
            }
            cell?.textLabel?.textColor = UIColor.redColor()
            cell?.textLabel?.text = leftCellName[indexPath.row]
        }
        else if tableView == changeScreen
        {
            cellId = "changeSplit"
            cell = changeScreen.dequeueReusableCellWithIdentifier(cellId)
            if cell == nil {
                cell = UITableViewCell(style: .Value1, reuseIdentifier: cellId)
            }
            cell.textLabel?.textColor = UIColor.redColor()
            cell.textLabel?.text = screenSplitName[indexPath.row]
            cell.textLabel?.textAlignment = NSTextAlignment.Center
        }
        
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
    
    
    @IBAction func centerViewTap(sender: UITapGestureRecognizer) {
        if curShowView == ShowView.Left {
            UIView.animateWithDuration(duration, animations: { 
                self.centerView.frame.origin.x -= 200
            })
            curShowView = ShowView.Center
        }
        else if curShowView == ShowView.Right
        {
            UIView.animateWithDuration(duration, animations: { 
                self.centerView.frame.origin.x += 200
            })
            curShowView = ShowView.Center
        }
        else if changeScreen.hidden == false
        {
            UIView.animateWithDuration(duration, animations: {
                self.changeScreen.hidden = true
            })
        }
    }
    
    @IBAction func showRightView(sender: UIBarButtonItem) {
//        if curShowView != ShowView.Right {
//            UIView.animateWithDuration(duration, animations: {
//                self.centerView.frame.origin.x -= 200
//            })
//            curShowView = ShowView.Right
//        }
        if changeScreen.hidden == true {
            UIView.animateWithDuration(duration, animations: { 
                self.changeScreen.hidden = false
            })
        }
        else
        {
            UIView.animateWithDuration(duration, animations: {
                self.changeScreen.hidden = true
            })
        }
    }
    
    @IBAction func leftViewSwipe(sender: UISwipeGestureRecognizer) {
        if curShowView == ShowView.Left {
            UIView.animateWithDuration(duration, animations: { 
                self.centerView.frame.origin.x -= 200
            })
            curShowView = ShowView.Center
        }
    }
    
    @IBAction func rightViewSwipe(sender: UISwipeGestureRecognizer) {
        if curShowView == ShowView.Right {
            UIView.animateWithDuration(duration, animations: { 
                self.centerView.frame.origin.x += 200
            })
            curShowView = ShowView.Center
        }
    }
    
    @IBAction func centerViewSwipeRight(sender: UISwipeGestureRecognizer) {
        if curShowView == ShowView.Center {
            UIView.animateWithDuration(duration, animations: { 
                self.centerView.frame.origin.x -= 200
            })
            curShowView = ShowView.Right
        }
        else if curShowView == ShowView.Left
        {
            UIView.animateWithDuration(duration, animations: {
                self.centerView.frame.origin.x -= 200
            })
            curShowView = ShowView.Center
        }
    }
    
    @IBAction func centerViewSwipeLeft(sender: UISwipeGestureRecognizer) {
        if curShowView == ShowView.Center {
            UIView.animateWithDuration(duration, animations: { 
                self.centerView.frame.origin.x += 200
            })
            curShowView = ShowView.Left
        }
        else if curShowView == ShowView.Right {
            UIView.animateWithDuration(duration, animations: {
                self.centerView.frame.origin.x += 200
            })
            curShowView = ShowView.Center
        }

    }

    
    
}

