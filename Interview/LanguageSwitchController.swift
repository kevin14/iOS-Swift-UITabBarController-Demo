//
//  LanguageSwitchController.swift
//  Interview
//
//  Created by kevin14 on 15/1/2.
//  Copyright (c) 2015年 kevin14. All rights reserved.
//


import UIKit

class LanguageSwitchController: UIViewController,UICollectionViewDelegateFlowLayout, UICollectionViewDataSource,UIGestureRecognizerDelegate {
    
    var topBar:TopBar!
    
    var globalAlertView:UIAlertView?
    
    var globalTimer:NSTimer?
    
    var selectedLanguages:[String] = ["java","android"]
    
    var isOperate:Int = 0
    
    var transformZoom = CGAffineTransformMakeScale(1, 1)
    
    var languages:[String] = ["java","javascript","android","javascript","android","javascript","android","javascript","android","javascript","android","java","javascript","android"]
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var allLanguageCollectionView: UICollectionView!
    @IBOutlet var ensureBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.interactivePopGestureRecognizer.delegate = self
        
        UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.LightContent, animated: false)
        
        self.topBar = TopBar(frame: self.view.frame, title: "选择语言", leftBtn: Icon.back, rightBtn: Icon.setting)
        self.view.addSubview(self.topBar)
        self.view.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        self.bindTopBarEvents()
        
        self.initCollections()
        
        
    }
    
    
    
    func initCollections(){
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        layout.minimumInteritemSpacing = 20
        layout.itemSize = CGSize(width: 45, height: 45)
        collectionView.collectionViewLayout = layout
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "LanguageCell")
        collectionView.backgroundColor = UIColor.whiteColor()
        
        
        let layout2: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout2.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 10, right: 20)
        layout2.minimumInteritemSpacing = 20
        layout2.minimumLineSpacing = 15
        layout2.itemSize = CGSize(width: 45, height: 45)
        allLanguageCollectionView.collectionViewLayout = layout2
        allLanguageCollectionView.dataSource = self
        allLanguageCollectionView.delegate = self
        allLanguageCollectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "LanguageCell")
        allLanguageCollectionView.backgroundColor = UIColor.whiteColor()
        allLanguageCollectionView.autoresizingMask = UIViewAutoresizing.FlexibleHeight
        allLanguageCollectionView.scrollEnabled = true
        
        self.ensureBtn.layer.cornerRadius = 2
        self.ensureBtn.addTarget(self, action: Selector("ensureBtnClick"), forControlEvents: UIControlEvents.TouchUpInside)
        
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //至多3个
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.collectionView {
            return self.selectedLanguages.count
        }else{
            return self.languages.count
        }
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("LanguageCell", forIndexPath: indexPath) as UICollectionViewCell
        if collectionView == self.collectionView {
            if indexPath.item < self.selectedLanguages.count {
                let image:UIImage = UIImage(named: self.selectedLanguages[indexPath.item])!
                let imageView = UIImageView(image: image)
                imageView.center = CGPoint(x: 22.5, y:22.5)
                imageView.transform = CGAffineTransformMakeScale(0.5, 0.5)
                cell.addSubview(imageView)
                cell.transform = CGAffineTransformMakeScale(1, 1)
                
                if isOperate == 1 && indexPath.item == self.selectedLanguages.count - 1 {
                    self.isOperate = 0
                    cell.transform = CGAffineTransformMakeScale(0.05, 0.05)
                    UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: {cell.transform = self.transformZoom}, completion:nil)
                }
                
            }
        }else{
            if indexPath.item < self.languages.count {
                let image:UIImage = UIImage(named: self.languages[indexPath.item])!
                let imageView = UIImageView(image: image)
                imageView.center = CGPoint(x: 22.5, y:22.5)
                imageView.transform = CGAffineTransformMakeScale(0.5, 0.5)
                cell.addSubview(imageView)
                cell.transform = CGAffineTransformMakeScale(1, 1)
                
                if isOperate == 2 && indexPath.item == self.languages.count - 1 {
                    self.isOperate = 0
                    cell.transform = CGAffineTransformMakeScale(0.05, 0.05)
                    UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: {cell.transform = self.transformZoom}, completion:nil)
                }
            }
        }
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        if collectionView == self.collectionView {
            
            if self.selectedLanguages.count > 1 {
                let cell = self.collectionView.cellForItemAtIndexPath(indexPath)
                let transform = CGAffineTransformMakeScale(0.05, 0.05)
                UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: {cell!.transform = transform}, completion:{
                    (hasFinished:Bool) -> Void in
                    //从选中的language里删除一个
                    let language:String = self.selectedLanguages.removeAtIndex(indexPath.item)
                    cell?.removeFromSuperview()
                    self.collectionView.reloadData()
                    
                    //增加一个到选中的language里
                    self.isOperate = 2
                    self.languages.append(language)
                    self.allLanguageCollectionView.reloadData()
                })
            }else{
                globalAlertView = UIAlertView()
                globalAlertView?.title = "Oops..."
                globalAlertView?.message = "至少选择1门语言"
                globalAlertView?.show()
                globalTimer = NSTimer.scheduledTimerWithTimeInterval(1.5, target: self, selector: Selector("removeAlert"), userInfo: nil, repeats: false)
            }
            
        }else{
            
            if self.selectedLanguages.count < 3 {
                let cell = self.allLanguageCollectionView.cellForItemAtIndexPath(indexPath)
                let transform = CGAffineTransformMakeScale(0.05, 0.05)
                UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: {cell!.transform = transform}, completion:{
                    (hasFinished:Bool) -> Void in
                        //从language里闪出一个
                        let language:String = self.languages.removeAtIndex(indexPath.item)
                        cell?.removeFromSuperview()
                        self.allLanguageCollectionView.reloadData()
                    
                        //增加一个到选中的language里
                        self.isOperate = 1
                        self.selectedLanguages.append(language)
                        self.collectionView.reloadData()
                    })
                
            }else{
                globalAlertView = UIAlertView()
                globalAlertView?.title = "Oops..."
                globalAlertView?.message = "最多只能选择3门语言"
                globalAlertView?.show()
                globalTimer = NSTimer.scheduledTimerWithTimeInterval(1.5, target: self, selector: Selector("removeAlert"), userInfo: nil, repeats: false)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func bindTopBarEvents(){
        topBar.leftBtnView.addTarget(self, action: Selector("leftBtnTap"), forControlEvents: UIControlEvents.TouchUpInside)
        topBar.rightBtnView.addTarget(self, action: Selector("rightBtnTap"), forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func leftBtnTap(){
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func ensureBtnClick(){
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func removeAlert(){
        globalAlertView?.dismissWithClickedButtonIndex(0, animated: true)
        globalAlertView?.removeFromSuperview()
    }
    
    func rightBtnTap(){
        
    }
    
}
