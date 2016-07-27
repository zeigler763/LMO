//
//  LMNoNetView.swift
//  LMO
//
//  Created by 于世民 on 16/7/28.
//  Copyright © 2016年 zlycare. All rights reserved.
//

import UIKit

class LMNoNetView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        addSubview(noNetImageView)
        addSubview(noNetLabel)
        
        noNetImageView.snp_makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(self).offset(30)
        }
        noNetLabel.snp_makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(noNetImageView.snp_bottom)
        }
    }
    
    private lazy var noNetImageView:UIImageView = {
       let noNet = UIImageView()
        noNet.image = UIImage(named:"net_empty")
        return noNet
    }()
    
    private lazy var noNetLabel:UILabel = {
       let noNetLabel = UILabel()
        noNetLabel.textColor = LMGayColor
        noNetLabel.text = "呜哈~请检查您的网络~"
        return noNetLabel
    }()
}
