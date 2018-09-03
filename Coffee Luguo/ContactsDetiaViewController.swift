//
//  ContactsDetiaViewController.swift
//  Coffee Luguo
//
//  Created by Laibit on 2015/9/19.
//  Copyright © 2015年 陳冠宇. All rights reserved.
//

import UIKit

class ContactsDetiaViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
