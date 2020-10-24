//
//  UIFontVC.swift
//  swiftSimpleDoc
//
//  Created by apple on 16/5/11.
//  Copyright © 2016年 CDPlayer. All rights reserved.
//

import UIKit

class UIFontVC: UIViewController, UITableViewDelegate, UITableViewDataSource{

    let WIDTH  = UIScreen.main.bounds.size.width
    let HEIGHT = UIScreen.main.bounds.size.height
    
    var CDtableView : UITableView
    var a           : UILabel
    
    var attributeArr : NSMutableArray = []
    var selectionArr : NSArray = [  // 0
        ["方法:返回特定样式的UIFont","●UIFontTextStyleTitle1","●UIFontTextStyleTitle2","●UIFontTextStyleTitle3","●UIFontTextStyleHeadline","●UIFontTextStyleSubheadline","●UIFontTextStyleBody","●UIFontTextStyleCallout","●UIFontTextStyleFootnote","●UIFontTextStyleCaption1","●UIFontTextStyleCaption2"],
        // 1
        ["方法:初始化字体(字体名,字号)","●Copperplate,20","●Thonburi,26","●Georgia,20","更多请运行UIFont.familyNames()查看所有字体名"],
        // 2
        ["方法:获取所有字体名称","UIFont.familyNames()->[String] 请自行运行并查看"],
        // 3
        ["方法:返回字体FamilyName的字体名","fontNamesForFamilyName(familyName: String) -> [String]","以下为 Iowan Old Style 对应结果","●IowanOldStyle-Italic","●IowanOldStyle-Roman","●IowanOldStyle-BoldItalic","●IowanOldStyle-Bold"],
        // 4
        ["方法:系统样式字体","●5","●30"],
        // 5
        ["方法:粗体样式字体","●15","●25"],
        // 6
        ["方法:斜体样式字体","●10","●20"],
        // 7
        ["方法:另一个系统样式字体","●20,0.1","●20,0.2","●20,0.3","●20,0.4","●20,0.5"],
        // 8
        ["方法:改变数字间距以更清晰显示数字的样式","●20,0.1","●20,0.3","改变标签为纯数字"],
        // 9
        ["属性:返回familyName(String 只读)","●familyName"],
        // 10
        ["属性:返回fontName(String 只读)","●fontName"],
        // 11
        ["属性:返回pointSize(CGFloat 像素点大小 只读)","●pointSize"],
        // 12
        ["属性:返回ascender(CGFloat 上缘距离  只读)","距离最高点偏移余量(百度来的- -)","●ascender"],
        // 13
        ["属性:返回descender(CGFloat 下缘距离  只读)","距离最高点偏移余量(百度来的- -)","●descender"],
        // 14
        ["属性:返回capHeight(CGFloat 大写字母的平均高度 只读)","●capHeight"],
        // 15
        ["属性:返回xHeight(CGFloat 小写字母的平均高度 只读)","●xHeight"],
        // 16
        ["属性:返回lineHeight(CGFloat 文本行高 只读)","●lineHeight"],
        // 17
        ["属性:返回leading(CGFloat 前段距离 只读)","●leading"],
        // 18
        ["方法:使用 UIFontDescriptor 初始化","UIFontDescriptor请自行查阅API"],
        // 19
        ["方法:返回当前Font的UIFontDescriptor"],
        // 20
        ["IMG"]
    ]
    
    init(){
        CDtableView = UITableView(frame: CGRect(x: 0, y: 120, width: WIDTH, height: HEIGHT-175), style: UITableViewStyle.plain)
        a = UILabel(frame: CGRect(x: 0, y: 64, width: WIDTH, height: 50))
        a.font = UIFont.systemFont(ofSize: 20)
        
        attributeArr.add(["preferredFontForTextStyle",[]])//0
        attributeArr.add(["init?(name fontName: String, size fontSize: CGFloat)",[]])//1
        attributeArr.add(["familyNames",[]])//2
        attributeArr.add(["fontNamesForFamilyName",[]])//3
        attributeArr.add(["systemFontOfSize(fontSize: CGFloat)",[]])//4
        attributeArr.add(["boldSystemFontOfSize",[]])//5
        attributeArr.add(["italicSystemFontOfSize",[]])//6
        attributeArr.add(["systemFontOfSize(fontSize: CGFloat, weight: CGFloat)",[]])//7
        attributeArr.add(["monospacedDigitSystemFontOfSize",[]])//8
        attributeArr.add(["familyName",[]])//9
        attributeArr.add(["fontName",[]])//10
        attributeArr.add(["pointSize",[]])//11
        attributeArr.add(["ascender",[]])//12
        attributeArr.add(["descender",[]])//13
        attributeArr.add(["capHeight",[]])//14
        attributeArr.add(["xHeight",[]])//15
        attributeArr.add(["lineHeight",[]])//16
        attributeArr.add(["leading",[]])//17
        attributeArr.add(["init(descriptor: UIFontDescriptor, size pointSize: CGFloat)",[]])//18
        attributeArr.add(["fontDescriptor()",[]])//19
        attributeArr.add(["一些比较难理解的属性",[]])//20

        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.5)
        
        a.text = "UIFont"
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
        if indexPath.section == 20 {
            return 375*WIDTH/742
        }
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
        let gesture : UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(UIFontVC.tab(_:)))
        vieww.addGestureRecognizer(gesture)
        return vieww
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "LABELCELL")
        if indexPath.section == 20 {
            let imgV : UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: WIDTH, height: 375*WIDTH/742))
            imgV.image = UIImage(named: "UIFont.png")
            let scrollV : UIScrollView = UIScrollView(frame: imgV.frame)
            scrollV.addSubview(imgV)
            scrollV.contentSize = CGSize(width: WIDTH, height: 375*WIDTH/742)
            cell.addSubview(scrollV)
        }else{
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
        }
        
        return cell
    }
    @objc func tab(_ recoginzer : UITapGestureRecognizer){
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
                a.font = UIFont.systemFont(ofSize: 20)
            case 1:
                a.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.title1)
            case 2:
                a.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.title2)
            case 3:
                a.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.title3)
            case 4:
                a.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
            case 5:
                a.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.subheadline)
            case 6:
                a.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
            case 7:
                a.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.callout)
            case 8:
                a.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.footnote)
            case 9:
                a.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.caption1)
            case 10:
                a.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.caption2)
            default:
                break
            }
        case 1:
            switch indexPath.row {
            case 0:
                a.font = UIFont.systemFont(ofSize: 20)
            case 1:
                a.font = UIFont.init(name: "Copperplate", size: 20)
            case 2:
                a.font = UIFont.init(name: "Thonburi", size: 26)
            case 3:
                a.font = UIFont.init(name: "Georgia", size: 20)
            default:
                break
            }
        case 2:
            break
        case 3:
            switch indexPath.row {
            case 0:
                a.font = UIFont.systemFont(ofSize: 20)
            case 3:
                a.font = UIFont.init(name: "IowanOldStyle-Italic", size: 20)
            case 4:
                a.font = UIFont.init(name: "IowanOldStyle-Roman", size: 20)
            case 5:
                a.font = UIFont.init(name: "IowanOldStyle-BoldItalic", size: 20)
            case 6:
                a.font = UIFont.init(name: "IowanOldStyle-Bold", size: 20)
            default:
                break
            }
        case 4:
            switch indexPath.row {
            case 0:
                a.font = UIFont.systemFont(ofSize: 20)
            case 1:
                a.font = UIFont.systemFont(ofSize: 5)
            case 2:
                a.font = UIFont.systemFont(ofSize: 30)
            default:
                break
            }
        case 5:
            switch indexPath.row {
            case 0:
                a.font = UIFont.systemFont(ofSize: 20)
            case 1:
                a.font = UIFont.boldSystemFont(ofSize: 15)
            case 2:
                a.font = UIFont.boldSystemFont(ofSize: 25)
            default:
                break
            }
        case 6:
            switch indexPath.row {
            case 0:
                a.font = UIFont.systemFont(ofSize: 20)
            case 1:
                a.font = UIFont.italicSystemFont(ofSize: 10)
            case 2:
                a.font = UIFont.italicSystemFont(ofSize: 20)
            default:
                break
            }
        case 7:
            switch indexPath.row {
            case 0:
                a.font = UIFont.systemFont(ofSize: 20)
            case 1:
                a.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight(rawValue: 0.1))
            case 2:
                a.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight(rawValue: 0.2))
            case 3:
                a.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight(rawValue: 0.3))
            case 4:
                a.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight(rawValue: 0.4))
            case 5:
                a.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight(rawValue: 0.5))
            default:
                break
            }
        case 8:
            switch indexPath.row {
            case 0:
                a.font = UIFont.systemFont(ofSize: 20)
                a.text = "UIFont"
            case 1:
                a.font = UIFont.monospacedDigitSystemFont(ofSize: 20, weight: UIFont.Weight(rawValue: 0.1))
            case 2:
                a.font = UIFont.monospacedDigitSystemFont(ofSize: 20, weight: UIFont.Weight(rawValue: 0.3))
            case 3:
                a.text = "01234567890123456789"
            default:
                break
            }
        case 9:
            switch indexPath.row {
            case 0:
                a.text = "UIFont"
            case 1:
                a.text = "\(a.font.familyName)"
            default:
                break
            }
        case 10:
            switch indexPath.row {
            case 0:
                a.text = "UIFont"
            case 1:
                a.text = "\(a.font.fontName)"
            default:
                break
            }
        case 11:
            switch indexPath.row {
            case 0:
                a.text = "UIFont"
            case 1:
                a.text = "\(a.font.pointSize)"
            default:
                break
            }
        case 12:
            switch indexPath.row {
            case 0:
                a.text = "UIFont"
            case 1:
                break
            case 2:
                a.text = "\(a.font.ascender)"
            default:
                break
            }
        case 13:
            switch indexPath.row {
            case 0:
                a.text = "UIFont"
            case 1:
                break
            case 2:
                a.text = "\(a.font.descender)"
            default:
                break
            }
        case 14:
            switch indexPath.row {
            case 0:
                a.text = "UIFont"
            case 1:
                a.text = "\(a.font.capHeight)"
            default:
                break
            }
        case 15:
            switch indexPath.row {
            case 0:
                a.text = "UIFont"
            case 1:
                a.text = "\(a.font.xHeight)"
            default:
                break
            }
        case 16:
            switch indexPath.row {
            case 0:
                a.text = "UIFont"
            case 1:
                a.text = "\(a.font.lineHeight)"
            default:
                break
            }
        case 17:
            switch indexPath.row {
            case 0:
                a.text = "UIFont"
            case 1:
                a.text = "\(a.font.leading)"
            default:
                break
            }
        case 18:
            break
        case 19:
            break
        case 20:
            break
        default:
            break
        }
    }




}
