//
//  VB_ModuleOne_Presen.swift
//  VIPER_BASE
//
//  Created by CSS on 02/10/18.
//  Copyright © 2018 CSS. All rights reserved.
//

import Foundation
import UIKit

class VB_ModuleOne_Presen: ViewToPresenterProtocol {
    var view: PresenterToViewProtocol?
    
    var interactor: PresenterToInteractorProtocol?
    
    var router: PresenterToRouterProtocol?
    
    func startFetchingData() {
        interactor?.fetchData(str_url: str_Api_Notice)
    }
    
    func showViewController(navigationController: UINavigationController) {
        
    }
    
    
}

extension VB_ModuleOne_Presen: InteractorToPresenterProtocol {
    func onSuccess_responseObject<T>(responseObj: Array<T>) {
        view?.passResponseObject(array_obj: responseObj)

    }
    
    func onFailed_responseObject() {
        view?.passErrorObect()
    }
    
    
    
}
