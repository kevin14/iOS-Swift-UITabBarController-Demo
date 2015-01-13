//
//  MenuController.swift
//  Interview
//
//  Created by kevin14 on 14/12/25.
//  Copyright (c) 2014年 kevin14. All rights reserved.
//

import UIKit

class MenuController : UITabBarController{
    
    let normalColor:UIColor = UIColor(red: 180/255, green: 180/255, blue: 180/255, alpha: 1)
    let selectedColor:UIColor = UIColor(red: 252/255, green: 60/255, blue: 76/255, alpha: 1)
    
    var icons:[UILabel] = []
    var labels:[UILabel] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.resetMenuStyle()
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //重置Menu菜单样式
    func resetMenuStyle(){
        
        let tabBarController:UITabBarController = self
        
        let tabBar:UITabBar = tabBarController.tabBar
        
        let firstTabBar:UITabBarItem = tabBar.items![0] as UITabBarItem
        
        let secondTabBar:UITabBarItem = tabBar.items![1] as UITabBarItem
        
        let thirdTabBar:UITabBarItem = tabBar.items![2] as UITabBarItem
        
        let frameWidth = self.view.frame.width
        
        let font:UIFont = UIFont(name: "icomoon", size: 24)!
        let labelFont:UIFont = UIFont(name: "icomoon", size: 8)!
        
        let iconPoitionY = self.tabBar.frame.origin.y + 10
        let labelPositionY = self.tabBar.frame.origin.y + 29
        
        let iconWidth:CGFloat = 36
        let iconHeight:CGFloat = 24
        
        tabBar.tintColor = self.selectedColor
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName:self.normalColor], forState: UIControlState.Normal)
        
        //tab1 icon
        firstTabBar.image = nil
        firstTabBar.selectedImage = nil
        firstTabBar.title = ""
        let firstIconFrame:CGRect = CGRectMake(30 , iconPoitionY, iconWidth, iconHeight)
        let firstLabelFrame:CGRect = CGRectMake(30 , labelPositionY, iconWidth, iconHeight)
        var icon1:UILabel  = UILabel(frame: firstIconFrame)
        var label1:UILabel = UILabel(frame: firstLabelFrame)
        label1.text = "首页"
        label1.font = labelFont
        label1.textAlignment = NSTextAlignment.Center
        icon1.font = font
        icon1.text = Icon.home;
        icon1.textColor = self.selectedColor
        icon1.textAlignment = NSTextAlignment.Center
        label1.textColor = self.selectedColor
        self.icons.append(icon1)
        self.labels.append(label1)
        self.view.addSubview(icon1)
        self.view.addSubview(label1)
        
        //tab2 icon
        secondTabBar.image = nil
        secondTabBar.selectedImage = nil
        secondTabBar.title = ""
        let secondIconFrame:CGRect = CGRectMake(self.view.frame.width / 2 - iconWidth / 2 , iconPoitionY, iconWidth, iconHeight)
        let secondLabelFrame:CGRect = CGRectMake(self.view.frame.width / 2 - iconWidth / 2, labelPositionY, iconWidth, iconHeight)
        var icon2:UILabel  = UILabel(frame: secondIconFrame)
        var label2:UILabel = UILabel(frame: secondLabelFrame)
        label2.text = "题库"
        label2.font = labelFont
        label2.textAlignment = NSTextAlignment.Center
        label2.textColor = self.normalColor
        icon2.font = font
        icon2.text = Icon.books;
        icon2.textColor = self.normalColor
        icon2.textAlignment = NSTextAlignment.Center
        self.icons.append(icon2)
        self.labels.append(label2)
        self.view.addSubview(icon2)
        self.view.addSubview(label2)
        
        //tab3 icon
        thirdTabBar.image = nil
        thirdTabBar.selectedImage = nil
        thirdTabBar.title = ""
        let thirdIconFrame:CGRect = CGRectMake(self.view.frame.width - 30 - iconWidth, iconPoitionY, iconWidth, iconHeight)
        let thirdLabelFrame:CGRect = CGRectMake(self.view.frame.width - 30 - iconWidth,labelPositionY, iconWidth, iconHeight)
        var icon3:UILabel  = UILabel(frame: thirdIconFrame)
        var label3:UILabel = UILabel(frame: thirdLabelFrame)
        label3.text = "个人中心"
        label3.font = labelFont
        label3.textAlignment = NSTextAlignment.Center
        label3.textColor = self.normalColor
        icon3.textAlignment = NSTextAlignment.Center
        icon3.font = font
        icon3.text = Icon.userCenter;
        icon3.textColor = self.normalColor
        self.icons.append(icon3)
        self.labels.append(label3)
        self.view.addSubview(icon3)
        self.view.addSubview(label3)
        
        tabBar.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        tabBar.barTintColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        tabBar.barStyle = UIBarStyle.Default
        tabBar.clipsToBounds = true
        
        let topBorder:CALayer = CALayer()
        topBorder.frame = CGRectMake(0, 0, frameWidth, 0.5)
        topBorder.backgroundColor = UIColor(red: 252/255, green: 60/255, blue: 76/255, alpha: 1).CGColor
        
        let layer:CALayer = CALayer()
        layer.frame = CGRectMake(tabBar.frame.origin.x, tabBar.frame.origin.y + 7, frameWidth, 38)
        
        tabBar.frame = layer.frame
        tabBar.layer.addSublayer(topBorder)
        tabBar.tintColor = UIColor(red: 252/255, green: 60/255, blue: 76/255, alpha: 1)
        
    }
    
    override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem!) {

        for icon in self.icons {
            icon.textColor = self.normalColor
        }
        
        for label in self.labels {
            label.textColor = self.normalColor
        }
        
        if item == tabBar.items![0] as NSObject {
            self.icons[0].textColor = self.selectedColor
            self.labels[0].textColor = self.selectedColor
        }else if item == tabBar.items![1] as NSObject{
            self.icons[1].textColor = self.selectedColor
            self.labels[1].textColor = self.selectedColor
        }else{
            self.icons[2].textColor = self.selectedColor
            self.labels[2].textColor = self.selectedColor
        }

    }
    
    
    func imageFromText(#str:NSString,size:CGSize) -> UIImage {
        
        let font:UIFont = UIFont(name: "icomoon", size: size.height)!
        
        UIGraphicsBeginImageContext(size)
        
        str.drawAtPoint(CGPoint(x: 0,y: 0), withAttributes: [NSFontAttributeName:font])
        
        let img:UIImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        //        let resizeImg:UIImage = self.resizeImage(img: img)
        
        return img
    }
    
    func resizeImage(#img:UIImage) -> UIImage{
        
        UIGraphicsBeginImageContext(CGSize(width: img.size.width/4,height: img.size.height/4))
        
        img.drawInRect(CGRect(x: 0, y: 0, width: img.size.width/4, height: img.size.height/4))
        
        let resizeImg:UIImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return resizeImg
    }
}
