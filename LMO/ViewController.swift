//
//  ViewController.swift
//  LMO
//
//  Created by 于世民 on 16/7/11.
//  Copyright © 2016年 zlycare. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    private lazy var dataArray: [String] = ["新浪初始数据2","新浪初始数据1","新浪初始数据0"]

    override func viewDidLoad() {
        super.viewDidLoad()
                
        view.backgroundColor = UIColor.whiteColor()
        
        view.addSubview(tableView)
        
        tableView.snp_makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        
        tableView.addSubview(refreshControl)
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    
    // 模拟加载数据
    @objc private func loadData(){
        print("loadData")
        dispatch_async(dispatch_get_global_queue(0, 0)) { () -> Void in
            NSThread.sleepForTimeInterval(2)
            
            // 准备数据
            let temp = ["新浪刷新数据\(self.dataArray.count)"];
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                
                // 添加到集合
                self.dataArray = temp + self.dataArray
                
                self.tableView.reloadData()
                // 结束刷新
                self.refreshControl.endRefreshing()
            })
        }
    }
    
    @objc private func clickLoginBtn(){
        let LoginVC = LMLoginViewController()
        presentViewController(LoginVC, animated: true, completion: nil)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel?.text = dataArray[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let LoginVC = LMLoginViewController()
        self.navigationController?.pushViewController(LoginVC, animated: true)
    }
    
    private lazy var tableView:UITableView = {
       let tableView = UITableView()
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    private lazy var refreshControl:ZGRefreshControl = {
        let refresh = ZGRefreshControl()
        refresh.addTarget(self, action: #selector(ViewController.loadData), forControlEvents: .ValueChanged)
        return refresh
    }()

}

