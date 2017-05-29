//
//  IncomeCell.swift
//  MyBugdet
//
//  Created by Maahi on 15/01/17.
//  Copyright © 2017 Maahi. All rights reserved.
//

import UIKit

class IncomeCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblIncome: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
