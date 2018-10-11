//
//  VB_ModuleOne_VC.swift
//  VIPER_BASE
//
//  Created by CSS on 02/10/18.
//  Copyright © 2018 CSS. All rights reserved.
//

import UIKit

class VB_ModuleOne_VC: UIViewController {

    
    @IBOutlet weak var table_moduleOne: UITableView!
    var ary_noticeList = [NotifyList]()
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
        return 139
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ary_noticeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table_moduleOne.dequeueReusableCell(withIdentifier: CellIdentifier.shared.VB_ModuleOne_Cell, for: indexPath) as! VB_ModuleOneCell

        
        let dicVal = ary_noticeList[indexPath.row]
        
        cell.lbl_t1.text = dicVal.id
        cell.lbl_t2.text = dicVal.title
        cell.lbl_t3.text = dicVal.brief
        cell.lbl_t4.text = dicVal.filesource
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showViewController(navigationController: navigationController!)
    }
}


extension VB_ModuleOne_VC: PresenterToViewProtocol{
    func passResponseObject<T>(array_obj: Array<T>) {
        for item in array_obj {
            ary_noticeList.append(NotifyList(dicVal: item as! Dictionary<String, Any>))
        }
        DispatchQueue.main.async {
            self.table_moduleOne.reloadData()
        }
    }
    
    func passErrorObect() {
        print("VB_ModuleOne_VC:- error")
    }
    
    
}


class VB_ModuleOneCell: UITableViewCell {
    
    @IBOutlet weak var lbl_t1: UILabel!
    @IBOutlet weak var lbl_t2: UILabel!
    @IBOutlet weak var lbl_t3: UILabel!
    @IBOutlet weak var lbl_t4: UILabel!
}
