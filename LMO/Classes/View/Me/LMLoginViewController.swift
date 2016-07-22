//
//  LMLoginViewController.swift
//  LMO
//
//  Created by 于世民 on 16/7/19.
//  Copyright © 2016年 zlycare. All rights reserved.
//

import UIKit
import AFViewShaker

class LMLoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        setupUI()
    }
    
    private func setupUI(){
        view.addSubview(backImageView)
        view.addSubview(nameTextView)
        view.addSubview(passWordView)
        view.addSubview(loginButton)
        
        backImageView.snp_makeConstraints { (make) in
            make.edges.equalTo(view)
        }
    }
    
    @objc private func clickLoginBtn(button:UIButton){
        shakeAccount.shakeWithDuration(0.7) { 
            
        }
    }
    
    private lazy var backImageView:UIImageView = {
       let back = UIImageView()
        back.image = UIImage(named: "timg")
        return back
    }()
    
    private lazy var effectView:UIVisualEffectView = {
       let blurEffect = UIBlurEffect(style: .Light)
       let effect = UIVisualEffectView(effect: blurEffect)
        return effect
    }()
    
    private lazy var nameTextView:LMTextField = {
       let nameText = LMTextField(frame: CGRect(x: 45, y: 150, width: SCREENW - 90, height: 49), imageName: "真实姓名", placeHold: "手机/用户名/邮箱")
        return nameText
    }()
    
    private lazy var passWordView:LMTextField = {
        let passWord:LMTextField = LMTextField(frame: CGRectMake(45, CGRectGetMaxY(self.nameTextView.frame), SCREENW - 90, 49), imageName: "输入密码", placeHold: "请输入密码")
        passWord.rightTextFiled?.secureTextEntry = true
        return passWord
    }()
    
    private lazy var loginButton:UIButton = {
        let loginBtn:UIButton = UIButton(frame: CGRect(x: 45, y: CGRectGetMaxY(self.passWordView.frame) + 30, width: SCREENW - 90, height: 40))
        loginBtn.addTarget(self, action: #selector(LMLoginViewController.clickLoginBtn(_:)), forControlEvents: .TouchUpInside)
        loginBtn.setTitle("登录", forState: .Normal)
        loginBtn.titleLabel?.font = UIFont.systemFontOfSize(20)
        loginBtn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        loginBtn.layer.borderColor = UIColor.whiteColor().CGColor
        loginBtn.layer.borderWidth = 0.5
        loginBtn.layer.cornerRadius = 20
        return loginBtn
    }()
    
    private lazy var shakeAccount:AFViewShaker = {
       let shake = AFViewShaker(view: self.nameTextView)
        return shake
    }()
    
    private lazy var shakePwd:AFViewShaker = {
       let shake = AFViewShaker(view: self.passWordView)
        return shake
    }()
}
