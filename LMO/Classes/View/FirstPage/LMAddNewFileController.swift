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
        backScrollView.addSubview(dateView)
        
        view.addSubview(saveBtn)
        
        backScrollView.snp_makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        
        remarkView.snp_makeConstraints { (make) in
            make.top.equalTo(backScrollView).offset(2)
            make.left.right.equalTo(view)
            make.height.equalTo(80)
        }
        
        dateView.snp_makeConstraints { (make) in
            make.left.right.equalTo(view)
            make.top.equalTo(remarkView.snp_bottom).offset(8)
            make.height.equalTo(100)
        }
        
        saveBtn.snp_makeConstraints { (make) in
            make.left.right.bottom.equalTo(view)
            make.height.equalTo(44)
        }
        
    }
    
    @objc private func clickSaveBtn(button:UIButton){
        print(remarkTextView?.text)
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
        remarkLabel.textColor = LMGayColor
        remarkLabel.font = UIFont.systemFontOfSize(14)
        
        remarkTextView.font = UIFont.systemFontOfSize(13)
        remarkTextView.placeholder = "预订备注信息"
        
        remark.addSubview(remarkLabel)
        remark.addSubview(remarkTextView)
        
        remarkLabel.snp_makeConstraints(closure: { (make) in
            make.left.equalTo(remark).offset(12)
            make.top.equalTo(remark).offset(8)
        })
        
        remarkTextView.snp_makeConstraints(closure: { (make) in
            make.left.equalTo(remarkLabel.snp_right)
            make.top.right.equalTo(remark).offset(0.5)
            make.bottom.equalTo(remark).offset(-5)
        })
        
        return remark
    }()
    
    lazy var dateView:UIView = {
       let date = UIView()
        date.backgroundColor = UIColor.whiteColor()
        
        let lineView:UIView = UIView()
        let useDateLabel:UILabel = UILabel()
        let dateLongLabel:UILabel = UILabel()
        let useDateBtn:LMDateButton = LMDateButton(title: "2016-7-15", image: UIImage(named: "home_im"), font: 14)
        
        lineView.backgroundColor = LMLineColor
        
        useDateLabel.text = "使用日期"
        useDateLabel.textColor = LMGayColor
        useDateLabel.font = UIFont.systemFontOfSize(14)
        
        dateLongLabel.text = "使用时长"
        dateLongLabel.textColor = LMGayColor
        dateLongLabel.font = UIFont.systemFontOfSize(14)
        
        date.addSubview(lineView)
        date.addSubview(useDateLabel)
        date.addSubview(dateLongLabel)
        date.addSubview(useDateBtn)
        
        
        lineView.snp_makeConstraints(closure: { (make) in
            make.centerX.centerY.equalTo(date)
            make.width.equalTo(1)
            make.height.equalTo(80)
        })
        
        useDateLabel.snp_makeConstraints(closure: { (make) in
            make.centerX.equalTo(date).offset(-SCREENW/4)
            make.top.equalTo(lineView).offset(5)
        })
        
        dateLongLabel.snp_makeConstraints(closure: { (make) in
            make.centerX.equalTo(date).offset(SCREENW/4)
            make.top.equalTo(lineView).offset(5)
        })
        
        useDateBtn.snp_makeConstraints(closure: { (make) in
            make.left.equalTo(date)
            make.right.equalTo(lineView.snp_left)
            make.top.equalTo(useDateLabel.snp_bottom).offset(10)
            make.height.equalTo(30)
        })
        
        return date
    }()
    
    lazy var saveBtn:UIButton = {
        let saveBtn:UIButton = UIButton()
        saveBtn.backgroundColor = LMYellowColor
        saveBtn.setTitle("提交", forState: .Normal)
        saveBtn.addTarget(self, action: #selector(LMAddNewFileController.clickSaveBtn(_:)), forControlEvents: .TouchUpInside)
        return saveBtn
    }()
}
