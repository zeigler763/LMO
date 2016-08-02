//
//  LMMeHeaderCell.swift
//  LMO
//
//  Created by 于世民 on 16/7/28.
//  Copyright © 2016年 zlycare. All rights reserved.
//

import UIKit

let identifier = "MeHeader"
class LMMeHeaderCell: UITableViewCell {
    
    var clickLoginBlock: (()->())?
    
    class func addMeHeaderCellForTableView(tableView:UITableView) -> LMMeHeaderCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier) as? LMMeHeaderCell
        if cell == nil {
            cell = LMMeHeaderCell(style: .Default, reuseIdentifier: identifier)
        }
        return cell!
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    private func setupUI(){
        contentView.addSubview(avatarView)
        contentView.addSubview(promptLable)
        contentView.addSubview(loginBtn)
        contentView.addSubview(nameLabel)
        contentView.addSubview(descLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if LMUserAccountModel.sharedUserAccount.userLogin {
            print("已经登录")
            nameLabel.text = LMUserAccountModel.sharedUserAccount.userModel!.name!
            promptLable.hidden = true
            loginBtn.hidden = true
            nameLabel.hidden = false
            descLabel.hidden = false
        }else{
            print("没有登录")
            promptLable.hidden = false
            loginBtn.hidden = false
            nameLabel.hidden = true
            descLabel.hidden = true
        }
        avatarView.snp_makeConstraints { (make) in
            make.centerY.equalTo(contentView)
            make.left.equalTo(contentView).offset(16)
            make.height.width.equalTo(70)
        }
        promptLable.snp_makeConstraints { (make) in
            make.left.equalTo(avatarView.snp_right).offset(12)
            make.centerY.equalTo(contentView)
        }
        loginBtn.snp_makeConstraints { (make) in
            make.centerY.equalTo(contentView)
            make.right.equalTo(contentView).offset(-16)
            make.height.equalTo(30)
            make.width.equalTo(80)
        }
        nameLabel.snp_makeConstraints { (make) in
            make.top.equalTo(avatarView).offset(15)
            make.left.equalTo(avatarView.snp_right).offset(12)
        }
        descLabel.snp_makeConstraints { (make) in
            make.bottom.equalTo(avatarView).offset(-15)
            make.left.equalTo(avatarView.snp_right).offset(12)
        }
        
    }
    
    @objc private func clickLoginBtn(){
        clickLoginBlock?()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var avatarView:UIImageView = {
       let avatar = UIImageView()
        avatar.image = UIImage(named: "avatar")
        avatar.layer.cornerRadius = 35
        avatar.clipsToBounds = true
        return avatar
    }()
    
    private lazy var nameLabel:UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = UIFont.systemFontOfSize(13)
        return nameLabel
    }()
    
    private lazy var descLabel:UILabel = {
       let descLabel = UILabel()
        descLabel.font = UIFont.systemFontOfSize(13)
        descLabel.text = "一个Swift小学生"
        return descLabel
    }()
    
    private lazy var promptLable:UILabel = {
       let promptLabel = UILabel()
        promptLabel.font = UIFont.systemFontOfSize(14)
        promptLabel.text = "您还没有登录哦。"
        return promptLabel
    }()
    
    private lazy var loginBtn:UIButton = {
        let loginBtn = UIButton()
        loginBtn.setTitle("马上登录", forState: .Normal)
        loginBtn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        loginBtn.titleLabel?.font = UIFont.systemFontOfSize(15)
        loginBtn.backgroundColor = LMYellowColor
        loginBtn.addTarget(self, action: #selector(LMMeHeaderCell.clickLoginBtn), forControlEvents: .TouchUpInside)
        return loginBtn
    }()
    
}
