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
        let vc = mainStoryBoard.instantiateViewController(withIdentifier: SB_Identifier.shared.VB_ModuleOne_VC) as! VB_ModuleTwo_VC
        
        let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = VB_ModuleTwo_Presen()
        let interactor: PresenterToInteractorProtocol = VB_ModuleTwo_Interac()
        let router: PresenterToRouterProtocol = VB_ModuleTwo_Router()
        
        vc.presenter = presenter
        presenter.view = vc
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        return vc
    }
    
    func pushToNewVC(navigationController: UINavigationController) {
        
       // navigationController.present(vc, animated: true, completion: nil)
    }
    
    
    
}
