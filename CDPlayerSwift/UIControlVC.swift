//
//  UIControlVC.swift
//  swiftSimpleDoc
//
//  Created by CDPlayer on 16/5/15.
//  Copyright © 2016年 CDPlayer. All rights reserved.
//
// 这里大部分都没有实现点击演示效果

import UIKit

class UIControlVC: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    let WIDTH  = UIScreen.main.bounds.size.width
    let HEIGHT = UIScreen.main.bounds.size.height
    
    var CDtableView : UITableView
    var a           : UIButton
    
    var attributeArr : NSMutableArray = []
    var selectionArr : NSArray = [
        // 0
        ["属性:是否允许触碰事件","●true","●false","请点击查看效果"],
        // 1
        ["属性:是否被选择"],
        // 2
        ["属性:是否保高亮"],
        // 3
        ["属性:返回当前状态(只读)"],
        // 4
        ["属性:判断当前控件是否被触碰(只读)"],
        // 5
        ["方法:判断是否开始点击(Bool)"],
        // 6
        ["方法:判断点击后是否移动(Bool)"],
        // 7
        ["方法:结束点击后的事件(子类实现)"],
        // 8
        ["方法:线条色的设置(子类实现 略)"],
        // 9
        ["方法:是否存在灰度颜色(返回Bool 略)"],
        // 10
        ["方法:是否存在HSBA颜色(返回Bool 略)"],
        // 11
        ["方法:否是存在RGBA颜色(返回Bool 略)"],
        // 12
        ["方法:返回当前色的透明度颜色","详情请看颜色部分"],
        // 13
        ["属性:返回CGColor(略)"],
        // 14
        ["属性:返回CIColor(略)"]
    ]
    
    init(){
        CDtableView = UITableView(frame: CGRect(x: 0, y: 215, width: WIDTH, height: HEIGHT-265), style: UITableViewStyle.plain)
        a = UIButton(frame: CGRect(x: 50, y: 64, width: WIDTH-100, height: 150))
        
        attributeArr.add(["enabled: Bool",[]])//0
        attributeArr.add(["selected: Bool",[]])//1
        attributeArr.add(["highlighted: Bool",[]])//2
        attributeArr.add(["state: UIControlState",[]])//3
        attributeArr.add(["touchInside: Bool",[]])//4
        attributeArr.add(["beginTrackingWithTouch(touch: UITouch, withEvent event: UIEvent?)",[]])//5
        attributeArr.add(["continueTrackingWithTouch(touch: UITouch, withEvent event: UIEvent?)",[]])//6
        attributeArr.add(["endTrackingWithTouch(touch: UITouch?, withEvent event: UIEvent?)",[]])//7
        attributeArr.add(["setStroke()",[]])//8
        attributeArr.add(["getWhite(white: , alpha: ) -> Bool",[]])//9
        attributeArr.add(["getHue(hue: , saturation: , brightness: , alpha: ) -> Bool",[]])//10
        attributeArr.add(["getRed(red: , green: , blue: , alpha: ) -> Bool",[]])//11
        attributeArr.add(["colorWithAlphaComponent(alpha: ) -> UIColor",[]])//12
        attributeArr.add(["CGColor",[]])//13
        attributeArr.add(["CIColor",[]])//14
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.5)
        
        a.setTitle("UIControl", for: UIControlState())
        a.setTitle("Touch", for: UIControlState.highlighted)
        a.backgroundColor = UIColor.green
        self.view.addSubview(a)
        
        CDtableView.delegate = self
        CDtableView.dataSource = self
        CDtableView.backgroundColor = UIColor.clear
        self.view.addSubview(CDtableView)
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return attributeArr.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let num : NSArray = attributeArr[section] as! NSArray
        let count : NSArray = num.lastObject as! NSArray
        return count.count
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80.0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1.0
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let vieww : UIView = UIView(frame: CGRect(x: 0, y: 0, width: WIDTH, height: 80))
        let num : NSArray = attributeArr[section] as! NSArray
        let title : String = num[0] as! String
        let lbl : UILabel = UILabel(frame: CGRect(x: 5, y: 0, width: WIDTH-5, height: 80))
        lbl.textAlignment = NSTextAlignment.left
        lbl.font = UIFont.systemFont(ofSize: 20)
        vieww.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        lbl.text = title
        lbl.numberOfLines = 2
        vieww.tag = section
        vieww.addSubview(lbl)
        let gesture : UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(tabFunc(_:)))
        vieww.addGestureRecognizer(gesture)
        return vieww
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "LABELCELL")
        
        let value : NSArray = attributeArr[indexPath.section] as! NSArray
        let name : NSArray = value[1] as! NSArray
        cell.textLabel?.text = name[indexPath.row] as? String
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
        cell.textLabel?.numberOfLines = 2
        cell.textLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        cell.textLabel?.textAlignment = NSTextAlignment.left
        let a = CGFloat(arc4random()%255)
        let b = CGFloat(arc4random()%255)
        let c = CGFloat(arc4random()%255)
        cell.backgroundColor = UIColor.init(red: a/255.0, green: b/255.0, blue: c/255.0, alpha: 0.6)
        
        
        return cell
    }
    func tabFunc(_ recoginzer : UITapGestureRecognizer){
        let tag : Int = (recoginzer.view?.tag)!
        let num : NSArray = attributeArr[tag] as! NSArray
        let count : NSArray = num.lastObject as! NSArray
        let countOne : String = num[0] as! String
        
        for i : Int in 0...attributeArr.count-1 {
            let num2 : NSArray = attributeArr[i] as! NSArray
            let countOne2 : String = num2[0] as! String
            attributeArr[i] = ["\(countOne2)",[]]
        }
        if count.count == 0 {
            attributeArr[tag] = ["\(countOne)",selectionArr[tag]]
        }else{
        }
        CDtableView.reloadData()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                a.isEnabled = true
            case 1:
                a.isEnabled = true
            case 2:
                a.isEnabled = false
            default:
                break
            }
            
        default:
            break
        }
    }
}
