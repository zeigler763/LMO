//
//  LMRegisterViewController.swift
//  LMO
//
//  Created by 于世民 on 16/7/27.
//  Copyright © 2016年 zlycare. All rights reserved.
//

import UIKit
import AFViewShaker
import WKProgressHUD

class LMRegisterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        
        title = "注册"
        setupUI()
    }
    
    private func setupUI(){
        
        view.addSubview(nameTextView)
        view.addSubview(passWordView)
        view.addSubview(passWordAgainView)
        view.addSubview(registerButton)
    }
    
    @objc private func clickRegisterBtn(){
        if nameTextView.rightTextFiled?.text == "" {
            shakeAccount.shakeWithDuration(0.7, completion: {
                WKProgressHUD.popMessage("请您输入您的注册帐号", inView: self.view, duration: 1, animated: true)
            })
            return
        }
        if passWordView.rightTextFiled?.text == "" {
            shakePwd.shakeWithDuration(0.7, completion: {
                WKProgressHUD.popMessage("请您输入您的注册密码", inView: self.view, duration: 1, animated: true)
            })
            return
        }
        if passWordAgainView.rightTextFiled?.text == "" {
            shakePwdAgin.shakeWithDuration(0.7, completion: {
                WKProgressHUD.popMessage("请您再次输入您的注册密码", inView: self.view, duration: 1, animated: true)
            })
            return
        }
        
        if passWordView.rightTextFiled?.text != passWordAgainView.rightTextFiled?.text {
            shakePwd.shakeWithDuration(0.7, completion: {
            })
            shakePwdAgin.shakeWithDuration(0.7, completion: {
                WKProgressHUD.popMessage("两次输入的密码不一致，请查证后再次输入", inView: self.view, duration: 1, animated: true)
            })
            return
        }
    }
    
    private lazy var nameTextView:LMTextField = {
        let nameText = LMTextField(frame: CGRect(x: 45, y: 20, width: SCREENW - 90, height: 49), imageName: "真实姓名", placeHold: "请输入您的手机/用户名/邮箱")
        return nameText
    }()
    
    private lazy var passWordView:LMTextField = {
        let passWord:LMTextField = LMTextField(frame: CGRectMake(45, CGRectGetMaxY(self.nameTextView.frame), SCREENW - 90, 49), imageName: "输入密码", placeHold: "请输入您设置的密码")
        passWord.rightTextFiled?.secureTextEntry = true
        return passWord
    }()
    
    private lazy var passWordAgainView:LMTextField = {
        let passWord:LMTextField = LMTextField(frame: CGRectMake(45, CGRectGetMaxY(self.passWordView.frame), SCREENW - 90, 49), imageName: "输入密码", placeHold: "请再次输入您设置的密码")
        passWord.rightTextFiled?.secureTextEntry = true
        return passWord
    }()
    
    private lazy var registerButton:UIButton = {
        let loginBtn:UIButton = UIButton(frame: CGRect(x: 45, y: CGRectGetMaxY(self.passWordAgainView.frame) + 30, width: SCREENW - 90, height: 40))
        loginBtn.addTarget(self, action: #selector(LMRegisterViewController.clickRegisterBtn), forControlEvents: .TouchUpInside)
        loginBtn.setTitle("注册", forState: .Normal)
        loginBtn.titleLabel?.font = UIFont.systemFontOfSize(20)
        loginBtn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        loginBtn.backgroundColor = LMYellowColor
        loginBtn.layer.cornerRadius = 15
        loginBtn.clipsToBounds = true
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
    
    private lazy var shakePwdAgin:AFViewShaker = {
       let shake = AFViewShaker(view: self.passWordAgainView)
        return shake
    }()
    
}
