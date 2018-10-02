//
//  VB_WebService_GET.swift
//  VIPER_BASE
//
//  Created by CSS on 02/10/18.
//  Copyright © 2018 CSS. All rights reserved.
//

import Foundation
import UIKit

protocol WebServiceGetDelegate: class {
    func responseObject_Get(responseObj: Dictionary<String, Any>)
    func error_responseObj_Get(errorRes: String)
    
}

class VB_WebService_Get {
    
    var delegate: WebServiceGetDelegate?
    
    func webService_Get(str_url: String) {
        
        let url_str = URL(string: str_url) //str_Api_Notice
        let task = URLSession.shared.dataTask(with: url_str!) { (data, response, error) in
            guard error == nil else{
                print("error:- \(error.debugDescription)")

                return
            }
            
            guard let content = data else{
                print("empty data")
                return
            }
            
            guard let json = (try? JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers)) as? Dictionary<String, Any> else{
                print("serialization Error")
                self.delegate?.error_responseObj_Get(errorRes: "Json Serialization")
                return
            }
            
            
            self.delegate?.responseObject_Get(responseObj: json)
            //let resp_obj = json[Keys_Str.shared.notice_list] as? [Dictionary<String, Any>]
            //self.presenter?.onSuccess_responseObject(responseObj: resp_obj!)
            
            
        }
        task.resume()
        
        
        
    }
    
}
