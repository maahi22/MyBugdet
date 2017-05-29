//
//  RepeteIncomeCell.swift
//  MyBugdet
//
//  Created by Maahi on 15/01/17.
//  Copyright © 2017 Maahi. All rights reserved.
//

import UIKit

class RepeteIncomeCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var repeateSwitch: UISwitch!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
