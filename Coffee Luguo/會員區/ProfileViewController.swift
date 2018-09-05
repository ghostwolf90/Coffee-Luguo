//
//  ProfileViewController.swift
//  Coffee Luguo
//
//  Created by Laibit on 2015/9/19.
//  Copyright © 2015年 陳冠宇. All rights reserved.
//

import UIKit
import FacebookLogin
import FacebookCore

class ProfileViewController: UIViewController {
    
    var titleNames = ["頭像","我的資料", "我的咖啡卡", "我的咖啡紀錄", "登出"]
    var user = RLM_User()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        user = RLM_UserUtil.sharedInstance.getUser()
    }
    
    func logOut(){
        let alertController = UIAlertController(title: "系统提示", message: "您確定要登出吗？", preferredStyle: UIAlertControllerStyle.alert)
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

extension ProfileViewController{
    
    //個人資料
    func showProfile(){
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

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleNames.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 200
        }
        return 64
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0 :
            let imageCell = tableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath as IndexPath) as! imageTableViewCell
            do {
                let imageData = try Data(contentsOf: URL(string: user.picture)!)
                imageCell.profileImage.image = UIImage(data: imageData)
                imageCell.profileImage.clipsToBounds = true
                imageCell.profileImage.layer.cornerRadius = 30
            } catch {
                print("Unable to load data: \(error)")
            }                                    
            return imageCell
        default :
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath) as! cellTableViewCell
            cell.firstLabel.text = titleNames[indexPath.row]
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 1 :
            showProfile()
        case 2 :
            showCoffeeCard()
        case 3 :
            showMyCoffee()
        case 4:
            logOut()
        default:
            print("")
        }
    }
    
}
