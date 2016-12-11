//
//  SubCollectionViewCell.swift
//  OthersVC
//
//  Created by apple on 16/6/21.
//  Copyright © 2016年 orange. All rights reserved.
//

import UIKit

class SubCollectionViewCell: UICollectionViewCell {
    
    var lbl     : UILabel?
    var lblText : UILabel?
    
    let WIDTH  = UIScreen.main.bounds.width
    let HEIGHT = UIScreen.main.bounds.height
    
    override  init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.cornerRadius = 10.0
        
        lbl = UILabel(frame: CGRect(x: 0, y: 0, width: (WIDTH-20)/3, height: (WIDTH-15)/6))
        lbl?.textAlignment = NSTextAlignment.center
        lbl?.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.2)
        lbl?.font = UIFont.boldSystemFont(ofSize: 22)
        
        lblText = UILabel(frame: CGRect(x: 0, y: (WIDTH-15)/6, width: (WIDTH-20)/3, height: (WIDTH-15)/6))
        lblText?.textAlignment = NSTextAlignment.center
        lblText?.font = UIFont.systemFont(ofSize: 14)
        
        self.addSubview(lbl!)
        self.addSubview(lblText!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
