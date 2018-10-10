//
//  VB_ModuleOne_Protoc.swift
//  VIPER_BASE
//
//  Created by CSS on 02/10/18.
//  Copyright © 2018 CSS. All rights reserved.
//

import Foundation
import UIKit

protocol ViewToPresenterProtocol: class {
    
    var view: PresenterToViewProtocol? {get set}
    var interactor: PresenterToInteractorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    func startFetchingData()
    func showViewController(navigationController: UINavigationController)
    
    
}

protocol PresenterToViewProtocol: class {
    func passResponseObject<T>(array_obj: Array<T>)
    func passErrorObect()
}

protocol PresenterToRouterProtocol: class {
    static func createModule() -> UIViewController
    func pushToNewVC(navigationController: UINavigationController)
}


protocol PresenterToInteractorProtocol: class {
    var presenter: InteractorToPresenterProtocol? {get set}
    func fetchData(str_url: String)
    
}

protocol InteractorToPresenterProtocol: class {
    func onSuccess_responseObject<T>(responseObj: Array<T>)
    func onFailed_responseObject()
}
