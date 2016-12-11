//
//  ViewController.swift
//  OthersVC
//
//  Created by apple on 16/6/21.
//  Copyright © 2016年 orange. All rights reserved.
//

import UIKit

class OthersVC: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    let WIDTH  = UIScreen.main.bounds.width
    let HEIGHT = UIScreen.main.bounds.height
    
    var collectionVC : UICollectionView?
    var layout       : UICollectionViewFlowLayout?
    let otherName : NSArray = [
        ["地图","MAP"],
        ["相机","CAMERA"],
        ["跳转","JUMP"],
        ["网络","NET"],
        ["通知","NOTIFY"],
        ["画图","GRAPH"],
        ["压力触碰","FORCETOUCH"],
        ["媒体","MEDIA"],
        ["存储","STORE"],
        ["第三方","ThirdLib"],
        ["开发工具","Xcode"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        collectionVC = UICollectionView(frame: CGRect(x: 0, y: 64, width: WIDTH, height: HEIGHT-20) , collectionViewLayout: UICollectionViewFlowLayout())
        collectionVC?.dataSource = self
        collectionVC?.delegate = self
        collectionVC?.showsHorizontalScrollIndicator = false
        collectionVC?.showsVerticalScrollIndicator = false
        collectionVC?.backgroundColor = UIColor.clear
        collectionVC?.register(SubCollectionViewCell.classForCoder() , forCellWithReuseIdentifier: "COLLECTIONCELL")
        
        let img : UIImageView = UIImageView(image: UIImage(named: "CD.jpg"))
        img.frame = (collectionVC?.frame)!
        self.view.addSubview(img)
        self.view.addSubview(collectionVC!)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return otherName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : SubCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: "COLLECTIONCELL", for: indexPath) as? SubCollectionViewCell
        
        let a = arc4random()%255
        let b = arc4random()%255
        let c = arc4random()%255
        cell!.backgroundColor = UIColor.init(red: CGFloat(a)/255 , green: CGFloat(b)/255, blue: CGFloat(c)/255, alpha: 0.5)
        if indexPath.row != 1 {
            cell!.backgroundColor = UIColor(red: 1/255.0, green: 1/255.0, blue: 1/255.0, alpha: 0.2)
        }
        
        let subArr : NSArray = otherName[indexPath.row] as! NSArray
        let title : NSString = subArr[0] as! NSString
        let text  : NSString = subArr[1] as! NSString
        
        cell?.lbl?.text     = "\(title)"
        cell?.lblText?.text = "\(text)"
        
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell : SubCollectionViewCell = collectionView.cellForItem(at: indexPath) as! SubCollectionViewCell
        
        UIView.animate(withDuration: 0.1, animations: {
            cell.frame = CGRect(x: (cell.frame.origin.x)+10, y: (cell.frame.origin.y)+10, width: (cell.frame.width)-20, height: (cell.frame.height)-20)
        }, completion: { (true) in
            UIView.animate(withDuration: 0.05, animations: {
                cell.frame = CGRect(x: (cell.frame.origin.x)-10, y: (cell.frame.origin.y)-10, width: (cell.frame.width)+20, height: (cell.frame.height)+20)
            })
        })
        self.perform(#selector(self.jumpToSubView(_:)), with: indexPath, afterDelay: 0.3)
        
    }
    
    func jumpToSubView(_ pageIndexPath : IndexPath){
        switch pageIndexPath.row {
        case 1:
            self.present(CameraVC(), animated: true, completion: nil)
        default:
            break
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (WIDTH-20)/3, height: (WIDTH-20)/3)
    }
}
