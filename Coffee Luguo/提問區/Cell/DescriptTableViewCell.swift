//
//  DescriptTableViewCell.swift
//  Coffee Luguo
//
//  Created by Laibit on 2018/9/7.
//  Copyright © 2018年 陳冠宇. All rights reserved.
//

import UIKit

class DescriptTableViewCell: UITableViewCell {

    @IBOutlet weak var descriptTitleLabel: UILabel!
    @IBOutlet weak var descriptDetailLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
