//
//  TaccuìnCell.swift
//  PadovaNews
//
//  Created by Romesh Singhabahu on 15/01/15.
//  Copyright (c) 2015 Romesh Singhabahu. All rights reserved.
//

import UIKit

class Taccui_nCell: UITableViewCell {

    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
