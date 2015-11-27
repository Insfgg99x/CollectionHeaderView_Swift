//
//  HeaderReusableView.swift
//  CollectionHeaderDemo
//
//  Created by 夏桂峰 on 15/11/27.
//  Copyright © 2015年 夏桂峰. All rights reserved.
//

import UIKit
//分组头部重用视图
class HeaderReusableView: UICollectionReusableView {
    var headerLb:UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        headerLb=UILabel()
        headerLb.frame=CGRectMake(5, 0, kWidth-10, 40)
        headerLb.backgroundColor=UIColor.yellowColor()
        self .addSubview(headerLb!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
