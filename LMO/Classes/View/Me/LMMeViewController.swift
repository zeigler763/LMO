//
//  LMMeViewController.swift
//  LMO
//
//  Created by 于世民 on 16/7/28.
//  Copyright © 2016年 zlycare. All rights reserved.
//

import UIKit

class LMMeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var dataArray:[[String]] = [["","我的行程"],["我的发布","我卖出的"],["设置"]]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        title = "我"
        
        setupUI()
    }
    
    private func setupUI(){
        view.addSubview(tableView)
        
        tableView.snp_makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return dataArray.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray[section].count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 && indexPath.row == 0 {
            let cell = LMMeHeaderCell.addMeHeaderCellForTableView(tableView)
            cell.clickLoginBlock = {
                let LoginVC = LMLoginViewController()
                self.navigationController?.pushViewController(LoginVC, animated: true)
            }
            return cell
        }
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel?.text = dataArray[indexPath.section][indexPath.row]
        cell.textLabel?.font = UIFont.systemFontOfSize(14)
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        cell?.selected = !(cell?.selected)!
        let titleString = dataArray[indexPath.section][indexPath.row]
        var VC:UIViewController!
        
        if titleString == "设置" {
            VC = LMSettingViewController()
        }
        if VC == nil{
            return
        }
        navigationController?.pushViewController(VC, animated: true)
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 12
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.row == 0 {
            return 100
        }
        return 44
    }
    
    private lazy var tableView:UITableView = {
       let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = LMBackGayColor
        return tableView
    }()
    
}
