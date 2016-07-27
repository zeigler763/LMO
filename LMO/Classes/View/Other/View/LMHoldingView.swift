//
//  LMHoldingView.swift
//  LMO
//
//  Created by 于世民 on 16/7/27.
//  Copyright © 2016年 zlycare. All rights reserved.
//

import UIKit

class LMHoldingView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    private func setupUI(){
        addSubview(shimmeringView)
        shimmeringView.contentView = holdLabel
        shimmeringView.shimmering = true
        
        shimmeringView.snp_makeConstraints { (make) in
            make.edges.equalTo(self)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //添加闪烁效果
    private lazy var shimmeringView:FBShimmeringView = {
        let shimmer = FBShimmeringView()
        return shimmer
    }()
    
    private lazy var holdLabel:UILabel = {
        let textLabel:UILabel = UILabel()
        textLabel.font = UIFont(name: "Deutsch Gothic", size: 26)
        let shadow = NSShadow()
        shadow.shadowBlurRadius = 3
        shadow.shadowColor = UIColor.darkGrayColor()
        shadow.shadowOffset = CGSize(width: 1, height: 3)
        
        let attributeDict1 = [NSForegroundColorAttributeName:LMYellowColor,NSStrokeWidthAttributeName:-3,NSStrokeColorAttributeName:UIColor.blackColor(),NSShadowAttributeName:shadow,NSVerticalGlyphFormAttributeName:0]
        let attributedStr = NSMutableAttributedString(string: "RomeoTeam")
        attributedStr.addAttributes(attributeDict1, range: NSRange(location: 0, length: attributedStr.length))
        textLabel.attributedText = attributedStr
        textLabel.textAlignment = .Center
        return textLabel
    }()
    

}
