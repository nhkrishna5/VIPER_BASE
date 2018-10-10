//
//  VB_ModuleOne_Interac.swift
//  VIPER_BASE
//
//  Created by CSS on 02/10/18.
//  Copyright © 2018 CSS. All rights reserved.
//

import UIKit
import Foundation

class VB_ModuleTwo_Interac: PresenterToInteractorProtocol {
    var presenter: InteractorToPresenterProtocol?
    let webservice = VB_WebService_Get()
    
    func fetchData(str_url: String) {
        
        webservice.delegate = self
        webservice.webService_Get(str_url: str_url)
        
        /*let url_str = URL(string: str_Api_Notice)
        let task = URLSession.shared.dataTask(with: url_str!) { (data, response, error) in
            guard error == nil else{
                print("error:- \(error.debugDescription)")
                self.presenter?.onFailed_responseObject()
                return
            }
            
            guard let content = data else{
                print("empty data")
                return
            }
            
            guard let json = (try? JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers)) as? Dictionary<String, Any> else{
                print("serialization Error")
                return
            }
            
            let resp_obj = json[Keys_Str.shared.notice_list] as? [Dictionary<String, Any>]
            self.presenter?.onSuccess_responseObject(responseObj: resp_obj!)
            
            
        }
        task.resume()*/
        
    }
    

}

extension VB_ModuleTwo_Interac: WebServiceGetDelegate{
    func responseObject_Get(responseObj: Dictionary<String, Any>) {
        let resp_obj = responseObj[Keys_Str.shared.notice_list] as? [Dictionary<String, Any>]
        presenter?.onSuccess_responseObject(responseObj: resp_obj!)
    }
    
    func error_responseObj_Get(errorRes: String) {
        presenter?.onFailed_responseObject()
    }
    
    
}
