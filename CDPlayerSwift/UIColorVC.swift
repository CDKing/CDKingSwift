//
//  UIColorVC.swift
//  swiftSimpleDoc
//
//  Created by CDPlayer on 16/5/15.
//  Copyright © 2016年 CDPlayer. All rights reserved.
//

import UIKit

class UIColorVC: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    let WIDTH  = UIScreen.main.bounds.size.width
    let HEIGHT = UIScreen.main.bounds.size.height
    
    var CDtableView : UITableView
    var a           : UILabel
    
    var attributeArr : NSMutableArray = []
    var selectionArr : NSArray = [
        // 0
        ["方法:初始化灰色字体(灰度0~1，透明度0~1)","●(0.4,0.8)","●(0,8,1.0)"],
        // 1
        ["方法:初始化HSBA字体(0~1)","●(0.5,0.5,0.5,1.0)","●(0.3,0.6,0.9,1.0)"],
        // 2
        ["方法:初始化RGBA字体(0~1)","●(0.5,0.5,0.5,1.0)","●(0.3,0.6,0.9,1.0)"],
        // 3
        ["方法:使用CGColor初始化(略)"],
        // 4
        ["方法:使用图片初始化","●图片1","●图片2"],
        // 5
        ["方法:返回各种系统颜色(UIColor.xxColor())","●redColor","●clearColor","更多请自行参看API"],
        // 6
        ["方法:填充色与线条色的设置(子类实现 略)"],
        // 7
        ["方法:填充色的设置(子类实现 略)"],
        // 8
        ["方法:线条色的设置(子类实现 略)"],
        // 9
        ["方法:是否存在灰度颜色(返回Bool 略)"],
        // 10
        ["方法:是否存在HSBA颜色(返回Bool 略)"],
        // 11
        ["方法:否是存在RGBA颜色(返回Bool 略)"],
        // 12
        ["方法:返回当前色的透明度颜色","●0.4","●0.8"],
        // 13
        ["属性:返回CGColor(略)"],
        // 14
        ["属性:返回CIColor(略)"]
    ]
    
    init(){
        CDtableView = UITableView(frame: CGRect(x: 0, y: 120, width: WIDTH, height: HEIGHT-175), style: UITableViewStyle.plain)
        a = UILabel(frame: CGRect(x: 0, y: 64, width: WIDTH, height: 50))
        a.font = UIFont.systemFont(ofSize: 20)
        a.textColor = UIColor.black
        
        attributeArr.adding(["init(white: , alpha: )",[]])//0
        attributeArr.adding(["init(hue: , saturation: , brightness: , alpha: )",[]])//1
        attributeArr.adding(["init(red: , green: , blue: , alpha: )",[]])//2
        attributeArr.adding(["init(CGColor cgColor: )",[]])//3
        attributeArr.adding(["init(patternImage image: UIImage)",[]])//4
        attributeArr.adding(["UIColor.xxColor()",[]])//5
        attributeArr.adding(["set()",[]])//6
        attributeArr.adding(["setFill()",[]])//7
        attributeArr.adding(["setStroke()",[]])//8
        attributeArr.adding(["getWhite(white: , alpha: ) -> Bool",[]])//9
        attributeArr.adding(["getHue(hue: , saturation: , brightness: , alpha: ) -> Bool",[]])//10
        attributeArr.adding(["getRed(red: , green: , blue: , alpha: ) -> Bool",[]])//11
        attributeArr.adding(["colorWithAlphaComponent(alpha: ) -> UIColor",[]])//12
        attributeArr.adding(["CGColor",[]])//13
        attributeArr.adding(["CIColor",[]])//14
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.5)
        
        a.text = "UIColor"
        a.textColor = UIColor.white
        a.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.8)
        a.textAlignment = NSTextAlignment.center
        a.font = UIFont.systemFont(ofSize: 20)
        a.textColor = UIColor.black
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
        let gesture : UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(UIColorVC.tab(_:)))
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
    func tab(_ recoginzer : UITapGestureRecognizer){
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
                a.textColor = UIColor.black
            case 1:
                a.textColor = UIColor.init(white: 0.4, alpha: 0.8)
            case 2:
                a.textColor = UIColor.init(white: 0.8, alpha: 1.0)
            default:
                break
            }
        case 1:
            switch indexPath.row {
            case 0:
                a.textColor = UIColor.black
            case 1:
                a.textColor = UIColor.init(hue: 0.5, saturation: 0.5, brightness: 0.5, alpha: 1.0)
            case 2:
                a.textColor = UIColor.init(hue: 0.3, saturation: 0.6, brightness: 0.9, alpha: 1.0)
            default:
                break
            }
        case 2:
            switch indexPath.row {
            case 0:
                a.textColor = UIColor.black
            case 1:
                a.textColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
            case 2:
                a.textColor = UIColor.init(red: 0.3, green: 0.6, blue: 0.9, alpha: 1.0)
            default:
                break
            }
            break
        case 3:
            break
        case 4:
            switch indexPath.row {
            case 0:
                a.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.8)
            case 1:
                a.backgroundColor = UIColor.init(patternImage: UIImage(named: "UIColorA.jpg")!)
            case 2:
                a.backgroundColor = UIColor.init(patternImage: UIImage(named: "UIColorB.jpg")!)
            default:
                break
            }
        case 5:
            switch indexPath.row {
            case 0:
                a.textColor = UIColor.black
            case 1:
                a.textColor = UIColor.red
            case 2:
                a.textColor = UIColor.clear
            default:
                break
            }
        case 12:
            switch indexPath.row {
            case 0:
                a.textColor = UIColor.black
            case 1:
                a.textColor = a.textColor.withAlphaComponent(0.4)
            case 2:
                a.textColor = a.textColor.withAlphaComponent(0.8)
            default:
                break
            }
        default:
            break
        }
    }
}
