//
//  FirstViewController.swift
//  Interview
//
//  Created by kevin14 on 14/12/24.
//  Copyright (c) 2014年 kevin14. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    var topBar:TopBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.BlackOpaque, animated: false)
        super.viewDidLoad()
        self.topBar = TopBar(frame: self.view.frame, title: "每日一卷", leftBtn: "", rightBtn: Icon.setting)
        self.view.addSubview(self.topBar)
        
        self.initViews()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initViews(){
        let languageSwitchController = self.storyboard?.instantiateViewControllerWithIdentifier("languageSwitchController") as LanguageSwitchController
        self.presentViewController(languageSwitchController, animated: true, completion: nil)
        
        

    }
    
    
    func imageFromText(#str:NSString,size:CGSize) -> UIImage {
        
        let font:UIFont = UIFont(name: "icomoon", size: size.height)!
        
        UIGraphicsBeginImageContext(size)
        
        str.drawAtPoint(CGPoint(x: 0,y: 0), withAttributes: [NSFontAttributeName:font])
        
        let img:UIImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
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

