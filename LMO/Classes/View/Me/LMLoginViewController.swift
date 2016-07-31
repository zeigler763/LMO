//
//  LMLoginViewController.swift
//  LMO
//
//  Created by 于世民 on 16/7/19.
//  Copyright © 2016年 zlycare. All rights reserved.
//

import UIKit
import AFViewShaker
import WKProgressHUD
import Alamofire

class LMLoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = LMBackGayColor
        setupUI()
    }
    
    private func setupUI(){
        title = "登录"
        view.addSubview(iconImageView)
        view.addSubview(nameTextView)
        view.addSubview(passWordView)
        view.addSubview(loginButton)
        view.addSubview(registerBtn)
        
        iconImageView.snp_makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.top.equalTo(view).offset(35)
            make.width.height.equalTo(90)
        }
    }
    
    @objc private func clickLoginBtn(button:UIButton){
        if nameTextView.rightTextFiled?.text == "" {
            shakeAccount.shakeWithDuration(0.7, completion: { 
                WKProgressHUD.popMessage("请您输入帐号", inView: self.view, duration: 1, animated: true)
            })
            return
        }
        if passWordView.rightTextFiled?.text == "" {
            shakePwd.shakeWithDuration(0.7, completion: {
                WKProgressHUD.popMessage("请您输入密码", inView: self.view, duration: 1, animated: true)
            })
            return
        }
        
        LMNetworkTools.sharedTools.userLogin((nameTextView.rightTextFiled?.text)!, pwd: (passWordView.rightTextFiled?.text)!) { (response, error) in
            if error != nil {
                print(error)
                return
            }
            print(response)
            let code = response!["code"] as! String
            if code == "0000" {
                WKProgressHUD.popMessage("登录成功！", inView: self.view, duration: 1, animated: true)
                let userData = response!["data"] as! [String:AnyObject]
                
                let user = LMUserModel.parse(dict: userData)
                LMUserModel.save(obj: user, name: "User", duration: ONEYearDate)
                LMUserAccountModel.sharedUserAccount.userModel = user
                
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(1.0 * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), {
                    NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: LMChangeRootVCNotification, object: nil))
                })
            }else{
                self.shakeAccount.shakeWithDuration(0.7, completion: { 
                })
                self.shakePwd.shakeWithDuration(0.7, completion: {
                })
                WKProgressHUD.popMessage("暂无帐号或密码！请确认后重新登录！", inView: self.view, duration: 1, animated: true)
            }
        }
    }
    
    @objc private func clickRegisterBtn(){
        let registerVC = LMRegisterViewController()
        navigationController?.pushViewController(registerVC, animated: true)
    }
    
    private lazy var backImageView:UIImageView = {
       let back = UIImageView()
//        back.image = UIImage(named: "timg")
        return back
    }()
    
    private lazy var effectView:UIVisualEffectView = {
       let blurEffect = UIBlurEffect(style: .Light)
       let effect = UIVisualEffectView(effect: blurEffect)
        return effect
    }()
    
    private lazy var iconImageView:UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "avatar")
//        imageView.layer.cornerRadius = 40
//        imageView.clipsToBounds = true
        return imageView
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
    
    private lazy var registerBtn:UIButton = {
        let register:UIButton = UIButton(frame: CGRect(x: 45, y: CGRectGetMaxY(self.loginButton.frame) + 10, width: 80, height: 30))
        register.setTitle("快速注册", forState: .Normal)
        register.setTitleColor(LMGayColor, forState: .Normal)
        register.titleLabel?.font = UIFont.systemFontOfSize(14)
        register.addTarget(self, action: #selector(LMLoginViewController.clickRegisterBtn), forControlEvents: .TouchUpInside)
        return register
    }()
}
