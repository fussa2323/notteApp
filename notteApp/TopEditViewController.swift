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
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Edit Information"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    @IBAction func saveButtonAction(sender: AnyObject) {
        var info:PFObject = PFObject(className: "Info")
        info["infoTitle"] = titleTextField.text
        info["infoDetail"] = detailTextView.text
        
        info.saveInBackground()
        
        self.navigationController?.popToRootViewControllerAnimated(true);        return
    }
}
