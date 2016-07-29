//
//  FirstPageViewController.swift
//  LMO
//
//  Created by 于世民 on 16/7/11.
//  Copyright © 2016年 zlycare. All rights reserved.
//

import UIKit

class LMFirstPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        
        LMNetworkTools.sharedTools.meetingAdd("09:01:02", end_time: "09:03:00", day: "2016-02-02") { (response, error) in
            if error != nil{
                print(error)
                return
            }
            print(response)
        }
        
        setupUI()
    }
    
    private func setupUI(){
        
        view.addSubview(LoginBtn)
        
        LoginBtn.snp_makeConstraints { (make) in
            make.centerX.centerY.equalTo(view)
            make.width.equalTo(150)
        }
    }
    
    @objc private func clickLoginBtn(button:UIButton){
        
        let VC = LMAddNewFileController()
        navigationController?.pushViewController(VC, animated: true)
    }
    
    lazy var LoginBtn:LMDateButton = {
        let loginBtn:LMDateButton = LMDateButton(title: "点击进入", image: UIImage(named:"home_im"), font:14)
        loginBtn.titleText?.font = UIFont.systemFontOfSize(12)
        loginBtn.addTarget(self, action: #selector(LMFirstPageViewController.clickLoginBtn(_:)), forControlEvents: .TouchUpInside)
        return loginBtn
    }()
    
}
