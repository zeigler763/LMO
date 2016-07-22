//
//  ViewController.swift
//  LMO
//
//  Created by 于世民 on 16/7/11.
//  Copyright © 2016年 zlycare. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.whiteColor()
        
        LMNetworkTools.sharedTools.userRegister("于世民", pwd: "123", pwd2: "123") { (response, error) in
            if error != nil{
                print(error)
                return
            }
            print(response)
        }
        
        let button = UIButton()
        button.setTitle("登录", forState: .Normal)
        button.backgroundColor = UIColor.redColor()
        button.addTarget(self, action: #selector(ViewController.clickLoginBtn), forControlEvents: .TouchUpInside)
        
        view.addSubview(button)
        
        button.snp_makeConstraints { (make) in
            make.centerX.centerY.equalTo(view)
        }
    }
    
    @objc private func clickLoginBtn(){
        let LoginVC = LMLoginViewController()
        presentViewController(LoginVC, animated: true, completion: nil)
    }

}

