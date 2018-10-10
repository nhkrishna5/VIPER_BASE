//
//  Constant.swift
//  VIPER_BASE
//
//  Created by CSS on 02/10/18.
//  Copyright © 2018 CSS. All rights reserved.
//

import Foundation

let str_Api_Notice = "https://api.myjson.com/bins/1bsqcn/"
let str_Api_Movie = "https://api.myjson.com/bins/1h87n6"



struct Keys_Str {
    static let shared = Keys_Str()
    
    var notice_list = "notice_list"
    
    var id = "id"
    var title = "title"
    var brief = "brief"
    var filesource = "filesource"
}

struct CellIdentifier {
    static let shared = CellIdentifier()
    let VB_ModuleOne_Cell = "VB_ModuleOne_Cell"
    let VB_ModuleTwo_Cell = "VB_ModuleTwo_Cell"

}

struct SB_Identifier {
    static let shared = SB_Identifier()
    let VB_ModuleOne_VC = "VB_ModuleOne_VC"
    let VB_ModuleTwo_VC = "VB_ModuleTwo_VC"

}
