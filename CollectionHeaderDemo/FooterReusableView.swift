//
//  FooterReusableView.swift
//  CollectionHeaderDemo
//
//  Created by 夏桂峰 on 15/11/27.
//  Copyright © 2015年 夏桂峰. All rights reserved.
//

import UIKit

//分组脚步重用视图
class FooterReusableView: UICollectionReusableView {
    var footerLb:UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        footerLb=UILabel()
        footerLb.frame=CGRectMake(5, 0, kWidth-10, 30)
        footerLb.backgroundColor=UIColor.cyanColor()
        self.addSubview(footerLb!)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
