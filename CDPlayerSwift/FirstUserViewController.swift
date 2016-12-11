//
//  FirstUserViewController.swift
//  CDPlayerSwift
//
//  Created by CDPlayer on 2016/12/9.
//  Copyright © 2016年 CDPlayer. All rights reserved.
//

import UIKit

class FirstUserViewController: UIViewController ,UIScrollViewDelegate{

    let WIDTH  = UIScreen.main.bounds.size.width
    let HEIGHT = UIScreen.main.bounds.size.height
    
    var imgScrollView : UIScrollView
    var mainScrollView : UIScrollView
    var pageControl : UIPageControl
    
    var viewA : UIView
    var viewB : UIView
    var btn : UIButton
    var btnFlag : Int
    
    init() {
        imgScrollView = UIScrollView(frame: CGRect(x: 0.0, y: HEIGHT/10, width: WIDTH, height: HEIGHT*7/10))
        mainScrollView = UIScrollView(frame: CGRect(x: 0.0, y: 0.0, width: WIDTH, height: HEIGHT))
        viewA = UIView(frame: CGRect(x: 0.0, y: 40.0, width: WIDTH, height: HEIGHT*7/10))
        pageControl = UIPageControl(frame: CGRect(x: WIDTH/2 - 25, y: HEIGHT*9/10, width: 50.0, height: HEIGHT/10))
        viewB = UIView(frame: CGRect(x: viewA.frame.width, y: 40.0, width: WIDTH, height: HEIGHT*7/10))
        btn = UIButton(frame: CGRect(x: WIDTH/2-20, y: -90.0, width: 40.0, height: 40.0))
        btnFlag = 1
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.clear
        
        
        let imageView : UIImageView = UIImageView(image: UIImage(named: "ImgScrollViewImage.jpg"))
        imgScrollView.addSubview(imageView)
        imgScrollView.contentSize = CGSize(width: imageView.frame.width, height: HEIGHT)
        imgScrollView.isScrollEnabled = false
        
        mainScrollView.delegate = self
        mainScrollView.isPagingEnabled = true
        mainScrollView.bounces = false
        mainScrollView.showsHorizontalScrollIndicator = false
        mainScrollView.showsVerticalScrollIndicator = false
        
        pageControl.numberOfPages = 2
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = UIColor.blue
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        
        viewA.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.5)
        let lblA : UILabel = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: WIDTH, height: 50.0))
        lblA.textAlignment = NSTextAlignment.center
        lblA.text = "欢迎使用\"小陈Swift\""
        lblA.font = UIFont.boldSystemFont(ofSize: 30)
        lblA.layer.borderWidth = 1.0
        lblA.layer.borderColor = UIColor.blue.cgColor
        lblA.layer.cornerRadius = 20.0
        lblA.textColor = UIColor.init(red: 28/255, green: 152/255, blue: 264/255, alpha: 0.8)
        viewA.addSubview(lblA)
        
        firstNotice()
        self.perform(#selector(FirstUserViewController.secondNotice), with: self, afterDelay: 0.5)
        self.perform(#selector(FirstUserViewController.thirdNotice), with: self, afterDelay: 1.0)
        self.perform(#selector(FirstUserViewController.forthNotice), with: self, afterDelay: 1.5)
        self.perform(#selector(FirstUserViewController.fifthNotice), with: self, afterDelay: 2.0)
        self.perform(#selector(FirstUserViewController.sixthNotice), with: self, afterDelay: 2.5)
        
        viewB.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.5)
        let lblB : UILabel = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: WIDTH, height: 50.0))
        lblB.textAlignment = NSTextAlignment.center
        lblB.text = "点击进入\"小陈Swift\""
        lblB.font = UIFont.boldSystemFont(ofSize: 30)
        lblB.layer.borderWidth = 1.0
        lblB.layer.borderColor = UIColor.blue.cgColor
        lblB.layer.cornerRadius = 20.0
        lblB.textColor = UIColor.init(red: 28/255, green: 152/255, blue: 264/255, alpha: 0.8)
        viewB.addSubview(lblB)
        
        mainScrollView.addSubview(viewA)
        mainScrollView.addSubview(viewB)
        mainScrollView.contentSize = CGSize(width: viewA.frame.width + viewB.frame.width, height: HEIGHT*7/10)
        
        self.view.addSubview(imgScrollView)
        self.view.addSubview(mainScrollView)
        self.view.addSubview(pageControl)
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
    func firstNotice(){
        let lblAA : UILabel = UILabel(frame: CGRect(x: -1*WIDTH, y: 50.0, width: WIDTH, height: 50.0))
        lblAA.textAlignment = NSTextAlignment.left
        lblAA.numberOfLines = 0
        lblAA.text = "◉ 简洁明了的知识点!"
        lblAA.font = UIFont.systemFont(ofSize: 24)
        lblAA.textColor = UIColor.purple
        
        UIView.animate(withDuration: 0.8, animations: {
            lblAA.frame = CGRect(x: 50.0, y: 50.0, width: self.WIDTH, height: 50.0)
        }, completion: { (true) in
            UIView.animate(withDuration: 0.2, animations: {
                lblAA.frame = CGRect(x: 0.0, y: 50.0, width: self.WIDTH, height: 50.0)
            })
        })
        viewA.addSubview(lblAA)
    }
    func secondNotice(){
        let lblAAA : UILabel = UILabel(frame: CGRect(x: -1*WIDTH, y: 100.0, width: WIDTH, height: 50.0))
        lblAAA.textAlignment = NSTextAlignment.left
        lblAAA.numberOfLines = 0
        lblAAA.text = "◉ 一看即会的帮助！"
        lblAAA.font = UIFont.systemFont(ofSize: 24)
        lblAAA.textColor = UIColor.purple
        
        UIView.animate(withDuration: 0.8, animations: {
            lblAAA.frame = CGRect(x: 50.0, y: 100.0, width: self.WIDTH, height: 50.0)
        }, completion: { (true) in
            UIView.animate(withDuration: 0.2, animations: {
                lblAAA.frame = CGRect(x: 0.0, y: 100.0, width: self.WIDTH, height: 50.0)
            })
        })
        viewA.addSubview(lblAAA)
    }
    func thirdNotice(){
        let lblAAAA : UILabel = UILabel(frame: CGRect(x: -1*WIDTH, y: 150.0, width: WIDTH, height: 50.0))
        lblAAAA.textAlignment = NSTextAlignment.left
        lblAAAA.numberOfLines = 0
        lblAAAA.text = "◉ 看了还想看的APP！"
        lblAAAA.font = UIFont.systemFont(ofSize: 24)
        lblAAAA.textColor = UIColor.purple
        
        UIView.animate(withDuration: 0.8, animations: {
            lblAAAA.frame = CGRect(x: 50.0, y: 150.0, width: self.WIDTH, height: 50.0)
        }, completion: { (true) in
            UIView.animate(withDuration: 0.2, animations: {
                lblAAAA.frame = CGRect(x: 0.0, y: 150.0, width: self.WIDTH, height: 50.0)
            })
        })
        viewA.addSubview(lblAAAA)
    }
    func forthNotice(){
        let lblAAAA : UILabel = UILabel(frame: CGRect(x: -1*WIDTH, y: 200.0, width: WIDTH, height: 50.0))
        lblAAAA.textAlignment = NSTextAlignment.left
        lblAAAA.numberOfLines = 0
        lblAAAA.text = "◉ 毫无作用的引导页面！"
        lblAAAA.font = UIFont.systemFont(ofSize: 18)
        lblAAAA.textColor = UIColor.purple
        
        UIView.animate(withDuration: 0.8, animations: {
            lblAAAA.frame = CGRect(x: 50.0, y: 200.0, width: self.WIDTH, height: 50.0)
        }, completion: { (true) in
            UIView.animate(withDuration: 0.2, animations: {
                lblAAAA.frame = CGRect(x: 0.0, y: 200.0, width: self.WIDTH, height: 50.0)
            })
        })
        viewA.addSubview(lblAAAA)
    }
    func fifthNotice(){
        let lblAAAA : UILabel = UILabel(frame: CGRect(x: -1*WIDTH, y: 250.0, width: WIDTH, height: 50.0))
        lblAAAA.textAlignment = NSTextAlignment.left
        lblAAAA.numberOfLines = 0
        lblAAAA.text = "◉ 感谢你使用本APP！"
        lblAAAA.font = UIFont.systemFont(ofSize: 18)
        lblAAAA.textColor = UIColor.purple
        
        UIView.animate(withDuration: 0.8, animations: {
            lblAAAA.frame = CGRect(x: 50.0, y: 250.0, width: self.WIDTH, height: 50.0)
        }, completion: { (true) in
            UIView.animate(withDuration: 0.2, animations: {
                lblAAAA.frame = CGRect(x: 0.0, y: 250.0, width: self.WIDTH, height: 50.0)
            })
        })
        viewA.addSubview(lblAAAA)
    }
    func sixthNotice(){
        let lblAAAA : UILabel = UILabel(frame: CGRect(x: -1*WIDTH, y: 300.0, width: WIDTH, height: 50.0))
        lblAAAA.textAlignment = NSTextAlignment.left
        lblAAAA.numberOfLines = 0
        lblAAAA.text = "◉ 再次感谢使用！"
        lblAAAA.font = UIFont.systemFont(ofSize: 18)
        lblAAAA.textColor = UIColor.purple
        
        UIView.animate(withDuration: 0.8, animations: {
            lblAAAA.frame = CGRect(x: 50.0, y: 300.0, width: self.WIDTH, height: 50.0)
        }, completion: { (true) in
            UIView.animate(withDuration: 0.2, animations: {
                lblAAAA.frame = CGRect(x: 0.0, y: 300.0, width: self.WIDTH, height: 50.0)
            })
        })
        viewA.addSubview(lblAAAA)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // 背景不同Offset移动
        imgScrollView.contentOffset = CGPoint(x: (500-WIDTH)*mainScrollView.contentOffset.x/WIDTH, y: 0.0)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        // 改变页码
        if mainScrollView.contentOffset.x == WIDTH {
            pageControl.currentPage = 1
            // 进入使用按钮
            btn.setTitle("进入", for: UIControlState())
            btn.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.5)
            btn.setTitleColor(UIColor.red, for: UIControlState())
            btn.addTarget(self, action: #selector(FirstUserViewController.btnTouch), for: UIControlEvents.touchDown)
            viewB.addSubview(btn)
            if btnFlag == 1 {
                btnDown()
                self.perform(#selector(FirstUserViewController.btnBigger), with: self, afterDelay: 0.8)
                self.perform(#selector(FirstUserViewController.btnNormal), with: self, afterDelay: 1.0)
                btnFlag = 2
            }
        }else{
            pageControl.currentPage = 0
        }
    }
    
    func btnDown(){
        UIView.animate(withDuration: 0.8, animations: {
            self.btn.frame = CGRect(x: self.WIDTH/2-20, y: 300.0, width: 40.0, height: 40.0)
        })
    }
    func btnBigger(){
        UIView.animate(withDuration: 0.2, animations: {
            self.btn.frame = CGRect(x: self.WIDTH/2-100, y: 120.0, width: 200.0, height: 200.0)
            self.btn.transform = self.btn.transform.rotated(by: 3.14)
        })
    }
    func btnNormal(){
        UIView.animate(withDuration: 0.1, animations: {
            self.btn.frame = CGRect(x: self.WIDTH/2-50,y: 300.0, width: 100.0, height: 100.0)
            self.btn.transform = self.btn.transform.rotated(by: 3.14)
        })
    }
    func btnTouch(){
        // 跳转画面
        btn.setTitle("", for: UIControlState())
        btnBBBig()
        self.perform(#selector(FirstUserViewController.jumpPage), with: self, afterDelay: 0.2)
        pageControl.removeFromSuperview()
    }
    func btnBBBig(){
        UIView.animate(withDuration: 0.2, animations: {
            self.btn.frame = CGRect(x: self.WIDTH/2-300, y: -80.0, width: 600.0, height: 600.0)
            self.btn.transform = self.btn.transform.rotated(by: 3.14)
            self.btn.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.9)
        })
    }
    func jumpPage(){
        // 进入主界面
        imgScrollView.removeFromSuperview()
        mainScrollView.removeFromSuperview()
        let maintab = MainTabBarController.init()
        let navi : UINavigationController = UINavigationController(rootViewController: maintab)
        self.present(navi, animated: true) {
            
        }
    }

}
