//
//  ContactsTableViewController.swift
//  Coffee Luguo
//
//  Created by Laibit on 2015/9/19.
//  Copyright © 2015年 陳冠宇. All rights reserved.
//

import UIKit

class ContactsTableViewController: UITableViewController {
    
    var titleName = ["會員基本資料", "我的爐鍋卡", "我的爐鍋咖啡"]

    @IBOutlet weak var helloWorldLabel: UILabel!
    
    @IBAction func outButton(sender: AnyObject) {
        
        let alertController = UIAlertController(title: "系统提示",
                                                message: "您確定要登出吗？", preferredStyle: UIAlertControllerStyle.alert)
        let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.cancel, handler: nil)
        let okAction = UIAlertAction(title: "確定", style: UIAlertActionStyle.default,
            handler: {
                action in
                print("點擊了确定")
        })
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
         //self.helloWorldLabel.text = "Hello, 賴先生"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }

    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0 :
            print("row1")
            let imageCell = tableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath as IndexPath) as! imageTableViewCell
            imageCell.imageView?.image = UIImage(named:"coffeeL.jpg")
            return imageCell            
        case 1 :
            print("row 2")
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath as IndexPath) as! cellTableViewCell
            cell.firstLabel.text = titleName[0]
            return cell
            
        case 2 :
            print("row 3")
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath as IndexPath) as! cellTableViewCell
            cell.firstLabel.text = titleName[1]
            return cell
        case 3 :
            print("row 4")
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath as IndexPath) as! cellTableViewCell
            cell.firstLabel.text = titleName[2]
            return cell
        default :
            print("no row")
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath as IndexPath) as! cellTableViewCell
            cell.firstLabel.text = titleName[1]
            return cell
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 350
        }
        //return UITableViewAutomaticDimension
        return 80
    }

    func showCoffeeCard(){
        let coffee_vc = self.storyboard?.instantiateViewController(withIdentifier: "showCoffeeCard") as! coffeeCardViewController
        self.show(coffee_vc, sender: self)
    }
    
    func showContacts(){
        let contacts_vc = self.storyboard?.instantiateViewController(withIdentifier: "showContacts") as! ContactsDetiaViewController
        self.show(contacts_vc, sender: self)
    }
    
    func showMyCoffee(){
        let myCoffee_vc = self.storyboard?.instantiateViewController(withIdentifier: "myCoffee") as! MyCoffeeViewController
        self.show(myCoffee_vc, sender: self)
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 0 :
            print("0")
        case 1 :
            print("1")
            showContacts()
        case 2 :
            print("2")
            showCoffeeCard()
        case 3 :
            print("3")
            showMyCoffee()
        default:
            print("")
        }
    }

}
