//
//  IntroduceVC.swift
//  CDPlayerSwift
//
//  Created by CDPlayer on 2016/12/9.
//  Copyright © 2016年 CDPlayer. All rights reserved.
//

import UIKit

class IntroduceVC: UIViewController {

    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.4)
        
        let a = UILabel(frame: CGRect(x: 0, y: 64, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height-108))
        a.numberOfLines = 0
        a.text = "组件篇说明：\n每个组件都有很多属性(方法，协议等),点击每个选项查看相应内容(列举一些基本用法)\n1)第一行为说明，点击后标签回复本选项的初始状态(纯翻译API)。\n2)●为当前选项的属性(方法，协议等)的可设定项，点击后可以查看效果\n3)后几行有 增加文本内容查看效果 类字样也可进行选择,一般多为补充性说明\n4)所有效果请注意上方的组件变化\n5)当存在 略 时,因过于复杂或过于简单,请自行查阅API文档或者网站\n6)点击左上角目录进行组件切换\n\n\n\n建议或者意见,请于APPStore评论或者置信812860059@qq.com\n\n欢迎交流\n🐭🐂🐅🐰🐲🐍🐴🐑🐵🐔🐶🐷"
        a.sizeToFit()
        self.view.addSubview(a)
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

}
