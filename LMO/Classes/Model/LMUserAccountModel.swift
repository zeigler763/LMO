//
//  LMUserAccountModel.swift
//  LMO
//
//  Created by 于世民 on 16/7/28.
//  Copyright © 2016年 zlycare. All rights reserved.
//

import UIKit

class LMUserAccountModel: NSObject {
    
    //单例
    static let sharedUserAccount = LMUserAccountModel()
    
    var userModel: LMUserModel?
    
    private override init() {
        super.init()
        userModel = loadUserModel()
    }
    
    var userLogin: Bool {
        return userModel != nil
    }
    
    func loadUserModel() -> LMUserModel? {
        //解档
        let result = LMUserModel.read(name: "User").1 as? LMUserModel
        return result
    }
}
