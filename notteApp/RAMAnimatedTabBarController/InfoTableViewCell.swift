//
//  InfoTableViewCell.swift
//  notteApp
//
//  Created by Yohei Fusayasu on 6/15/15.
//  Copyright (c) 2015 yohei2323. All rights reserved.
//

import UIKit

class InfoTableViewCell: UITableViewCell {

    
    @IBOutlet weak var infoCreatedAtLabel: UILabel!
    @IBOutlet weak var infoTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
