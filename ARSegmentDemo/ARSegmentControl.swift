//
//  ARView.swift
//  swiftShop
//
//  Created by 刘淋全 on 15/8/27.
//  Copyright (c) 2015年 刘淋全. All rights reserved.
//自定义segment按钮,可自由增加按钮数量 带选择提示动画

import UIKit

protocol ARSegmentControlDelegate{
    func selectedCallback(index:Int)
}


class ARSegmentControl: UIView {
    
    var delegate:ARSegmentControlDelegate?
    
    private var line:UIView!
    private var selected:UIView!
    private var titleCount:Int?
    private var btnArr=[UIButton]()
    private var oldBtn:UIButton!
    private var sIndex:Int=0
    private var nColor=UIColor.blackColor()
    private var sColor=UIColor.redColor()
    private var f=UIFont.systemFontOfSize(15)
    
    
    override init(frame: CGRect) {
        super.init(frame: CGRectMake(0, 64, UIScreen.mainScreen().bounds.size.width, 40))
        
        //add一堆的view
        
        line=UIView();
        line.backgroundColor=UIColor(red: 192.0/255.0, green: 192.0/255.0, blue: 192.0/255.0, alpha: 1)
        self.addSubview(line)
        
        selected=UIView()
        self.addSubview(selected)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //给子view设置frame
        line.frame=CGRectMake(0, self.frame.size.height-0.5, self.frame.size.width, 0.5)
        
        selected.frame=CGRectMake(CGFloat(self.frame.size.width)/CGFloat(titleCount!)/5.0+CGFloat(sIndex)*CGFloat(self.frame.size.width)/CGFloat(titleCount!), self.frame.size.height-2, CGFloat(self.frame.size.width)*3.0/CGFloat(titleCount!)/5.0, 2)
        selected.backgroundColor=sColor
        
        for i in 0..<btnArr.count
        {
            var btn=btnArr[i] as UIButton
            btn.frame=CGRectMake(0.0+CGFloat(i)*CGFloat(self.frame.size.width)/CGFloat(titleCount!), 0, CGFloat(self.frame.size.width)/CGFloat(titleCount!), self.frame.size.height)
            btn.setTitleColor(nColor, forState: UIControlState.Normal)
            btn.setTitleColor(sColor, forState: UIControlState.Selected)
            btn.titleLabel?.font=f
            if i==sIndex
            {
                btn.selected=true
                oldBtn=btn
            }
            
        }
    }
    
    var normalColor:UIColor?{
        get{
            return nil
        }
        set{
            nColor=newValue!
        }
    }
    
    var selectedColor:UIColor?{
        get{
            return nil
        }
        set{
            sColor=newValue!
        }
    }
    var font:UIFont?{
        get{
            return nil
        }
        set{
            f=newValue!
        }
    }
    
    var selectedIndex:Int?{
        get{
            return sIndex
        }
        set{
            if let value=newValue{
                sIndex=value
            }
        }
    }
    
    //重点
    var titleArr:NSArray?{
        set{
            if let value=newValue
            {
                //给页面的控件赋值真正的数据
                titleCount=value.count
                for i in 0..<value.count
                {
                    var btn:UIButton=UIButton()
                    btn.setTitle(value[i] as? String, forState: UIControlState.Normal)
                    btn.addTarget(self, action: "btnClick:", forControlEvents: UIControlEvents.TouchUpInside)
                    btn.tag=i
                    btnArr.append(btn)
                    self.addSubview(btn)
                }
                
            }
        }
        
        get{
            return nil
        }
    }
    
    
    
    var myFrame:CGRect?{
        set{
            self.frame=newValue!
            
        }
        
        get{
            return nil
        }
    }
    
    
    func btnClick(myBtn:UIButton)
    {
        if myBtn.tag != oldBtn.tag
        {
            UIView.beginAnimations(nil, context: nil)
            UIView.setAnimationDuration(0.2)
            selected.frame=CGRectMake(CGFloat(self.frame.size.width)/CGFloat(titleCount!)/5.0+CGFloat(myBtn.tag)*CGFloat(self.frame.size.width)/CGFloat(titleCount!), selected.frame.origin.y, selected.frame.size.width, selected.frame.size.height)
            UIView.commitAnimations()
            
            oldBtn.selected=false
            myBtn.selected=true
            sIndex=myBtn.tag
            oldBtn=myBtn
            delegate?.selectedCallback(myBtn.tag)
        }
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
