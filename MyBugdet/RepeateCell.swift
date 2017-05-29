//
//  RepeateCell.swift
//  MyBugdet
//
//  Created by Maahi on 14/01/17.
//  Copyright © 2017 Maahi. All rights reserved.
//

import UIKit

class RepeateCell: UITableViewCell {

    
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDivider: UILabel!
    @IBOutlet weak var lblDetails: UILabel!
    @IBOutlet weak var `switch`: UISwitch!
    
    @IBOutlet weak var txtInput: UITextField!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
