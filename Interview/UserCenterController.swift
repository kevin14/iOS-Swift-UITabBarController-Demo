//
//  UserCenterController.swift
//  Interview
//
//  Created by kevin14 on 14/12/24.
//  Copyright (c) 2014年 kevin14. All rights reserved.
//

import UIKit

class UserCenterController: UIViewController {
    
    var topBar:TopBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.topBar = TopBar(frame: self.view.frame, title: "个人中心", leftBtn: "", rightBtn: Icon.setting)
        self.view.addSubview(self.topBar)
        self.initViews()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initViews(){
        
        
        

        
    
    }
    
    
}