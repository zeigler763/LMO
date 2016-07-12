//
//  LMAddNewFileController.swift
//  LuoMiOu
//
//  Created by 于世民 on 16/7/11.
//  Copyright © 2016年 zlycare. All rights reserved.
//

import UIKit
import SnapKit

class LMAddNewFileController: UIViewController {
    
    var remarkTextView:LMTextView?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        title = "新建档期"
        navigationController?.navigationBar.translucent = false
        
        setupUI()
    }
    
    private func setupUI(){
        view.addSubview(backScrollView)
        backScrollView.addSubview(remarkView)
        
        backScrollView.snp_makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        
        remarkView.snp_makeConstraints { (make) in
            make.top.equalTo(backScrollView).offset(2)
            make.left.right.equalTo(view)
            make.height.equalTo(100)
        }
    }

    lazy var backScrollView:UIScrollView = {
       let back = UIScrollView()
        back.backgroundColor = UIColor.yellowColor()
        back.alwaysBounceVertical = true
        return back
    }()
    
    lazy var remarkView:UIView = {
       let remark = UIView()
        remark.backgroundColor = UIColor.whiteColor()
        
        let remarkLabel = UILabel()
        let remarkTextView = LMTextView()
        self.remarkTextView = remarkTextView
        
        remarkLabel.text = "备注"
        remarkLabel.textColor = UIColor.lightGrayColor()
        remarkLabel.font = UIFont.systemFontOfSize(12)
        
        remarkTextView.font = UIFont.systemFontOfSize(12)
        remarkTextView.placeholder = "预订备注信息"
        
        remark.addSubview(remarkLabel)
        remark.addSubview(remarkTextView)
        
        remarkLabel.snp_makeConstraints(closure: { (make) in
            make.left.equalTo(remark).offset(12)
            make.top.equalTo(remark).offset(8)
        })
        
        remarkTextView.snp_makeConstraints(closure: { (make) in
            make.left.equalTo(remarkLabel.snp_right)
            make.top.equalTo(remark)
            make.bottom.equalTo(remark).offset(-5)
        })
        
        return remark
    }()
}
