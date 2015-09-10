//
//  ViewController.swift
//  ARSegmentDemo
//
//  Created by 刘淋全 on 15/9/2.
//  Copyright (c) 2015年 刘淋全. All rights reserved.
//

import UIKit

class ViewController: UIViewController,ARSegmentControlDelegate {

    var ad:ARSegmentControl?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ad=ARSegmentControl()
        ad?.myFrame=CGRectMake(0, 64, self.view.frame.size.width, 40)
        ad?.titleArr=["PAG1","PAG2","PAG3","PAG4","PAG5"]
        ad?.normalColor=UIColor.grayColor()
        ad?.selectedColor=UIColor.redColor()
        ad?.font=UIFont.systemFontOfSize(15)
        ad?.delegate=self
        ad?.selectedIndex=0
        self.view.addSubview(ad!)
    }
    
    func selectedCallback(index: Int) {
        var alertControl:UIAlertController=UIAlertController(title: "恭喜", message: "点击了第\(index)个", preferredStyle: UIAlertControllerStyle.Alert)
        var okBtn:UIAlertAction=UIAlertAction(title: "确认", style: UIAlertActionStyle.Default, handler: nil)
        var cancleBtn:UIAlertAction=UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: nil)
        alertControl.addAction(okBtn)
        alertControl.addAction(cancleBtn)
        self.presentViewController(alertControl, animated: true, completion: nil)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

