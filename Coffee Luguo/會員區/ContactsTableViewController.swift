//
//  ContactsTableViewController.swift
//  Coffee Luguo
//
//  Created by Laibit on 2015/9/19.
//  Copyright © 2015年 陳冠宇. All rights reserved.
//

import UIKit

class ContactsTableViewController: UIViewController {
    
    var titleName = ["我的資料", "我的咖啡卡", "我的咖啡紀錄"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func logOutButton(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "系统提示",
                                                message: "您確定要登出吗？", preferredStyle: UIAlertControllerStyle.alert)
        let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.cancel, handler: nil)
        let okAction = UIAlertAction(title: "確定", style: UIAlertActionStyle.default, handler: { action in
            RLM_UserUtil.sharedInstance.deleteUser()
            Helper.backToLogin()
            //TODO: 增加FB登出
        })
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ContactsTableViewController{
    
    //個人資料
    func showContacts(){
        let contacts_vc = self.storyboard?.instantiateViewController(withIdentifier: "ContactsDetiaViewController") as! ContactsDetiaViewController
        self.show(contacts_vc, sender: self)
    }
    
    //咖啡卡
    func showCoffeeCard(){
        let coffee_vc = self.storyboard?.instantiateViewController(withIdentifier: "CoffeeCardViewController") as! CoffeeCardViewController
        self.show(coffee_vc, sender: self)
    }
    
    //喝的咖啡紀錄
    func showMyCoffee(){
        let myCoffee_vc = self.storyboard?.instantiateViewController(withIdentifier: "MyCoffeeViewController") as! MyCoffeeViewController
        self.show(myCoffee_vc, sender: self)
    }
    
}

extension ContactsTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 350
        }
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0 :
            let imageCell = tableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath as IndexPath) as! imageTableViewCell
            imageCell.imageView?.image = UIImage(named:"coffeeL.jpg")
            return imageCell
        default :
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath) as! cellTableViewCell
            cell.firstLabel.text = titleName[indexPath.row - 1]
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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
