//
//  ZGRefreshControl.swift
//  下拉刷新控件
//
//  Created by 于世民 on 16/7/26.
//  Copyright © 2016年 zlycare. All rights reserved.
//

import UIKit

//刷新状态临界点的值
private let ZGRefreshStateHeight: CGFloat = 50

//枚举
enum ZGRefreshState: Int {
    case Normal = 0
    case Pulling = 1
    case Refreshing = 2
}

class ZGRefreshControl: UIControl {

    //记录当前控件添加到哪个View上
    var scrollView: UIScrollView?
    // 旧状态
    var oldState: ZGRefreshState?
    
    var refreshState: ZGRefreshState = .Normal {
        didSet{
            switch refreshState {
            case .Pulling:
                return
            case .Normal:
            if oldState == .Refreshing {
                UIView.animateWithDuration(0.25, animations: { () -> Void in
                    var contentInset = self.scrollView!.contentInset
                    contentInset.top -= self.es_height
                    self.scrollView?.contentInset = contentInset
                })
            }
                shimmeringView.shimmering = false
            case .Refreshing:
               UIView.animateWithDuration(0.25, animations: { () -> Void in
                    var contentInset = self.scrollView!.contentInset
                    contentInset.top += self.es_height
                    self.scrollView?.contentInset = contentInset
                })
                
                shimmeringView.shimmering = true
                // 调用刷新的方法
                sendActionsForControlEvents(.ValueChanged)
            }
            oldState = refreshState
        }
    }
    
    //MARK: -提供给外界的方法
    func endRefreshing(){
       self.refreshState = .Normal
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    private func setupUI(){
        es_height = ZGRefreshStateHeight
        es_y = -ZGRefreshStateHeight
        
        addSubview(shimmeringView)
        shimmeringView.contentView = textLabel
    }
    
    override func willMoveToSuperview(newSuperview: UIView?) {
        super.willMoveToSuperview(newSuperview)
        if let superView = newSuperview as? UIScrollView where superView.isKindOfClass(UIScrollView.self){
            superView.addObserver(self, forKeyPath: "contentOffset", options: .New, context: nil)
            self.scrollView = superView 
            self.es_width = UIScreen.mainScreen().bounds.width
        }
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        
        let contentInsetTop = self.scrollView!.contentInset.top
        
        let contentOffsetY = self.scrollView!.contentOffset.y
        
        let criticalValue = -contentInsetTop - self.es_height
        
        if scrollView!.dragging {
            if refreshState == .Normal && contentOffsetY < criticalValue {
                self.refreshState = .Pulling
            }else if refreshState == .Pulling && contentOffsetY >= criticalValue {
                self.refreshState = .Normal
            }
        }else{
            
            if self.refreshState == .Pulling {
                self.refreshState = .Refreshing
            }
        }
        
    }
    
    deinit{
        if let scrollView = self.scrollView {
            scrollView.removeObserver(self, forKeyPath: "contentOffset")
        }
    }
    
    //添加闪烁效果
    private lazy var shimmeringView:FBShimmeringView = {
       let shimmer = FBShimmeringView(frame: CGRect(x: 0, y: 0, width: SCREENW, height: ZGRefreshStateHeight))
        shimmer.shimmeringSpeed = 200
        shimmer.shimmeringPauseDuration = 0
        return shimmer
    }()
    
    private lazy var textLabel:UILabel = {
        let textLabel:UILabel = UILabel(frame: self.shimmeringView.frame)
        
        let shadow = NSShadow()
        shadow.shadowBlurRadius = 3
        shadow.shadowColor = UIColor.darkGrayColor()
        shadow.shadowOffset = CGSize(width: 1, height: 3)
        
        let attributeDict1 = [NSFontAttributeName:UIFont.systemFontOfSize(24),NSForegroundColorAttributeName:UIColor.blackColor(),NSStrokeWidthAttributeName:-3,NSStrokeColorAttributeName:LMBlueColor,NSShadowAttributeName:shadow,NSVerticalGlyphFormAttributeName:0]
//        let attributeDict2 = [NSFontAttributeName:UIFont.systemFontOfSize(22),NSForegroundColorAttributeName:UIColor.blackColor(),NSStrokeWidthAttributeName:3,NSStrokeColorAttributeName:UIColor.blackColor(),NSShadowAttributeName:shadow,NSVerticalGlyphFormAttributeName:0]
//        let attributeDict3 = [NSFontAttributeName:UIFont.systemFontOfSize(22),NSForegroundColorAttributeName:UIColor.blackColor(),NSStrokeWidthAttributeName:3,NSStrokeColorAttributeName:UIColor.blackColor(),NSShadowAttributeName:shadow,NSVerticalGlyphFormAttributeName:0]
//        let attributeDict4 = [NSFontAttributeName:UIFont.systemFontOfSize(22),NSForegroundColorAttributeName:UIColor.blackColor(),NSStrokeWidthAttributeName:3,NSStrokeColorAttributeName:UIColor.blackColor(),NSShadowAttributeName:shadow,NSVerticalGlyphFormAttributeName:0]
//        let attributeDict5 = [NSFontAttributeName:UIFont.systemFontOfSize(22),NSForegroundColorAttributeName:UIColor.blackColor(),NSStrokeWidthAttributeName:3,NSStrokeColorAttributeName:UIColor.blackColor(),NSShadowAttributeName:shadow,NSVerticalGlyphFormAttributeName:0]
        let attributedStr = NSMutableAttributedString(string: "RomeoTeam")
        attributedStr.addAttributes(attributeDict1, range: NSRange(location: 0, length: attributedStr.length))
//        attributedStr.addAttributes(attributeDict2, range: NSRange(location: 2, length: 1))
//        attributedStr.addAttributes(attributeDict3, range: NSRange(location: 4, length: 1))
//        attributedStr.addAttributes(attributeDict4, range: NSRange(location: 6, length: 1))
//        attributedStr.addAttributes(attributeDict5, range: NSRange(location: 8, length: 1))
        textLabel.attributedText = attributedStr
        textLabel.textAlignment = .Center
        return textLabel
    }()
}
