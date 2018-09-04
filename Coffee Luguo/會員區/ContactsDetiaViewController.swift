//
//  ContactsDetiaViewController.swift
//  Coffee Luguo
//
//  Created by Laibit on 2015/9/19.
//  Copyright © 2015年 陳冠宇. All rights reserved.
//

import UIKit

class ContactsDetiaViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ContactsDetiaViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ContactsDetialTableViewCell        
        switch indexPath.row{
        case 0:
            cell.fieldLabel.text  = "姓名:"
            cell.valueLabel.text  = ""
        case 1:
            cell.fieldLabel.text  = "電話:"
            cell.valueLabel.text  = ""
        case 2:
            cell.fieldLabel.text  = "email:"
            cell.valueLabel.text  = ""
        case 3:
            cell.fieldLabel.text  = "地址:"
            cell.valueLabel.text  = ""
        default:
            cell.fieldLabel.text  = ""
            cell.valueLabel.text  = ""
        }
        return cell
    }
    
}
