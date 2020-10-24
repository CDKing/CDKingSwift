//
//  FoundationVC.swift
//  CDPlayerSwift
//
//  Created by CDPlayer on 2016/12/9.
//  Copyright © 2016年 CDPlayer. All rights reserved.
//

import UIKit

class FoundationVC: UIViewController ,UITableViewDelegate ,UITableViewDataSource ,UIWebViewDelegate{

    let W = UIScreen.main.bounds.width
    let H = UIScreen.main.bounds.height
    
    let titleArr : NSArray = ["简介","教程","语法参考"]
    let subTitleArr : NSArray = ["关于Swift","快速介绍","基础部分","基本运算符","字符串和字符","集合类型","控制流","函数","闭包","枚举","类和结构体","属性","方法","附属脚本","继承","构造过程","析构过程","自动引用计数","可选链","类型检查","类型嵌套","扩展","协议","泛型","高级操作符","关于参考","语法结构","类型","表达式","语句","声明","特性","模式","泛型参数","语法总结"]
    let urlArr : NSArray = ["http://doc.swift-zh.com/chapter1/01_swift.html","http://doc.swift-zh.com/chapter1/02_a_swift_tour.html","http://doc.swift-zh.com/chapter2/01_The_Basics.html","http://doc.swift-zh.com/chapter2/02_Basic_Operators.html","http://doc.swift-zh.com/chapter2/03_Strings_and_Characters.html","http://doc.swift-zh.com/chapter2/04_Collection_Types.html","http://doc.swift-zh.com/chapter2/05_Control_Flow.html","http://doc.swift-zh.com/chapter2/06_Functions.html","http://doc.swift-zh.com/chapter2/07_Closures.html","http://doc.swift-zh.com/chapter2/08_Enumerations.html","http://doc.swift-zh.com/chapter2/09_Classes_and_Structures.html","http://doc.swift-zh.com/chapter2/10_Properties.html","http://doc.swift-zh.com/chapter2/11_Methods.html","http://doc.swift-zh.com/chapter2/12_Subscripts.html","http://doc.swift-zh.com/chapter2/13_Inheritance.html","http://doc.swift-zh.com/chapter2/14_Initialization.html","http://doc.swift-zh.com/chapter2/15_Deinitialization.html","http://doc.swift-zh.com/chapter2/16_Automatic_Reference_Counting.html","http://doc.swift-zh.com/chapter2/17_Optional_Chaining.html","http://doc.swift-zh.com/chapter2/18_Type_Casting.html","http://doc.swift-zh.com/chapter2/19_Nested_Types.html","http://doc.swift-zh.com/chapter2/20_Extensions.html","http://doc.swift-zh.com/chapter2/21_Protocols.html","http://doc.swift-zh.com/chapter2/22_Generics.html","http://doc.swift-zh.com/chapter2/23_Advanced_Operators.html","http://doc.swift-zh.com/chapter3/01_About_the_Language_Reference.html","http://doc.swift-zh.com/chapter3/02_Lexical_Structure.html","http://doc.swift-zh.com/chapter3/03_Types.html","http://doc.swift-zh.com/chapter3/04_Expressions.html","http://doc.swift-zh.com/chapter3/10_Statements.html","http://doc.swift-zh.com/chapter3/05_Declarations.html","http://doc.swift-zh.com/chapter3/06_Attributes.html","http://doc.swift-zh.com/chapter3/07_Patterns.html","http://doc.swift-zh.com/chapter3/08_Generic_Parameters_and_Arguments.html","http://doc.swift-zh.com/chapter3/09_Summary_of_the_Grammar.html"];
    
    var tableView : UITableView?
    var webView   : UIWebView?
    var btn       : UIButton?
    var btn2      : UIButton?
    var btn3      : UIButton?
    var indicator : UIActivityIndicatorView?
    var errView   : UIView?
    var chacheArr : [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView = UITableView(frame: CGRect(x: 0, y: 64, width: W, height: H-64-44))
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.showsHorizontalScrollIndicator = false
        tableView?.showsVerticalScrollIndicator = false
        tableView?.backgroundColor = UIColor.init(patternImage: UIImage.init(named: "grassbk.jpg")!)
        
        webView = UIWebView(frame: CGRect(x: 0, y: 0, width: W, height: H-20))
        webView?.delegate = self
        webView?.scrollView.bounces = false
        webView?.backgroundColor = UIColor.lightGray
        
        btn = UIButton(frame: CGRect(x: 0, y: 64, width: W, height: 50))
        btn?.layer.cornerRadius = 10.0
        btn?.setTitle("点击关闭", for: UIControlState())
        btn?.backgroundColor = UIColor.init(patternImage: UIImage.init(named: "background.jpg")!)
        btn?.addTarget(self, action: #selector(self.btnTouchDown), for: UIControlEvents.touchDown)
        
        btn2 = UIButton(frame: CGRect(x: W-50, y: 0, width: 50, height: 40))
        btn2?.layer.cornerRadius = 10.0
        btn2?.setTitle("取消", for: UIControlState())
        btn2?.backgroundColor = UIColor.init(patternImage: UIImage.init(named: "bk.jpg")!)
        btn2?.addTarget(self, action: #selector(self.btn2TouchDown), for: UIControlEvents.touchDown)
        
        btn3 = UIButton(frame: CGRect(x: W-150, y: 0, width: 80, height: 40))
        btn3?.layer.cornerRadius = 10.0
        btn3?.setTitle("清除已读", for: UIControlState())
        btn3?.backgroundColor = UIColor.init(patternImage: UIImage.init(named: "bk.jpg")!)
        btn3?.addTarget(self, action: #selector(self.btn3TouchDown), for: UIControlEvents.touchDown)
        
        indicator = UIActivityIndicatorView(frame: CGRect(x: W/2-100, y: H/2-100, width: 200, height: 200))
        indicator?.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.whiteLarge
        indicator?.color = UIColor.init(patternImage: UIImage.init(named: "bk.jpg")!)
        
        errView = UIView(frame: CGRect(x: 0, y: 50, width: W, height: H-70))
        errView?.backgroundColor = UIColor.init(patternImage: UIImage.init(named: "errbk.jpg")!)
        let errLbl : UILabel = UILabel(frame: CGRect(x: W/2-150, y: 0, width: 300, height: 200))
        errLbl.textAlignment = NSTextAlignment.center
        errLbl.text = "网络出现错误或没有网络连接"
        errLbl.textColor = UIColor.gray
        
        chacheArr = UserDefaults.standard.object(forKey: "MARK") as? [String]
        if chacheArr == nil {
            chacheArr = Array(repeating: "0", count: 35)
            UserDefaults.standard.set(chacheArr, forKey: "MARK")
        }
        
        errView?.addSubview(errLbl)
        webView?.addSubview(indicator!)
        webView?.addSubview(btn!)
        self.view.addSubview(webView!)
        self.view.addSubview(tableView!)
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
    // MARK: TableView Protocol
    func numberOfSections(in tableView: UITableView) -> Int {
        return 35
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "CELL")
        if cell == nil {
            cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "CELL")
        }
        cell?.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        cell?.backgroundColor = UIColor.init(patternImage: UIImage(named: "bk.jpg")!)
        cell?.selectionStyle = UITableViewCellSelectionStyle.none
        cell?.textLabel?.text = subTitleArr[indexPath.section] as? String
        cell?.textLabel?.textColor = UIColor.white
        let markValue : String = chacheArr![indexPath.section]
        if markValue == "0" {
            cell?.imageView?.image = UIImage.init(named: "markB")
        }else{
            cell?.imageView?.image = UIImage.init(named: "markA")
        }
        
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 || section == 2 || section == 25 {
            return 50
        }else{
            return 1
        }
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView : UIView  = UIView()
        if section == 0 || section == 2 || section == 25 {
            headerView.frame = CGRect(x: 0, y: 0, width: W, height: 50)
            let lbl: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: W/2, height: 50))
            switch section {
            case 0:
                lbl.text = titleArr[0] as? String
            case 2:
                lbl.text = titleArr[1] as? String
            case 25:
                lbl.text = titleArr[2] as? String
            default:
                break
            }
            lbl.font = UIFont.boldSystemFont(ofSize: 24)
            lbl.textAlignment = NSTextAlignment.left
            if section == 0 {
                headerView.addSubview(btn2!)
                headerView.addSubview(btn3!)
            }
            headerView.addSubview(lbl)
            headerView.backgroundColor = UIColor.clear
            headerView.layer.cornerRadius = 17
            return headerView
        }else{
            return headerView
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chacheArr![indexPath.section] = "1"
        UserDefaults.standard.set(chacheArr, forKey: "MARK")
        
        UITableView.animate(withDuration: 0.2, animations: {
            tableView.frame = CGRect(x: 0, y: -1*self.H, width: tableView.frame.width, height: tableView.frame.height)
            let urlStr = self.urlArr[indexPath.section] as? String
            self.webView?.loadRequest(URLRequest(url: URL.init(string: urlStr!)!))
        })
    }
    // MARK: ButtonAction
    @objc func btnTouchDown(){
        tableView?.reloadData()
        UITableView.animate(withDuration: 0.2, animations: {
            self.tableView!.frame = CGRect(x: 0, y: 64, width: self.W, height: self.H-44-64)
        })
    }
    @objc func btn2TouchDown(){
        UITableView.animate(withDuration: 0.2, animations: {
            self.tableView!.frame = CGRect(x: 0, y: -1*self.H, width: self.tableView!.frame.width, height: self.tableView!.frame.height)
        })
    }
    @objc func btn3TouchDown(){
        chacheArr = Array(repeating: "0", count: 35)
        tableView?.reloadData()
    }
    // MARK: WebView Protocol
    func webViewDidStartLoad(_ webView: UIWebView) {
        if ((errView?.isDescendant(of: webView)) != nil) {
            errView?.removeFromSuperview()
        }
        indicator?.startAnimating()
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        indicator?.stopAnimating()
    }
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        self.webView?.addSubview(errView!)
        indicator?.stopAnimating()
        
    }

}
