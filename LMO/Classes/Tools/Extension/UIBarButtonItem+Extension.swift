

import UIKit

private let ItemNormalColor = UIColor(red: 80/255, green: 80/255, blue: 80/255, alpha: 1)
private let ItemFontSize: CGFloat = 14


extension UIBarButtonItem {
    
    /// 快速构造一个 UIBarButtonItem
    ///
    /// - parameter imgName: 图片名字
    /// - parameter title:   标题文字
    /// - parameter target:
    /// - parameter action:
    ///
    /// - returns: UIBarButtonItem
    convenience init(imgName: String? = nil,title: String? = nil, target: AnyObject?, action: Selector){
        self.init()
        
        let button = UIButton()
        button.addTarget(target, action: action, forControlEvents: .TouchUpInside)
        
        // 如果有图片，设置图片
        if let img = imgName {
            button.setImage(UIImage(named: img), forState: UIControlState.Normal)
            button.setImage(UIImage(named: "\(img)_highlighted"), forState: UIControlState.Highlighted)
        }
        
        // 如果有文字，设置文字
        if let t = title {
            button.setTitle(t, forState: UIControlState.Normal)
            button.titleLabel?.font = UIFont.systemFontOfSize(ItemFontSize)
            button.setTitleColor(ItemNormalColor, forState: .Normal)
//            button.setTitleColor(UIColor.orangeColor(), forState: .Highlighted)
        }
        button.sizeToFit()
        
        customView = button
        
    }
    
    
}
