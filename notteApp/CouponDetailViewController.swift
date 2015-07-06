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
    var couponQuery: PFQuery = PFQuery(className: "Coupon")
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameLabel.text = param.objectForKey("product_name") as? String
        self.priceLabel.text = param.objectForKey("price") as? String
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func deleteButtonAction(sender: AnyObject) {
        var objId:String = param.objectId!!
        
        couponQuery.getObjectInBackgroundWithId(objId) {
            (targetInfo: PFObject?, error: NSError?) -> Void in
            if error == nil && targetInfo != nil {
                targetInfo?.deleteInBackground()
                self.navigationController?.popToRootViewControllerAnimated(true)
            } else {
                println(error)
            }
        }
    }

}
