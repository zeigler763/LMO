//
//  LMDateButton.swift
//  LMO
//
//  Created by 于世民 on 16/7/14.
//  Copyright © 2016年 zlycare. All rights reserved.
//

import UIKit

class LMDateButton: UIButton {
    
    var titleText:UILabel? {
        didSet{
            titleLabel?.font = titleText?.font
        }
    }
    
    var imageText:UIImageView?
    
    convenience init(title:String?, image:UIImage?, font:CGFloat?){
        self.init()
        titleText = UILabel()
        titleText?.text = title
        imageText = UIImageView(image: image)
        
        if font != nil {
            
            titleText?.font = UIFont.systemFontOfSize(font!)
        }
        
        addSubview(titleText!)
        addSubview(imageText!)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleText?.snp_makeConstraints(closure: { (make) in
            make.centerY.equalTo(self)
            make.centerX.equalTo(self)
        })
        
        imageText?.snp_makeConstraints(closure: { (make) in
            make.centerY.equalTo(self)
            make.right.equalTo(self)
            make.height.equalTo(self)
            make.width.equalTo((imageText?.snp_height)!)
        })
    }

}
