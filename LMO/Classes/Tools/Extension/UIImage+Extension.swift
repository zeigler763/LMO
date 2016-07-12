


import UIKit

extension UIImage {
  
    /// 将图片按指定宽度缩放
    ///
    /// - parameter width: 指定宽度
    ///
    /// - returns: 
    func scaleToWidth(width: CGFloat) -> UIImage {
        if size.width <= width {
            return self
        }
        
        // 计算高度
        let height = size.height * (width / size.width)
        let rect = CGRect(x: 0, y: 0, width: width, height: height)
        
        // 开启图形上下文
        UIGraphicsBeginImageContext(rect.size)
        
        // 画
        self.drawInRect(rect)
        
        // 取
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        // 关闭上下文
        UIGraphicsEndImageContext()
        
        return image
    }
}


