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
        
        setupUI()
    }
    
    private func setupUI(){
        
        view.addSubview(LoginBtn)
        
        LoginBtn.snp_makeConstraints { (make) in
            make.centerX.centerY.equalTo(view)
        }
    }
    
    @objc private func clickLoginBtn(button:UIButton){
        
        let VC = LMAddNewFileController()
        navigationController?.pushViewController(VC, animated: true)
    }
    
    lazy var LoginBtn:UIButton = {
        let loginBtn:UIButton = UIButton()
        loginBtn.backgroundColor = UIColor.blueColor()
        loginBtn.setTitle("点击进入", forState: .Normal)
        loginBtn.addTarget(self, action: #selector(LMFirstPageViewController.clickLoginBtn(_:)), forControlEvents: .TouchUpInside)
        return loginBtn
    }()

}
