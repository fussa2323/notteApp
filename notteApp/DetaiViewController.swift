//
//  DetaiViewController.swift
//  notteApp
//
//  Created by Yohei Fusayasu on 6/15/15.
//  Copyright (c) 2015 yohei2323. All rights reserved.
//

import UIKit

class DetaiViewController: UIViewController {

    //選択されたCellのおブジェクとを保持
    var param:AnyObject!
    @IBOutlet weak var detailTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.detailTextView.text = param.objectForKey("infoDetail") as? String
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
