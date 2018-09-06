//
//  IntroViewController.swift
//  Coffee Luguo
//
//  Created by 陳冠宇 on 2015/9/19.
//  Copyright © 2015年 陳冠宇. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {

    @IBOutlet weak var introBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        introBtn.layer.cornerRadius = 8
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
