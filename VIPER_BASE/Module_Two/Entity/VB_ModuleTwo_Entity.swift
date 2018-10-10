//
//  VB_ModuleOne_Entity.swift
//  VIPER_BASE
//
//  Created by CSS on 02/10/18.
//  Copyright © 2018 CSS. All rights reserved.
//

import Foundation
import UIKit

class MovieList {
    var id = ""
    var title = ""
    var brief = ""
    var filesource = ""

    init(dicVal: Dictionary<String, Any>) {
        self.id = dicVal[Keys_Str.shared.id] as! String
        self.title = dicVal[Keys_Str.shared.title] as! String
        self.brief = dicVal[Keys_Str.shared.brief] as! String
        self.filesource = dicVal[Keys_Str.shared.filesource] as! String
    }
    
}
