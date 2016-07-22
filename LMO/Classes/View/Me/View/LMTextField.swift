//
//  LMTextField.swift
//  LMO
//
//  Created by 于世民 on 16/7/19.
//  Copyright © 2016年 zlycare. All rights reserved.
//

import UIKit

class LMTextField: UIView, UITextFieldDelegate {

    var iconImageView:UIImageView?
    
    var rightTextFiled:UITextField?
    
    var lineView:UIView?
    
    convenience init(frame:CGRect, imageName:String?, placeHold:String?){
        self.init(frame: frame)
        iconImageView = UIImageView(frame: CGRect(x: 0, y: 15, width: 15, height: 18))
        if let image = imageName{
            iconImageView?.image = UIImage(named: image)
        }
        addSubview(iconImageView!)
        
        rightTextFiled = UITextField(frame: CGRect(x: (iconImageView?.frame.origin.x)! + iconImageView!.frame.size.width + 15, y: 0, width: frame.size.width - iconImageView!.frame.size.width - 20, height: frame.size.height))
        addSubview(rightTextFiled!)
        
        rightTextFiled?.userInteractionEnabled = true
        rightTextFiled?.delegate = self
        rightTextFiled?.font = UIFont.systemFontOfSize(14)
        rightTextFiled?.alpha = 0.5
        rightTextFiled?.textColor = UIColor.whiteColor()
        rightTextFiled?.clearButtonMode = .Always
        rightTextFiled?.autocapitalizationType = .None
        rightTextFiled?.tintColor = UIColor.whiteColor()
        
        if let place = placeHold {
        let dic = [NSForegroundColorAttributeName:UIColor.whiteColor()]
        rightTextFiled?.attributedPlaceholder = NSAttributedString(string: place, attributes: dic)
        }
        
        lineView = UIView(frame: CGRect(x: 0, y: rightTextFiled!.frame.origin.y + rightTextFiled!.frame.height, width: frame.size.width, height: 0.5))
        lineView?.backgroundColor = UIColor.whiteColor()
        addSubview(lineView!)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.alpha = 1
        textField.resignFirstResponder()
        textField.window?.makeKeyAndVisible()
        return true
    }

}
