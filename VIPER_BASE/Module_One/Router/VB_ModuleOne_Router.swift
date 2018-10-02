//
//  VB_ModuleOne_Router.swift
//  VIPER_BASE
//
//  Created by CSS on 02/10/18.
//  Copyright © 2018 CSS. All rights reserved.
//

import Foundation
import UIKit

class VB_ModuleOne_Router: PresenterToRouterProtocol {
    
    static var mainStoryBoard: UIStoryboard{
        return UIStoryboard(name: "Main", bundle: .main)
    }
    
    static func createModule() -> UIViewController {
        let vc = mainStoryBoard.instantiateViewController(withIdentifier: SB_Identifier.shared.VB_ModuleOne_VC) as! VB_ModuleOne_VC
        
        let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = VB_ModuleOne_Presen()
        let interactor: PresenterToInteractorProtocol = VB_ModuleOne_Interac()
        let router: PresenterToRouterProtocol = VB_ModuleOne_Router()
        
        vc.presenter = presenter
        presenter.view = vc
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        return vc
    }
    
    func pushToNewVC(navigationController: UINavigationController) {
        
    }
    
    
    
}
