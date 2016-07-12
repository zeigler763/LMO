//
//  ZLMainTabBarController.swift
//  ShangCheng
//
//  Created by 于世民 on 16/6/8.
//  Copyright © 2016年 Nutrilite. All rights reserved.
//

import UIKit

class LMMainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addChildViewControllers()
    }
    
    private func addChildViewControllers(){
        addChildViewController(LMFirstPageViewController(), title: "首页", imageName: "home")
        addChildViewController(ViewController(), title: "我", imageName: "my")
    }
    
    private func addChildViewController(vc: UIViewController, title:String, imageName: String) {
        vc.title = title;
        vc.tabBarItem.image = UIImage(named: imageName)?.imageWithRenderingMode(.AlwaysOriginal)
        vc.tabBarItem.selectedImage = UIImage(named: "\(imageName)_selected")?.imageWithRenderingMode(.AlwaysOriginal)
        
        //文字颜色的属性
        let textColorAttr = [
            NSForegroundColorAttributeName: LMRedColor
        ]
        //设置选中文字颜色
        vc.tabBarItem.setTitleTextAttributes(textColorAttr, forState: UIControlState.Selected)
        
        //使用导航控制器包裹起来
        let nav = LMMainNavigationController(rootViewController: vc)
        addChildViewController(nav)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
