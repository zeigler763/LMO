//
//  LMTextView.swift
//  LuoMiOu
//
//  Created by 于世民 on 16/7/11.
//  Copyright © 2016年 zlycare. All rights reserved.
//


import UIKit

class LMTextView: UITextView {
    
    // 添加 placeholder 属性，外界设置值
    var placeholder: String? {
        didSet{
            placeholderLabel.text = placeholder
        }
    }
    
    override var text: String! {
        didSet {
            placeholderLabel.hidden = hasText()
        }
    }
    
    
    override var font: UIFont? {
        didSet{
            placeholderLabel.font = font
        }
    }
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    
    private func setupUI(){
        // 添加占位控件
        addSubview(placeholderLabel)
        
        // 添加约束
        placeholderLabel.snp_makeConstraints { (make) -> Void in
            make.width.lessThanOrEqualTo(self.snp_width).offset(-10)
            make.leading.equalTo(self.snp_leading).offset(5)
            make.top.equalTo(self.snp_top).offset(8)
        }
        
        // 监听文字改变的通知
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(LMTextView.textDidChange), name: UITextViewTextDidChangeNotification, object: self)
    }
    
    @objc private func textDidChange(){
        placeholderLabel.hidden = hasText()
    }
    
    deinit{
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    // MARK: - 懒加载控件
    
    // 占位文字控件
    private lazy var placeholderLabel: UILabel = {
        let label = UILabel()
        // 设置文字颜色以及大小
        label.font = UIFont.systemFontOfSize(12)
        label.textColor = UIColor.lightGrayColor()
        label.text = "请输入文字"
        
        // 多行
        label.numberOfLines = 0
        return label
    }()
}
