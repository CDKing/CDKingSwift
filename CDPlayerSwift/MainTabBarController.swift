//
//  MainTabBarController.swift
//  CDPlayerSwift
//
//  Created by CDPlayer on 2016/12/9.
//  Copyright © 2016年 CDPlayer. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController ,UITabBarControllerDelegate{

    let leftBarItem : UIBarButtonItem
    let uikit : UIKitVC
    let fundation : FoundationVC
    let other : OthersVC
    var firstName : String
    
    init(){
        leftBarItem = UIBarButtonItem(title: "目录", style: UIBarButtonItemStyle.done, target: nil, action: #selector(MainTabBarController.leftBarItemTouchDown))
        uikit = UIKitVC()
        uikit.tabBarItem.title = "组件"
        let dicA : NSDictionary = [NSAttributedStringKey.foregroundColor:UIColor.red]
        let dicB : NSDictionary = [NSAttributedStringKey.foregroundColor:UIColor.purple]
        uikit.tabBarItem.setTitleTextAttributes(dicB as? [NSAttributedStringKey : AnyObject], for: UIControlState())
        uikit.tabBarItem.setTitleTextAttributes(dicA as? [NSAttributedStringKey : AnyObject], for: UIControlState.selected)
        uikit.tabBarItem.selectedImage = UIImage.init(named: "A1")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        uikit.tabBarItem.image = UIImage.init(named: "A2")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        fundation = FoundationVC()
        fundation.tabBarItem.title = "语法"
        fundation.tabBarItem.setTitleTextAttributes(dicB as? [NSAttributedStringKey : AnyObject], for: UIControlState())
        fundation.tabBarItem.setTitleTextAttributes(dicA as? [NSAttributedStringKey : AnyObject], for: UIControlState.selected)
        fundation.tabBarItem.selectedImage = UIImage.init(named: "B1")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        fundation.tabBarItem.image = UIImage.init(named: "B2")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        other = OthersVC()
        other.tabBarItem.title = "其他"
        
        other.tabBarItem.selectedImage = UIImage.init(named: "C1")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        other.tabBarItem.image = UIImage.init(named: "C2")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        firstName = "组件"
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func setMainTitle(userInfo : Notification)->Void{
        let dic : NSDictionary = userInfo.userInfo! as NSDictionary
        let title = dic["title"]!
        firstName = (title as? String)!
        self.title = title as? String
    }
    
    override func viewDidLoad() {
        self.title = "说明"
        self.delegate = self
        
        self.viewControllers = [uikit,fundation,other]
        leftBarItem.target = self
        self.navigationItem.leftBarButtonItem = leftBarItem
        self.view.isUserInteractionEnabled = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(setMainTitle(userInfo:)), name: NSNotification.Name(rawValue: "MainTitle"), object: nil)
        
    }
    @objc func leftBarItemTouchDown(){
        uikit.changeItem()
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        switch tabBarController.selectedIndex{
        case 0:
            self.navigationItem.leftBarButtonItem = leftBarItem
            self.title = firstName
        case 1:
            self.navigationItem.leftBarButtonItem = nil
            self.title = "语法"
        case 2:
            self.navigationItem.leftBarButtonItem = nil
            self.title = "其他"
        default:
            self.navigationItem.leftBarButtonItem = nil
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
