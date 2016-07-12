//
//  ZLMainNavigationController.swift
//  ShangCheng
//
//  Created by 于世民 on 16/6/8.
//  Copyright © 2016年 Nutrilite. All rights reserved.
//

import UIKit

class LMMainNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.navigationBar.barTintColor = LMBlueColor
        self.navigationBar.translucent = false
        
        //文字颜色的属性
        let textColorAttr = [
            NSForegroundColorAttributeName: UIColor.whiteColor()
        ]
        self.navigationBar.titleTextAttributes = textColorAttr
    }

    override func pushViewController(viewController: UIViewController, animated: Bool) {
        
        // 如果当前里面有控制器，才执行下面的逻辑
        if childViewControllers.count > 0 {
            // push第二个或者以后控制器隐藏底部tabBar
            viewController.hidesBottomBarWhenPushed = true
            // 设置左边item
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(imgName: "backBtn", title: "", target: self, action: #selector(LMMainNavigationController.back))
            
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    @objc private func back(){
        popViewControllerAnimated(true)
    }

}
