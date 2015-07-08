//
//  TopEditViewController.swift
//  notteApp
//
//  Created by Yohei Fusayasu on 6/15/15.
//  Copyright (c) 2015 yohei2323. All rights reserved.
//

import UIKit
import Parse

class TopEditViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var detailTextView: UITextView!
    @IBOutlet weak var linkTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Edit Information"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
  
    @IBAction func saveButtonAction(sender: AnyObject) {
        var info:PFObject = PFObject(className: "Info")
        info["infoTitle"] = titleTextField.text
        info["infoDetail"] = detailTextView.text
        info["infoLink"] = linkTextField.text

        info.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success) {
                self.navigationController?.popToRootViewControllerAnimated(true)
            } else {
                // There was a problem, check error.description
            }
        }
        
    }
}
