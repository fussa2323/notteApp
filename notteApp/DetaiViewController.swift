//
//  DetaiViewController.swift
//  notteApp
//
//  Created by Yohei Fusayasu on 6/15/15.
//  Copyright (c) 2015 yohei2323. All rights reserved.
//

import UIKit
import Parse

class DetaiViewController: UIViewController {

    //選択されたCellのobjectを保持
    var param:AnyObject!
    var infoQuery: PFQuery = PFQuery(className: "Info")
    @IBOutlet weak var detailTextView: UITextView!
    @IBOutlet weak var titleTextView: UITextView!
    @IBOutlet weak var createdAtLabel: UILabel!
    @IBOutlet weak var linkTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.detailTextView.text = param.objectForKey("infoDetail") as? String
        self.titleTextView.text = param.objectForKey("infoTitle") as? String
        self.linkTextView.text = param.objectForKey("infoLink") as? String
        //CreatedAtの表示
        var dateFormatter: NSDateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm"
        self.createdAtLabel.text = dateFormatter.stringFromDate(param.createdAt!!)
        self.linkTextView.dataDetectorTypes = UIDataDetectorTypes.Link
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func deleteButtonAction(sender: AnyObject) {
        var objId:String = param.objectId!!
        
        infoQuery.getObjectInBackgroundWithId(objId) {
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
