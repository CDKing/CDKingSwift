//
//  UIViewVC.swift
//  CDPlayerSwift
//
//  Created by CDPlayer on 2016/12/9.
//  Copyright © 2016年 CDPlayer. All rights reserved.
//

import UIKit

class UIViewVC: UIViewController, UITableViewDelegate, UITableViewDataSource{

    let WIDTH  = UIScreen.main.bounds.size.width
    let HEIGHT = UIScreen.main.bounds.size.height
    
    var CDtableView : UITableView
    var a           : UIView
    var b           : UIButton
    var c           : UIButton
    var d           : UILabel
    var e           : UIImageView
    var scaleG      : UIPinchGestureRecognizer?
    var rotateG     : UIRotationGestureRecognizer?
    var tapG        : UITapGestureRecognizer?
    var scaleFlag   = 0
    var rotateFlagg = 0
    var tapFlag     = 0
    var shotFlag    = 0
    
    var attributeArr : NSMutableArray = []
    
    var selectionArr : NSArray = [
        // 0
        ["所有子类均适用UIView所有内容,说明多,演示少"],
        // 1
        ["方法:获取Layer类，不可通过实例获取"],
        // 2
        ["方法:实例化"],
        // 3
        ["属性:内部事件是否响应","●true","●false","添加一个按钮查看效果(点击变字母)"],
        // 4
        ["属性:视图标记,用于标记以分辨不同视图"],
        // 5
        ["属性:自身CALayer属性 UIView管理CALayer,真正绘图由CALayer(组合属性看效果)","●cornerRadius=10.0圆滑边角","●borderWidth=1.0边框线条粗度","●borderColor = UIColor.redColor().CGColor边框线条颜色","●shadowOpacity=1阴影透明度","●shadowOffset=CGSizeMake(5, 5)阴影偏移量","●shadowRadius=3阴影半径","●shadowColor=UIColor.blueColor().CGColor阴影颜色"],
        // 6
        ["方法:是否可称为焦点,返回Bool"],
        // 7
        ["属性:是否为焦点,返回Bool"],
        // 8
        ["属性:大小位置","●(0,0,300,100)","(100,100,10,10)"],
        // 9
        ["属性:内部Frame信息","●(0,0,300,100)","(100,100,10,10)"],
        // 10
        ["属性:整个视图中心点位置"],
        // 11
        ["属性:视图转换","●CGAffineTransformMakeRotation(0.75)旋转","●CGAffineTransformMakeScale(0.75, 0.75)缩放","●CGAffineTransformMakeTranslation(100, 0)平移","●CGAffineTransformIdentity恢复"],
        // 12
        ["属性:内部缩放因子 决定一个点占据像素大小(CGFloat)"],
        // 13
        ["属性:多点触控(是否允许多点触控)"],
        // 14
        ["属性:排他性触控 eg.避免同时点击多个控件(UIButton)","●true","●false","增加按钮查看效果(不太好点- -)"],
        //15
        ["方法:(子类实现)遮罩层View,不影响内部各组件相应(UIView)"],
        //16
        ["方法:判断点是否在视图内(Bool)"],
        //17
        ["方法:点在另一个视图内的点信息(CGPoint)"],
        //18
        ["方法:范围在另一个视图内的范围信息(CGRect)"],
        //19
        ["属性:内部子视图大小变化后自动调整自身尺寸"],
        //20
        ["属性:自适配模式(UIViewAutoresizing)"],
        //21
        ["方法:返回最佳Size"],
        //22
        ["方法:自动设置最佳Size","●sizeToFit()","添加一个标签视图查看效果"],
        //23
        ["方法:返回父视图(容器视图,只读)"],
        //24
        ["方法:返回子视图数组(只读)"],
        //25
        ["属性:自身Window属性"],
        //26
        ["方法:从父视图中移除","●removeFromSuperview()","增加子视图查看效果"],
        //27
        ["方法:在子视图数组的制定位置插入子视图"],
        //28
        ["方法:交换子视图"],
        //29
        ["方法:在最上图层添加子视图"],
        //30
        ["方法:将子视图置于最前端"],
        //31
        ["方法:将子视图置于最后端"],
        //32
        ["方法:子类实现,被添加子视图时调用","以下为其他相应子类实现方法(看字识意)","willRemoveSubview","willMoveToSuperview","didMoveToSuperview","willMoveToWindow","didMoveToWindow"],
        //33
        ["方法:是否为某视图的子视图"],
        //34
        ["方法:返回响应Tag的视图"],
        //35
        ["方法:重绘View 子类实现"],
        //36
        ["方法:调用drawRect进行重绘"],
        //37
        ["属性:子类限制在当前视图中"],
        //38
        ["属性:背景色"],
        //39
        ["属性:整体透明度"],
        //40
        ["属性:是否透明"],
        //41
        ["属性:重绘时是否清除以前内容"],
        //42
        ["属性:隐藏"],
        //43
        ["属性:属性内容排列模式"],
        //44
        ["属性:蒙版视图,多用于解决图片相关问题"],
        //45
        ["方法:视图动画(方法很多)","持续,延时,动画,完成后等等","●平移动画(1秒)","●平移动画(0.5秒)"],
        //46
        ["属性:视图当前所有手势(比如点击手势等)"],
        //47
        ["方法:添加手势(UIGestureRecognizer)一下例举","●UIPinchGestureRecognizer缩放","●UIRotationGestureRecognizer旋转","●UITapGestureRecognizer点击"],
        //48
        ["方法:移除手势"],
        //49
        ["方法:获取屏幕快照","●UIScreen.mainScreen强行加在楼上视图上"]
    ]
    
    init(){
        
        CDtableView = UITableView(frame: CGRect(x: 0, y: 120, width: WIDTH, height: HEIGHT-175), style: UITableViewStyle.plain)
        a = UIView(frame: CGRect(x: 100, y: 64, width: WIDTH-200, height: 50))
        b = UIButton(frame: CGRect(x: 0, y: 20, width: WIDTH-200, height: 20))
        c = UIButton(frame: CGRect(x: 0, y: 0, width: WIDTH-200, height: 20))
        d = UILabel(frame: CGRect(x: 0, y: 0, width: WIDTH-200, height: 50))
        e = UIImageView(frame: CGRect(x: 0, y: 0, width: WIDTH-200, height: 50))
        
        attributeArr.add(["基本组件,大多数组件都继承UIView,绿色部分为UIView",[]])// 0
        attributeArr.add(["layerClass()",[]])//1
        attributeArr.add(["init(frame: CGRect)",[]])//2
        attributeArr.add(["userInteractionEnabled",[]])//3
        attributeArr.add(["tag",[]])//4
        attributeArr.add(["layer(view.layer.xx)",[]])//5
        attributeArr.add(["canBecomeFocused()",[]])//6
        attributeArr.add(["focused",[]])//7
        attributeArr.add(["frame",[]])//8
        attributeArr.add(["bounds",[]])//9
        attributeArr.add(["center",[]])//10
        attributeArr.add(["transform",[]])//11
        attributeArr.add(["contentScaleFactor",[]])//12
        attributeArr.add(["multipleTouchEnabled",[]])//13
        attributeArr.add(["exclusiveTouch",[]])//14
        attributeArr.add(["hitTest(point: CGPoint, withEvent event: UIEvent?)",[]])//15
        attributeArr.add(["pointInside(point: CGPoint, withEvent event: UIEvent?)",[]])//16
        attributeArr.add(["convertPoint(point: CGPoint, toView/fromView view: UIView?)",[]])//17
        attributeArr.add(["convertRect(rect: CGRect, toView/fromView view: UIView?)",[]])//18
        attributeArr.add(["autoresizesSubviews:Bool",[]])//19
        attributeArr.add(["autoresizingMask",[]])//20
        attributeArr.add(["sizeThatFits(size: CGSize) -> CGSize",[]])//21
        attributeArr.add(["sizeToFit()",[]])//22
        attributeArr.add(["superview: UIView? { get }",[]])//23
        attributeArr.add(["subviews: [UIView] { get }",[]])//24
        attributeArr.add(["window: UIWindow? { get }",[]])//25
        attributeArr.add(["removeFromSuperview()",[]])//26
        attributeArr.add(["insertSubview(view: UIView, atIndex index: Int)",[]])//27
        attributeArr.add(["exchangeSubviewAtIndex(index1: Int, withSubviewAtIndex index2: Int)",[]])//28
        attributeArr.add(["addSubview(view: UIView)",[]])//29
        attributeArr.add(["bringSubviewToFront(view: UIView)",[]])//30
        attributeArr.add(["sendSubviewToBack(view: UIView)",[]])//31
        attributeArr.add(["didAddSubview(subview: UIView)",[]])//32
        attributeArr.add(["isDescendantOfView(view: UIView) -> Bool",[]])//33
        attributeArr.add(["viewWithTag(tag: Int)",[]])//34
        attributeArr.add(["drawRect(rect: CGRect)",[]])//35
        attributeArr.add(["setNeedsDisplayInRect(rect: CGRect)",[]])//36
        attributeArr.add(["clipsToBounds: Bool",[]])//37
        attributeArr.add(["backgroundColor: UIColor?",[]])//38
        attributeArr.add(["alpha: CGFloat",[]])//39
        attributeArr.add(["opaque: Bool",[]])//40
        attributeArr.add(["clearsContextBeforeDrawing: Bool",[]])//41
        attributeArr.add(["hidden: Bool",[]])//42
        attributeArr.add(["contentMode: UIViewContentMode",[]])//43
        attributeArr.add(["maskView",[]])//44
        attributeArr.add(["animateWithDuration(duration:delay:options:animations:completion:)",[]])//45
        attributeArr.add(["gestureRecognizers: [UIGestureRecognizer]? ",[]])//46
        attributeArr.add(["addGestureRecognizer(gestureRecognizer: UIGestureRecognizer)",[]])//47
        attributeArr.add(["removeGestureRecognizer",[]])//48
        attributeArr.add(["snapshotViewAfterScreenUpdates(afterUpdates: Bool)",[]])//49
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.5)
        
        a.backgroundColor = UIColor.green
        self.view.addSubview(a)
        
        CDtableView.delegate = self
        CDtableView.dataSource = self
        CDtableView.backgroundColor = UIColor.clear
        self.view.addSubview(CDtableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
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
        let gesture : UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(tabFun(_:)))
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
        case 3:
            switch indexPath.row {
            case 0:
                if b.isDescendant(of: a) {
                    b.removeFromSuperview()
                }
                a.isUserInteractionEnabled = true
                break
            case 1:
                a.isUserInteractionEnabled = true
                break
            case 2:
                a.isUserInteractionEnabled = false
                break
            case 3:
                b.backgroundColor = UIColor.red
                b.setTitle("A", for: UIControlState())
                b.setTitle("B", for: UIControlState.highlighted)
                a.addSubview(b)
                break
            default:
                break
            }
        case 5:
            switch indexPath.row {
            case 0:
                a.layer.cornerRadius = 0.0
                a.layer.borderColor = UIColor.clear.cgColor
                a.layer.borderWidth = 0.0
                a.layer.shadowOpacity = 0.0
                break
            case 1:
                a.layer.cornerRadius = 10.0
            case 2:
                a.layer.borderWidth = 1.0
            case 3:
                a.layer.borderColor = UIColor.red.cgColor
            case 4:
                a.layer.shadowOpacity = 1.0
            case 5:
                a.layer.shadowOffset = CGSize(width: 5, height: 5)
            case 6:
                a.layer.shadowRadius = 3.0
            case 7:
                a.layer.shadowColor = UIColor.blue.cgColor
            default:
                break
            }
        case 8:
            switch indexPath.row {
            case 0:
                a.frame = CGRect(x: 100, y: 64, width: WIDTH-200, height: 50)
            case 1:
                a.frame = CGRect(x: 0, y: 0, width: 300, height: 100)
            case 2:
                a.frame = CGRect(x: 100, y: 100, width: 10, height: 10)
            default:
                break
            }
        case 9:
            switch indexPath.row {
            case 0:
                a.frame = CGRect(x: 100, y: 64, width: WIDTH-200, height: 50)
            case 1:
                a.bounds = CGRect(x: 0, y: 0, width: 300, height: 100)
            case 2:
                a.bounds = CGRect(x: 100, y: 100, width: 10, height: 10)
            default:
                break
            }
        case 11:
            switch indexPath.row {
            case 0:
                a.transform = CGAffineTransform.identity
            case 1:
                a.transform = CGAffineTransform(rotationAngle: 0.75)
            case 2:
                a.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
            case 3:
                a.transform = CGAffineTransform(translationX: 100, y: 0)
            case 4:
                a.transform = CGAffineTransform.identity
            default:
                break
            }
        case 14:
            switch indexPath.row {
            case 0:
                if b.isDescendant(of: a) {
                    b.removeFromSuperview()
                    c.removeFromSuperview()
                }
                a.isExclusiveTouch = false
            case 1:
                a.isExclusiveTouch = true
                b.isExclusiveTouch = true
                c.isExclusiveTouch = true
            case 2:
                a.isExclusiveTouch = false
                b.isExclusiveTouch = false
                c.isExclusiveTouch = false
            case 3:
                b.backgroundColor = UIColor.red
                b.setTitle("A", for: UIControlState())
                b.setTitle("B", for: UIControlState.highlighted)
                a.addSubview(b)
                c.backgroundColor = UIColor.blue
                c.setTitle("C", for: UIControlState())
                c.setTitle("D", for: UIControlState.highlighted)
                a.addSubview(c)
            default:
                break
            }
        case 22:
            switch indexPath.row {
            case 0:
                if d.isDescendant(of: a) {
                    d.removeFromSuperview()
                }
            case 1:
                d.sizeToFit()
            case 2:
                d.text = "CD"
                d.textColor = UIColor.yellow
                d.backgroundColor = UIColor.purple
                a.addSubview(d)
            default:
                break
            }
        case 26:
            switch indexPath.row {
            case 0:
                if d.isDescendant(of: a) {
                    d.removeFromSuperview()
                }
            case 1:
                if d.isDescendant(of: a) {
                    d.removeFromSuperview()
                }
            case 2:
                d.text = "占位符"
                a.addSubview(d)
            default:
                break
            }
        case 45:
            switch indexPath.row {
            case 0:
                a.frame = CGRect(x: 100, y: 64, width: WIDTH-200, height: 50)
            case 2:
                UIView.animate(withDuration: 1, animations: {
                    self.a.frame = CGRect(x: 0, y: 64, width: self.WIDTH-200, height: 50)
                })
            case 3:
                UIView.animate(withDuration: 0.5, animations: {
                    self.a.frame = CGRect(x: 200, y: 64, width: self.WIDTH-200, height: 50)
                })
            default:
                break
            }
        case 47:
            switch indexPath.row {
            case 0:
                if rotateFlagg == 1 {
                    a.removeGestureRecognizer(rotateG!)
                    rotateFlagg = 0
                }
                if tapFlag == 1 {
                    a.removeGestureRecognizer(tapG!)
                    tapFlag = 0
                }
                if scaleFlag == 1{
                    a.removeGestureRecognizer(scaleG!)
                    scaleFlag = 0
                }
                a.transform = CGAffineTransform.identity
            case 1:
                if rotateFlagg == 1 {
                    a.removeGestureRecognizer(rotateG!)
                }
                if tapFlag == 1 {
                    a.removeGestureRecognizer(tapG!)
                }
                if scaleFlag == 0 {
                    scaleG = UIPinchGestureRecognizer.init(target: self, action: #selector(self.scale(_:)))
                    a.addGestureRecognizer(scaleG!)
                    scaleFlag = 1
                }
            case 2:
                if tapFlag == 1 {
                    a.removeGestureRecognizer(tapG!)
                }
                if scaleFlag == 1{
                    a.removeGestureRecognizer(scaleG!)
                }
                if rotateFlagg == 0 {
                    rotateG = UIRotationGestureRecognizer.init(target: self, action: #selector(self.rotate(_:)))
                    a.addGestureRecognizer(rotateG!)
                    rotateFlagg = 1
                }
            case 3:
                if rotateFlagg == 1 {
                    a.removeGestureRecognizer(rotateG!)
                }
                if scaleFlag == 1{
                    a.removeGestureRecognizer(scaleG!)
                }
                if  tapFlag == 0 {
                    tapG = UITapGestureRecognizer.init(target: self, action: #selector(self.tap))
                    a.addGestureRecognizer(tapG!)
                    tapFlag = 1
                }
            default:
                break
            }
        case 49:
            switch indexPath.row {
            case 0:
                if shotFlag == 1 {
                    a.subviews.last?.removeFromSuperview()
                    shotFlag = 0
                }
            case 1:
                if shotFlag == 0 {
                    a.addSubview(UIScreen.main.snapshotView(afterScreenUpdates: false))
                    shotFlag = 1
                }
            default:
                break
            }
        default:
            break
        }
    }
    
    func scale(_ sender : UIPinchGestureRecognizer){
        a.transform = CGAffineTransform(scaleX: sender.scale, y: sender.scale)
    }
    func rotate(_ sender : UIRotationGestureRecognizer){
        a.transform = CGAffineTransform(rotationAngle: sender.rotation)
    }
    func tap(){
        let aa = CGFloat(arc4random()%255)
        let bb = CGFloat(arc4random()%255)
        let cc = CGFloat(arc4random()%255)
        a.backgroundColor = UIColor(red: aa/255.0, green: bb/255.0, blue: cc/255.0, alpha: 0.2)
    }
    
    func tabFun(_ recoginzer : UITapGestureRecognizer){
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
