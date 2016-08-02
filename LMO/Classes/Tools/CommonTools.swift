

import UIKit
import Foundation

//字体名称 Baubau
// 蓝色
let LMYellowColor = UIColor.colorWithHexString("#5B5B5B")
// 灰色
let LMGayColor = UIColor.colorWithHexString("#909090")
//黑色
let LMBlackColor = UIColor.colorWithHexString("#323232")
//分割线颜色
let LMLineColor = UIColor.colorWithHexString("#e1e1e1")

//背景灰色
let LMBackGayColor = UIColor.colorWithHexString("#EEEEEE")

//cell背景颜色
let LMBackCellColor = UIColor.colorWithHexString("#FAFAFA")

//头背景颜色
let LMHeadBackColor = UIColor.colorWithHexString("#F0F0F0")

//头字体颜色
let LMHeadTextColor = UIColor.colorWithHexString("#646464")

// 根控制器切换通知
let LMChangeRootVCNotification = "LMChangeRootVCNotification"

/// 屏幕宽度
let SCREENW = UIScreen.mainScreen().bounds.size.width
let SCREENH = UIScreen.mainScreen().bounds.size.height

// 测试地址
let APINet = "http://192.168.2.231:/"

// 一年时间
let ONEYearDate:Double = 60 * 60 * 24 * 365

// 全局单例的时间格式化器
let SingleDataFormatter: NSDateFormatter = NSDateFormatter()

/// RGB颜色
func RGB(r r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
    return UIColor(red: r / 255, green: g / 255, blue: b / 255, alpha: 1)
}

// 随机颜色
func RandomColor() -> UIColor {
    return UIColor(red: CGFloat(arc4random() % 256) / 255, green: CGFloat(arc4random() % 256) / 255, blue: CGFloat(arc4random() % 256) / 255, alpha: 1)
}

//md5加密
extension String {
    var md5 : String{
        let str = self.cStringUsingEncoding(NSUTF8StringEncoding)
        let strLen = CC_LONG(self.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.alloc(digestLen);
        
        CC_MD5(str!, strLen, result);
        
        let hash = NSMutableString();
        for i in 0 ..< digestLen {
            hash.appendFormat("%02x", result[i]);
        }
        result.destroy();
        
        return String(format: hash as String)
    }
}

