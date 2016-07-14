//
//  LMDateButton.swift
//  LMO
//
//  Created by 于世民 on 16/7/14.
//  Copyright © 2016年 zlycare. All rights reserved.
//

import UIKit

class LMDateButton: UIButton {
    
    var titleText:UILabel?
    
    var imageText:UIImageView?
    
    convenience init(title:String?, image:UIImage?){
        self.init()
        titleText = UILabel()
        titleText?.text = title
        titleText?.font = self.titleLabel?.font
        imageText = UIImageView(image: image)
        
        addSubview(titleText!)
        addSubview(imageText!)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleText?.snp_makeConstraints(closure: { (make) in
            make.centerY.equalTo(self)
            make.left.equalTo(self)
        })
        
        imageText?.snp_makeConstraints(closure: { (make) in
            make.centerY.equalTo(self)
            make.right.equalTo(self)
            make.height.equalTo(self)
            make.width.equalTo((imageText?.snp_height)!)
        })
    }

}
