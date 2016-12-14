//
//  UIKitVC.swift
//  CDPlayerSwift
//
//  Created by CDPlayer on 2016/12/9.
//  Copyright © 2016年 CDPlayer. All rights reserved.
//
// 然而并没有写完,侯老师徐老师你们快来写啊！！！

import UIKit

class UIKitVC: UIViewController ,UITableViewDelegate ,UITableViewDataSource{

    let WIDTH  = UIScreen.main.bounds.size.width
    let HEIGHT = UIScreen.main.bounds.size.height
    
    let viewCD : UIViewController
    let introduce : IntroduceVC
    let viewItem  : UIViewVC
    let control   : UIControlVC
    let label     : UILabelVC
    let font      : UIFontVC
    let color     : UIColorVC
    let tableView : UITableView
    let itemArray : Array = ["说明","视图 UIView","控制器 UIControl","标签 UILabel:UIView..","字体 UIFont","颜色 UIColor","按钮 UIButton:UIControl..","输入框 UITextField","图片 UIImage","图片视图 UIImageView","开关 UISwitch","步进 UIStepper","分段控制 UISegmentedControl","进度 UIProgressView","选择 UIPickerView"]
    
    init(){
        introduce = IntroduceVC()
        viewCD = UIViewController()
        viewItem = UIViewVC()
        control = UIControlVC()
        label = UILabelVC()
        font = UIFontVC()
        color = UIColorVC()
        tableView = UITableView(frame: CGRect(x: 5, y: -350.0, width: WIDTH-10, height: 350), style: UITableViewStyle.plain)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "hello.jpg")!)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.clear
        self.view.addSubview(tableView)
        
        viewCD.view.addSubview(introduce.view)
        self.view.addSubview(viewCD.view)
        self.edgesForExtendedLayout = UIRectEdge()

    }
    
    func changeItem(){
        UIView.animate(withDuration: 0.3, animations: {
            self.viewCD.view.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            self.viewCD.view.frame = CGRect(x: self.WIDTH/4, y: 437.5, width: self.viewCD.view.frame.width, height: self.viewCD.view.frame.height)
            self.tableView.frame = CGRect(x: 5, y: 0, width: self.WIDTH-10, height: 350)
        }, completion: { (true) in
            UIView.animate(withDuration: 0.1, animations: {
                self.viewCD.view.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
                self.viewCD.view.frame = CGRect(x: self.WIDTH/8, y: 350.0, width: self.viewCD.view.frame.width, height: self.viewCD.view.frame.height)
            })
        })
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell? = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "ITEMCELL")
        cell?.textLabel?.text = itemArray[indexPath.row]
        cell?.textLabel?.textAlignment = NSTextAlignment.center
        let a = CGFloat(arc4random()%255)
        let b = CGFloat(arc4random()%255)
        let c = CGFloat(arc4random()%255)
        cell?.backgroundColor = UIColor(red: a/255.0, green: b/255.0, blue: c/255.0, alpha: 0.2)
        if indexPath.row > 5 {
            cell?.backgroundColor = UIColor(red: 1/255.0, green: 1/255.0, blue: 1/255.0, alpha: 0.2)
        }
        let v : UIView = UIView()
        v.backgroundColor = UIColor.red
        cell?.selectedBackgroundView = v
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let x : UIView = viewCD.view.subviews.last!
        x.removeFromSuperview()
        var name : String?
        
        switch indexPath.row {
        case 0:
            viewCD.view.addSubview(introduce.view)
            name = "说明"
        case 1:
            viewCD.view.addSubview(viewItem.view)
            name = "视图"
            break
        case 2:
            viewCD.view.addSubview(control.view)
            name = "控制器"
            break
        case 3:
            viewCD.view.addSubview(label.view)
            name = "标签"
        case 4:
            viewCD.view.addSubview(font.view)
            name = "字体"
        case 5:
            viewCD.view.addSubview(color.view)
            name = "颜色"
        default:
            viewCD.view.addSubview(introduce.view)
            name = "其他"
            break
        }
        
        NotificationCenter.default.post(name: Notification.Name(rawValue: "MainTitle"), object: nil, userInfo: ["title":name!])
        
        UIView.animate(withDuration: 0.3, animations: {
            self.viewCD.view.transform = CGAffineTransform.identity
            self.viewCD.view.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.viewCD.view.frame = CGRect(x: -1 * self.WIDTH/4, y: -1 * self.HEIGHT/4, width: self.viewCD.view.frame.width, height: self.viewCD.view.frame.height)
            self.tableView.frame = CGRect(x: 5, y: -350, width: self.WIDTH-10, height: 350)
        }, completion: { (true) in
            UIView.animate(withDuration: 0.1, animations: {
                self.viewCD.view.transform = CGAffineTransform.identity
                self.viewCD.view.frame = CGRect(x: 0.0, y: 0.0, width: self.viewCD.view.frame.width, height: self.viewCD.view.frame.height)
            })
        })
    }

}
