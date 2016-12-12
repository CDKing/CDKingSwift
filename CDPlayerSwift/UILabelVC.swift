//
//  UILabelVC.swift
//  swiftSimpleDoc
//
//  Created by CDPlayer on 16/5/4.
//  Copyright © 2016年 CDPlayer. All rights reserved.
//

import UIKit

class UILabelVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    let WIDTH  = UIScreen.main.bounds.size.width
    let HEIGHT = UIScreen.main.bounds.size.height
    
    var CDtableView : UITableView
    var a           : UILabel
    
    var attributeArr : NSMutableArray = []
    var selectionArr : NSArray = [  // 0
        ["属性:文字内容","●HelloWorld","●GoodMorning"],
        // 1
        ["属性:文字字体(UIFont.xx)","●systemFontOfSize(18)","●boldSystemFontOfSize(22)","●italicSystemFontOfSize(26)","更多请参考UIFont"],
        // 2
        ["属性:文字颜色(UIColor.xx)","●redColor()","●purpleColor()","更多请参考UIColor"],
        // 3
        ["属性:文字阴影色(UIColor.xx)","●orangeColor()"],
        // 4
        ["属性:文字阴影偏移量(CGSize(xx))","●width: 5, height: 0","●width: 0, height: 5","●width: 5, height: 5","●width: -5, height: -5","设置前请先设置shadowColor"],
        // 5
        ["属性:文字对齐方式(NSTextAlignment.xx)","●Left","●Right","●Center","●Natural","●Justified","增加文字并设置多行显示查看效果"],
        // 6
        ["属性:文字过多显示方式(NSLineBreakMode.xx)","●ByWordWrapping","●ByCharWrapping","●ByClipping","●　ByTruncatingHead","●ByTruncatingTail","●ByTruncatingMiddle","增加文字查看效果"],
        // 7
        ["属性:富文本属性","用NSMutableAttributedString来设置","用NSAttributedString来获取(略)","addAttribute:value:range:(NSMakeRange)","●NSFontAttributeName,font,(0, 1)","●NSForegroundColorAttributeName,x,(1,1)","●NSBackgroundColorAttributeName,,(2,1)","●NSUnderlineStyleAttributeName,NSUnderlineStyle.StyleDouble.rawValue","●NSStrikethrough.,NSUxx.StyleSingle.rawValue","更多NSAttributedString-Attribute请自行查阅"],
        // 8
        ["属性:高亮文本颜色(UIColor.xx)","●redColor()","设置前请先设置highlighted"],
        // 9
        ["属性:高亮本文属性(Bool)","●true","●false"],
        // 10
        ["属性:标签是否可以响应时间(不常用)","eg.标签内添加组件后,标签的此属性为假组件为真则组件可以响应标签不可以"],
        // 11
        ["属性:标签能否改变样式(Bool)","●true","●false","尝试改变标签"],
        // 12
        ["属性:最大显示多少行(Int)","●2","●3","●0(显示所有)","增加文本内容查看效果","使用.sizeToFit()会让组件自动设置Frame(略)","如果文字超出组件大小则不会自动改变字号(adjustsFontSizeToFitWidth)"],
        // 13
        ["属性:调整字号来适应组件大小(Bool)","●true","●false","增加文本内容查看效果"],
        // 14
        ["属性:文字基线(UIBaselineAdjustment.xx)","●AlignBaselines","●AlignCenters","●None","只有当adjustsFontSizeToFitWidth生效时才能看到效果"],
        // 15
        ["属性:自动改变字号适应后最小文字大小(CGFloat 比例)","●0.8","设置后再adjustsFontSizeToFitWidth才能看到效果"],
        // 16
        ["属性:文字减少前自动紧凑文字(Bool)","●true","●false","增加文本内容查看效果"],
        // 17
        ["方法:多用于自定义标签时重写大小的方法(略)","(bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect"],
        // 18
        ["方法:多用于自定义标签时重写大小的方法(略)","drawTextInRect(rect: CGRect)"],
        // 19
        ["属性:autolayout时限定宽度(CGFloat)(略)"]
    ]

    
    init(){
        CDtableView = UITableView(frame: CGRect(x: 0, y: 120, width: WIDTH, height: HEIGHT-175), style: UITableViewStyle.plain)
        a = UILabel(frame: CGRect(x: 0, y: 64, width: WIDTH, height: 50))
        
        attributeArr.add(["text",[]])//0
        attributeArr.add(["font",[]])//1
        attributeArr.add(["textColor",[]])//2
        attributeArr.add(["shadowColor",[]])//3
        attributeArr.add(["shadowOffset",[]])//4
        attributeArr.add(["textAlignment",[]])//5
        attributeArr.add(["lineBreakMode",[]])//6
        attributeArr.add(["attributedText",[]])//7
        attributeArr.add(["highlightedTextColor",[]])//8
        attributeArr.add(["highlighted",[]])//9
        attributeArr.add(["userInteractionEnabled",[]])//10
        attributeArr.add(["enabled",[]])//11
        attributeArr.add(["numberOfLines",[]])//12
        attributeArr.add(["adjustsFontSizeToFitWidth",[]])//13
        attributeArr.add(["baselineAdjustment",[]])//14
        attributeArr.add(["minimumScaleFactor",[]])//15
        attributeArr.add(["allowsDefaultTighteningForTruncation",[]])//16
        attributeArr.add(["textRectForBounds",[]])//17
        attributeArr.add(["drawTextInRect",[]])//18
        attributeArr.add(["preferredMaxLayoutWidth",[]])//19
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        self.view.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.5)
        
        a.text = "UILabel"
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
        let gesture : UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(UILabelVC.tab(_:)))
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                a.text = "UILabel"
                break
            case 1:
                a.text = "HelloWorld"
            case 2:
                a.text = "GoodMorning"
            default:
                break
            }
        case 1:
            switch indexPath.row {
            case 0:
                a.font = UIFont.systemFont(ofSize: 20)
            case 1:
                a.font = UIFont.systemFont(ofSize: 18)
            case 2:
                a.font = UIFont.boldSystemFont(ofSize: 22)
            case 3:
                a.font = UIFont.italicSystemFont(ofSize: 26)
            default:
                break
            }
        case 2:
            switch indexPath.row {
            case 0:
                a.textColor = UIColor.black
            case 1:
                a.textColor = UIColor.red
            case 2:
                a.textColor = UIColor.purple
            default:
                break
            }
        case 3:
            switch indexPath.row {
            case 0:
                a.shadowColor = UIColor.clear
            case 1:
                a.shadowColor = UIColor.orange
            default:
                break
            }
        case 4:
            switch indexPath.row {
            case 0:
                a.shadowOffset = CGSize(width: 0, height: 0)
            case 1:
                a.shadowOffset = CGSize(width: 5, height: 0)
            case 2:
                a.shadowOffset = CGSize(width: 0, height: 5)
            case 3:
                a.shadowOffset = CGSize(width: 5, height: 5)
            case 4:
                a.shadowOffset = CGSize(width: -5, height: -5)
            default:
                break
            }
        case 5:
            switch indexPath.row {
            case 0:
                a.textAlignment = NSTextAlignment.center
                a.text = "UILabel"
            case 1:
                a.textAlignment = NSTextAlignment.left
            case 2:
                a.textAlignment = NSTextAlignment.right
            case 3:
                a.textAlignment = NSTextAlignment.center
            case 4:
                a.textAlignment = NSTextAlignment.natural
            case 5:
                a.textAlignment = NSTextAlignment.justified
            case 6:
                a.text = "ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOP"
                a.numberOfLines = 0
            default:
                break
            }
        case 6:
            switch indexPath.row {
            case 0:
                a.text = "UILabel"
            case 1:
                a.lineBreakMode = NSLineBreakMode.byWordWrapping
            case 2:
                a.lineBreakMode = NSLineBreakMode.byCharWrapping
            case 3:
                a.lineBreakMode = NSLineBreakMode.byClipping
            case 4:
                a.lineBreakMode = NSLineBreakMode.byTruncatingHead
            case 5:
                a.lineBreakMode = NSLineBreakMode.byTruncatingTail
            case 6:
                a.lineBreakMode = NSLineBreakMode.byTruncatingMiddle
            case 7:
                a.text = "HowareyouIamfineThankyouandyouIamfinetoo"
            default:
                break
            }
        case 7:
            switch indexPath.row {
            case 0:
                a.text = "UILabel"
                a.font = UIFont.systemFont(ofSize: 20)
            case 4:
                let attributeString = NSMutableAttributedString(string:"UILabel")
                attributeString.addAttribute(NSFontAttributeName, value: UIFont.boldSystemFont(ofSize: 30),
                                             range: NSMakeRange(0,1))
                a.attributedText = attributeString
            case 5:
                let attributeString = NSMutableAttributedString(string:"UILabel")
                attributeString.addAttribute(NSForegroundColorAttributeName, value: UIColor.green,
                                             range: NSMakeRange(1,1))
                a.attributedText = attributeString
            case 6:
                let attributeString = NSMutableAttributedString(string:"UILabel")
                attributeString.addAttribute(NSBackgroundColorAttributeName, value: UIColor.yellow,
                                             range: NSMakeRange(2,1))
                a.attributedText = attributeString
            case 7:
                let attributeString = NSMutableAttributedString(string:"UILabel")
                attributeString.addAttribute(NSUnderlineStyleAttributeName, value:NSUnderlineStyle.styleDouble.rawValue,
                                             range: NSMakeRange(3,1))
                a.attributedText = attributeString
            case 8:
                let attributeString = NSMutableAttributedString(string:"UILabel")
                attributeString.addAttribute(NSStrikethroughStyleAttributeName, value:NSUnderlineStyle.styleSingle.rawValue,
                                             range: NSMakeRange(4,1))
                a.attributedText = attributeString
            default:
                break
            }
        case 8:
            switch indexPath.row {
            case 0:
                a.highlightedTextColor = UIColor.black
            case 1:
                a.highlightedTextColor = UIColor.red
            default:
                break
            }
        case 9:
            switch indexPath.row {
            case 0:
                a.isHighlighted = false
            case 1:
                a.isHighlighted = true
            case 2:
                a.isHighlighted = false
            default:
                break
            }
        case 10:
            break
        case 11:
            switch indexPath.row {
            case 0:
                a.isEnabled = true
                a.text = "UILabel"
                a.textColor = UIColor.black
            case 1:
                a.isEnabled = true
            case 2:
                a.isEnabled = false
            case 3:
                a.text = "Change"
                a.textColor = UIColor.blue
            default:
                break
            }
        case 12:
            switch indexPath.row {
            case 0:
                a.text = "UILabel"
                a.numberOfLines = 1
            case 1:
                a.numberOfLines = 2
            case 2:
                a.numberOfLines = 3
            case 3:
                a.numberOfLines = 0
            case 4:
                a.text = "HowareyouIamfineThankyouandyouIamfinetooGoodGoodStudyDayDayUp"
            default:
                break
            }
        case 13:
            switch indexPath.row {
            case 0:
                a.text = "UILabel"
                a.adjustsFontSizeToFitWidth = false
            case 1:
                a.adjustsFontSizeToFitWidth = true
            case 2:
                a.adjustsFontSizeToFitWidth = false
            case 3:
                a.text = "HowareyouIamfineThankyouandyouIamfinetooGoodGoodStudyDayDayUp"
            default:
                break
            }
        case 14:
            switch indexPath.row {
            case 0:
                a.baselineAdjustment = UIBaselineAdjustment.alignBaselines
            case 1:
                a.baselineAdjustment = UIBaselineAdjustment.alignCenters
            case 2:
                a.baselineAdjustment = UIBaselineAdjustment.none
            default:
                break
            }
        case 15:
            switch indexPath.row {
            case 0:
                a.font = UIFont.systemFont(ofSize: 20)
                a.minimumScaleFactor = 0.0
            case 1:
                a.minimumScaleFactor = 0.8
            default:
                break
            }
        case 16:
            switch indexPath.row {
            case 0:
                a.allowsDefaultTighteningForTruncation = false
                a.text = "UILabel"
            case 1:
                a.allowsDefaultTighteningForTruncation = true
            case 2:
                a.allowsDefaultTighteningForTruncation = false
            case 3:
                a.text = "UILabel Label bel l hello hahahah good good "
            default:
                break
            }
        case 17:
            break
        case 18:
            break
        case 19:
           break
        default:
            break
            
        }
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
}
