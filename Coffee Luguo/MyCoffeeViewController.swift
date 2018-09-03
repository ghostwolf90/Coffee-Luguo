//
//  MyCoffeeViewController.swift
//  Coffee Luguo
//
//  Created by Laibit on 2015/9/19.
//  Copyright © 2015年 陳冠宇. All rights reserved.
//

import UIKit

class MyCoffeeViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    var coffeeId = [ "極品藍山", "山多士", "哥倫比亞", "摩卡"]
    var coffeeIn = ["在海拔2256公尺\n的藍山而聞名，栽種在80-1500 公尺之斜坡，\n級數分為No1.、No2.、No3",
                    "品質優良，被認為是混合時不可缺之豆。品質類型分為No1.、No2，Screen18-19最受好評，適用最為廣泛",
                    "世界第二大生產國。咖啡豆為淡綠色，大顆粒，具厚重味，無論是單飲或混合都非常適宜",
                    "為咖啡之原產地，顆粒較小，採乾燥式，呈青綠色，具特殊香味及酸味。衣索匹亞是以缺點豆混入率來分級No1.-No8"]
    
    var coffeeImage = ["coffeeG.jpg","coffeeR.jpg","coffeeB.jpg","coffeeY.jpg"]
    var prototypeCell: MyCoffeeTableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coffeeId.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: IndexPath) -> CGFloat {
     
        return 110
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCoffeeCell", for: indexPath as IndexPath) as! MyCoffeeTableViewCell
        
        cell.coffeeIdLabel.text = coffeeId[indexPath.row]
        cell.introductionLabel.text = coffeeIn[indexPath.row]
        cell.coffeeImageView.image = UIImage(named: coffeeImage[indexPath.row])
        
        cell.coffeeImageView.layer.cornerRadius = cell.coffeeImageView.frame.size.width/2
        cell.coffeeImageView.clipsToBounds = true
    
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
