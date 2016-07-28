//
//  LMSettingViewController.swift
//  LMO
//
//  Created by 于世民 on 16/7/28.
//  Copyright © 2016年 zlycare. All rights reserved.
//

import UIKit

class LMSettingViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    let identifer = "Setting"
    
    var dataArray:[String] = ["清空缓存"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        
        title = "设置"
        setupUI()
    }
    
    private func setupUI(){
        view.addSubview(tableView)
        
        tableView.snp_makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: identifer)
    }
    
    @objc private func clickOutBtn(){
        
        let alert = UIAlertController(title: nil, message: "您确定退出", preferredStyle: .Alert)
        let alertAction1 = UIAlertAction(title: "确定", style: .Default, handler: { (UIAlertAction) in
            LMUserModel.deleteReflectModel(name: "User")
            LMUserAccountModel.sharedUserAccount.userModel = nil
            NSNotificationCenter.defaultCenter().postNotificationName(LMChangeRootVCNotification, object: nil)
        })
        let alertAction2 = UIAlertAction(title: "取消", style: .Cancel, handler: { (UIAlertAction) in })
        
        alert.addAction(alertAction1)
        alert.addAction(alertAction2)
        
        presentViewController(alert, animated: true, completion: { })
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(identifer, forIndexPath: indexPath)
        cell.textLabel?.text = dataArray[indexPath.row]
        cell.textLabel?.font = UIFont.systemFontOfSize(14)
        return cell
    }
    
    private lazy var tableView:UITableView = {
       let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = LMBackGayColor
       let footView = UIView()
        footView.frame.size = CGSize(width: SCREENW, height: 52)
       let loginBtn = UIButton()
        loginBtn.setTitle("退出登录", forState: .Normal)
        loginBtn.frame.size = CGSize(width: SCREENW - 24, height: 40)
        loginBtn.frame.origin = CGPoint(x: 12, y: 12)
        loginBtn.titleLabel?.textAlignment = NSTextAlignment.Center
        loginBtn.titleLabel?.font = UIFont.systemFontOfSize(15)
        loginBtn.titleLabel?.textColor = UIColor.whiteColor()
        loginBtn.backgroundColor = UIColor.redColor()
        loginBtn.addTarget(self, action: #selector(LMSettingViewController.clickOutBtn), forControlEvents: .TouchUpInside)
        footView.addSubview(loginBtn)
        tableView.tableFooterView = footView
        return tableView
    }()
    
}
