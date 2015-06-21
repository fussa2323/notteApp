//
//  CouponTableViewCell.swift
//  notteApp
//
//  Created by Yohei Fusayasu on 6/18/15.
//  Copyright (c) 2015 yohei2323. All rights reserved.
//

import UIKit

class CouponTableViewCell: UITableViewCell {

    
    @IBOutlet weak var limitDateLavel: UILabel!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var detailTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
