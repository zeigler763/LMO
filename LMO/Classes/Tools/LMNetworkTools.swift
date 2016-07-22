//
//  LMNetworkTools.swift
//  LMO
//
//  Created by 于世民 on 16/7/12.
//  Copyright © 2016年 zlycare. All rights reserved.
//

import UIKit
import Alamofire

enum LMRequestMethod: String {
    case GET = "GET"
    case POST = "POST"
    case DELETE = "DELETE"
    case PUT = "PUT"
}

class LMNetworkTools: NSObject {
   
    //请求地址
    let NetString = "http://192.168.1.16:9501"
    
    //定义回调的别名
    typealias LMRequestCallBack = (response: AnyObject?, error: NSError?)->()
    
    //定义单例
    static let sharedTools: LMNetworkTools = {
       let tools = LMNetworkTools()
        return tools
    }()
    
    //基类请求方法
    func request(method: LMRequestMethod = .GET, urlString: String, parameters: [String: AnyObject]?, finished: LMRequestCallBack) {
        //打印请求
        print(urlString)
        print(parameters)

        if method == .GET {
            Alamofire.request(.GET, urlString, parameters: parameters).responseJSON {response in
                finished(response: response.result.value, error: response.result.error)
            }
        }
        
        if method == .POST {
            Alamofire.request(.POST, urlString, parameters: parameters).responseJSON {response in
                finished(response: response.result.value, error: response.result.error)
            }
        }
        
        if method == .DELETE {
            Alamofire.request(.DELETE, urlString, parameters: parameters).responseJSON {response in
                finished(response: response.result.value, error: response.result.error)
            }
        }
        
        if method == .PUT {
            Alamofire.request(.PUT, urlString, parameters: parameters).responseJSON {response in
                finished(response: response.result.value, error: response.result.error)
            }
        }
        
    }
}

//MARK: - 登录注册逻辑
extension LMNetworkTools{
    
    //注册接口
    func userRegister(username:String, pwd:String, pwd2:String, finished:LMRequestCallBack) {
        
        let urlString = NetString + "/user/register"
        // 定义参数
        let params = [
            "username": username,
            "pwd": pwd,
            "pwd2": pwd2
        ]
        
        request(.POST, urlString: urlString, parameters: params, finished: finished)
    }
    
    //登录接口
    func userLogin(username:String, pwd:String, finished:LMRequestCallBack) {
        let urlString = NetString + "/user/login"
        // 定义参数
        let params = [
            "username": username,
            "pwd": pwd
        ]
        
        request(.POST, urlString: urlString, parameters: params, finished: finished)

    }
}
