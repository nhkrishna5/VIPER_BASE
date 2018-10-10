//
//  VB_ModuleOne_VC.swift
//  VIPER_BASE
//
//  Created by CSS on 02/10/18.
//  Copyright © 2018 CSS. All rights reserved.
//

import UIKit

class VB_ModuleOne_VC: UIViewController {

    
    @IBOutlet weak var table_moduleTwo: UITableView!
    var ary_movieList = [MovieList]()
    var presenter: ViewToPresenterProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        presenter?.startFetchingData()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension VB_ModuleOne_VC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ary_movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table_moduleTwo.dequeueReusableCell(withIdentifier: CellIdentifier.shared.VB_ModuleTwo_Cell, for: indexPath) as! VB_ModuleTwoCell
        let dicVal = ary_movieList[indexPath.row]
        
        cell.lbl_t1.text = dicVal.id
        cell.lbl_t2.text = dicVal.title
        cell.lbl_t3.text = dicVal.brief
        
        
        return cell
        
    }
}


extension VB_ModuleTwo_VC: PresenterToViewProtocol{
    func passResponseObject<T>(array_obj: Array<T>) {
        for item in array_obj {
            ary_movieList.append(MovieList(dicVal: item as! Dictionary<String, Any>))
        }
        DispatchQueue.main.async {
            self.table_moduleTwo.reloadData()
        }
    }
    
    func passErrorObect() {
        print("VB_ModuleTwo_VC:- error")
    }
    
    
}


class VB_ModuleTwoCell: UITableViewCell {
    
    @IBOutlet weak var lbl_t1: UILabel!
    @IBOutlet weak var lbl_t2: UILabel!
    @IBOutlet weak var lbl_t3: UILabel!
}
