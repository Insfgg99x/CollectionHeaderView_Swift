//
//  ViewController.swift
//  CollectionHeaderDemo
//
//  Created by 夏桂峰 on 15/11/27.
//  Copyright © 2015年 夏桂峰. All rights reserved.
//

import UIKit

let kWidth=UIScreen.mainScreen().bounds.size.width
let kHeight=UIScreen.mainScreen().bounds.size.height

//如果要显示分组头视图或脚视图，必须遵守UICollectionViewDelegateFlowLayout，并实现返回头视图尺寸或脚视图尺寸的代理方法
class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    var dataArray:NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createDataArray()
        createCollectionView()
        
    }
    //创建数据
    func createDataArray(){
        dataArray=NSMutableArray()
        for i in 65...90
        {
            let items=NSMutableArray()
            for j in 0...20
            {
                let m=Model()
                m.title=String(format:"第%c组第%d个数据",i,j)
                m.desc=String(format:"第%c组第%d个描述", i,j)
                items.addObject(m)
            }
            dataArray.addObject(items)
        }
    }
    //创建网格视图
    func createCollectionView(){
        //布局对象
        let flowLayout=UICollectionViewFlowLayout()
        flowLayout.sectionInset=UIEdgeInsetsMake(5, 5, 5, 5)
        flowLayout.itemSize=CGSizeMake(180, 120)
        flowLayout.minimumInteritemSpacing=5;
        flowLayout.minimumLineSpacing=10;
        
        let frame=CGRectMake(0, 20, kWidth, kHeight-20)
        
        let collectionView=UICollectionView(frame: frame, collectionViewLayout: flowLayout)
        collectionView.delegate=self
        collectionView.dataSource=self
        collectionView.backgroundColor=UIColor.whiteColor()
        
        self.view.addSubview(collectionView)
        //注册cell
        collectionView.registerClass(NSClassFromString("UICollectionViewCell"), forCellWithReuseIdentifier: "cid")
        //注册header
        collectionView.registerClass(HeaderReusableView.classForCoder(), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header")
        //注册footer
        collectionView.registerClass(FooterReusableView.classForCoder(), forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "footer")
    }
    //item数
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let array:NSMutableArray=dataArray.objectAtIndex(section) as! NSMutableArray
        return array.count
    }
    //组数
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return dataArray.count
    }
    //cell
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell:UICollectionViewCell=collectionView.dequeueReusableCellWithReuseIdentifier("cid", forIndexPath: indexPath)
        cell.backgroundColor=UIColor.orangeColor()
        
        let m=dataArray.objectAtIndex(indexPath.section).objectAtIndex(indexPath.item)
        
        for sub in cell.contentView.subviews
        {
            sub.removeFromSuperview()
        }
        
        let titleLb=UILabel()
        titleLb.text=m.title
        titleLb.frame=CGRectMake(10, 10, 140, 40)
        titleLb.textAlignment=NSTextAlignment.Center
        cell.contentView .addSubview(titleLb)
        
        let descLb=UILabel()
        descLb.text=m.desc
        descLb.frame=CGRectMake(10, 60, 140, 40)
        descLb.textAlignment=NSTextAlignment.Center
        cell.contentView.addSubview(descLb)
        
        return cell
    }
    //分组头部、尾部
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        switch kind{
        case UICollectionElementKindSectionHeader:
            let header:HeaderReusableView=collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "header", forIndexPath: indexPath) as! HeaderReusableView
            
            int index=indexPath.section+65
            header.headerLb!.text=String(format: "第%c组头部", index)
            
            return header
            
        case UICollectionElementKindSectionFooter:
            let footer:FooterReusableView=collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "footer", forIndexPath: indexPath) as!FooterReusableView
            let index=indexPath.section+65
            footer.footerLb!.text=String(format: "第%ld组脚部", NSInteger(index))
            
            return footer
            
        default:
            return HeaderReusableView()
        }
    }
    //返回分组的头部视图的尺寸，在这里控制分组头部视图的高度
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSizeMake(UIScreen.mainScreen().bounds.size.width, 40)
    }
    //返回分组脚部视图的尺寸，在这里控制分组脚部视图的高度
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSizeMake(UIScreen.mainScreen().bounds.size.width, 40)
    }
}
