# ARSegmentControl
swift 写的自定义segment按钮,可自由增加按钮数量 带选择提示动画

简单使用

var ad:ARSegmentControl?

ad=ARSegmentControl()
ad?.myFrame=CGRectMake(0, 64, self.view.frame.size.width, 40)
ad?.titleArr=["PAG1","PAG2","PAG3","PAG4","PAG5"]
ad?.normalColor=UIColor.grayColor()
ad?.selectedColor=UIColor.redColor()
ad?.font=UIFont.systemFontOfSize(15)
ad?.delegate=self
ad?.selectedIndex=0
self.view.addSubview(ad!)

点击代理ARSegmentControlDelegate

func selectedCallback(index: Int) {
        
}
