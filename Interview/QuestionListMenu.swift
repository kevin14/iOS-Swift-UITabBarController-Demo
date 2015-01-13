//
//  QuestionListMenu.swift
//  Interview
//
//  Created by kevin14 on 14/12/28.
//  Copyright (c) 2014年 kevin14. All rights reserved.
//

import UIKit

@IBDesignable class QuestionListMenu: UIView {
    
    var btns:[Dictionary<String,String>] = [
        ["icon":Icon.tag,"label":"Tags"],
        ["icon":Icon.study,"label":"名企题库"],
        ["icon":Icon.edit,"label":"模拟面试"],
        ["icon":Icon.language,"label":"选择语言"]
    ]
    
    override func drawRect(rect: CGRect) {
        self.initBtns()
    }

    func initBtns(){
        let width:CGFloat = self.frame.width
        let top:CGFloat = 20.0
        var btnView:UIButton!
        let iconFont:UIFont = UIFont(name: "icomoon", size: 22)!
        let labelFont:UIFont = UIFont(name: "icomoon", size: 10)!
        
        for (index,btn) in enumerate(self.btns){
            
            //绘制图形
            let cIndex:CGFloat = CGFloat(index)
            var left:CGFloat = 0
            btnView = UIButton(frame: CGRectMake(width/CGFloat(self.btns.count)*cIndex , top, width/CGFloat(self.btns.count), 40))
            btnView.tag = index
            
            let iconView:UILabel = UILabel(frame: CGRectMake(0, 0, btnView.frame.width, 22))
            iconView.textColor = UIColor.whiteColor()
            iconView.font = iconFont
            iconView.text = btn["icon"]
            
            let labelView:UILabel = UILabel(frame: CGRectMake(0, 18, btnView.frame.width, 24))
            labelView.textColor = UIColor.whiteColor()
            labelView.font = labelFont
            labelView.text = btn["label"]
            
            iconView.textAlignment = NSTextAlignment.Center
            labelView.textAlignment = NSTextAlignment.Center
            
            btnView.addSubview(labelView)
            btnView.addSubview(iconView)
            
            //绑定事件
            btnView.addTarget(self, action: Selector("btnTap:"), forControlEvents: UIControlEvents.TouchUpInside)
            
            self.addSubview(btnView)
        }
    }
    
    func btnTap(btn:UIButton!){
        switch btn.tag {
        case 0:
            println(0)
        case 1:
            println(1)
        case 2:
            println(2)
        case 3:
            //选择语言按钮
            let languageSwitchController = self.window?.rootViewController?.storyboard?.instantiateViewControllerWithIdentifier("languageSwitchController") as LanguageSwitchController
            (self.superview?.nextResponder() as UIViewController).navigationController?.pushViewController(languageSwitchController, animated: true)
        default:
            println("没有响应")
        }
    }
    
}
