//
//  VB_ModuleOne_Protoc.swift
//  VIPER_BASE
//
//  Created by CSS on 02/10/18.
//  Copyright © 2018 CSS. All rights reserved.
//

import Foundation
import UIKit

protocol ViewToPresenterProtocol_two: class {
    
    var view: PresenterToViewProtocol_two? {get set}
    var interactor: PresenterToInteractorProtocol_two? {get set}
    var router: PresenterToRouterProtocol_two? {get set}
    func startFetchingData()
    func showViewController(navigationController: UINavigationController)
    
    
}

protocol PresenterToViewProtocol_two: class {
    func passResponseObject<T>(array_obj: Array<T>)
    func passErrorObect()
}

protocol PresenterToRouterProtocol_two: class {
    static func createModule() -> UIViewController
    func pushToNewVC(navigationController: UINavigationController)
}


protocol PresenterToInteractorProtocol_two: class {
    var presenter: InteractorToPresenterProtocol_two? {get set}
    func fetchData(str_url: String)
    
}

protocol InteractorToPresenterProtocol_two: class {
    func onSuccess_responseObject<T>(responseObj: Array<T>)
    func onFailed_responseObject()
}
