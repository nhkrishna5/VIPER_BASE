//
//  VB_ModuleOne_Presen.swift
//  VIPER_BASE
//
//  Created by CSS on 02/10/18.
//  Copyright © 2018 CSS. All rights reserved.
//

import Foundation
import UIKit

class VB_ModuleTwo_Presen: ViewToPresenterProtocol_two {
    var view: PresenterToViewProtocol_two?
    
    var interactor: PresenterToInteractorProtocol_two?
    
    var router: PresenterToRouterProtocol_two?
    
    func startFetchingData() {
        interactor?.fetchData(str_url: str_Api_Movie)
    }
    
    func showViewController(navigationController: UINavigationController) {
        router?.pushToNewVC(navigationController: navigationController)
    }
    
    
}

extension VB_ModuleTwo_Presen: InteractorToPresenterProtocol_two {
    func onSuccess_responseObject<T>(responseObj: Array<T>) {
        view?.passResponseObject(array_obj: responseObj)

    }
    
    func onFailed_responseObject() {
        view?.passErrorObect()
    }
    
    
    
}
