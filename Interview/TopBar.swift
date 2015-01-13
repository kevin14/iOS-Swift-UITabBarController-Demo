//
//  TopBar.swift
//  Interview
//
//  Created by kevin14 on 15/1/3.
//  Copyright (c) 2015年 kevin14. All rights reserved.
//

import UIKit

@IBDesignable class TopBar: UIView{
    
    var width:CGFloat = 0
    var globalHeight:CGFloat = 60
    var title:String!
    var leftBtn:String!
    var rightBtn:String!
    var leftBtnView:UIButton!
    var rightBtnView:UIButton!
    var titleView:UILabel!
    
    init(frame:CGRect,title:NSString = "",leftBtn:NSString = "",rightBtn:NSString = "") {
        
        let frame:CGRect = CGRectMake(0, 0, frame.width, globalHeight)
        super.init(frame: frame)
        
        self.title = title
        self.leftBtn = leftBtn
        self.rightBtn = rightBtn
        
        self.backgroundColor = UIColor(red: 252/255, green: 60/255, blue: 76/255, alpha: 1)
        
        self.initTitle(self.title)
        
        self.initBtns(leftBtn: self.leftBtn, rightBtn: self.rightBtn)

    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initBtns(#leftBtn:String,rightBtn:String){
    
        let top:CGFloat = 20.0
        let iconFont:UIFont = UIFont(name: "icomoon", size: 22)!
        
        if leftBtn != "" {
            leftBtnView = UIButton(frame: CGRectMake(0, top, 40, globalHeight - top))
            let iconView:UILabel = UILabel(frame: CGRectMake(0, 0, leftBtnView.frame.width, leftBtnView.frame.height))
            iconView.textColor = UIColor.whiteColor()
            iconView.font = iconFont
            iconView.text = leftBtn
            iconView.textAlignment = NSTextAlignment.Center
            
            leftBtnView.addSubview(iconView)
            self.addSubview(leftBtnView)
        }
        
        if rightBtn != "" {
            rightBtnView = UIButton(frame: CGRectMake(self.frame.width - globalHeight + top, top, 40, globalHeight - top))
            let iconView:UILabel = UILabel(frame: CGRectMake(0, 0, rightBtnView.frame.width, rightBtnView.frame.height))
            iconView.textColor = UIColor.whiteColor()
            iconView.font = iconFont
            iconView.text = rightBtn
            iconView.textAlignment = NSTextAlignment.Center
            
            rightBtnView.addSubview(iconView)
            self.addSubview(rightBtnView)
        }
        
        
    }
    
    func initTitle(title:String){
        let top:CGFloat = 20.0
        let labelFont:UIFont = UIFont(name: "icomoon", size: 16)!
        if !title.isEmpty {
            titleView = UILabel(frame: CGRectMake(0, top, self.frame.width, globalHeight - top))
            titleView.text = title
            titleView.textAlignment = NSTextAlignment.Center
            titleView.font = labelFont
            titleView.textColor = UIColor.whiteColor()
            self.addSubview(titleView)
        }else{
            println("title is empty")
        }
    }
}