//
//  CouponDetailViewController.swift
//  notteApp
//
//  Created by Yohei Fusayasu on 7/3/15.
//  Copyright (c) 2015 yohei2323. All rights reserved.
//

import UIKit
import Parse

class CouponDetailViewController: UIViewController {
    
    var param:AnyObject!
    var couponQuery: PFQuery = PFQuery(className: "Info")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
