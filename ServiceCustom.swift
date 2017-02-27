//
//  ServiceCustom.swift
//  SellsSwipe
//
//  Created by MAC-4 on 2/21/17.
//  Copyright © 2017 Mitesh. All rights reserved.
//

import UIKit
class ServiceCustom: NSObject
{
    static let sharedMyManager : ServiceCustom = {
        let instance = ServiceCustom()
        return instance
    }()
    
    //MARK: Local Variable
    var manager = AFHTTPSessionManager()
    
   

   
    
    //MARK: Init
    
    convenience override init()
    {
        self.init(array : [])
    }
    
    //MARK: Init Array
    
    init( array : [String]) {
        manager = AFHTTPSessionManager()
       // manager.requestSerializer.setValue(strGlobalLoginAccessToken, forHTTPHeaderField: "Authorization")
       // emptyStringArray = array
    }
    
    func setAuthorization()
    {
        if userdefault.object(forKey: eUserDefaultsKey.token.rawValue) == nil
        {
            strGlobalLoginAccessToken = ""
        }
        else
        {
            strGlobalLoginAccessToken = "\(userdefault.object(forKey: eUserDefaultsKey.token.rawValue)!)"
        }
         manager.requestSerializer.setValue(strGlobalLoginAccessToken, forHTTPHeaderField: "Authorization")
    }
    
    func removeAuthorization()
    {
        manager.requestSerializer.setValue("", forHTTPHeaderField: "Authorization")
    }
    
    func postAtURL(strURL:String, parameter: NSDictionary, sucess:@escaping (_ requestOperation:URLSessionDataTask, _ responseobject:Any) -> Void, failure:@escaping (_ requestOperation:URLSessionDataTask, _ error:Error) -> Void)
    {
        manager.post(strURL, parameters: parameter, progress: nil, success: { (requestOperation, response) in
            sucess(requestOperation,response)
        }) { (requestOperation, error) in
            failure(requestOperation!,error)
        }
    }
}
