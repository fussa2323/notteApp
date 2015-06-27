//
//  CouponEditViewController.swift
//  notteApp
//
//  Created by Yohei Fusayasu on 6/26/15.
//  Copyright (c) 2015 yohei2323. All rights reserved.
//

import UIKit
import Parse

class CouponEditViewController: UIViewController {

    @IBOutlet weak var limitTextField: UITextField!
    @IBOutlet weak var productNameTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var detailTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Edit Coupont"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButtonAction(sender: AnyObject) {
        var coupon:PFObject = PFObject(className: "Coupon")
        coupon["limit"] = limitTextField.text
        coupon["product_name"] = productNameTextField.text
        coupon["price"] = priceTextField.text
        coupon["detail"] = detailTextView.text
        
        coupon.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success) {
                self.navigationController?.popToRootViewControllerAnimated(true)
            } else {
                // There was a problem, check error.description
            }
        }
        
    }

}
