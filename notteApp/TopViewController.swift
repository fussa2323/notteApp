//
//  TopViewController.swift
//  notteApp
//
//  Created by Yohei Fusayasu on 6/11/15.
//  Copyright (c) 2015 yohei2323. All rights reserved.
//

import UIKit
import Parse

class TopViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var accessMapButton: UIButton!
    
    //Information 用のデータ定義
    var allInfoData:NSMutableArray = NSMutableArray()
    
    //Informationテーブルのデータをすべて読み込む
    @IBAction func loadInfoData(){
        //初期化
        allInfoData.removeAllObjects()
        
        //タイムライン用のクエリを定義
        var findInfoData: PFQuery = PFQuery(className: "Info")
        
        //クエリで取得したデータに対しての処理
        SVProgressHUD.show()
        findInfoData.findObjectsInBackgroundWithBlock{
            (objects: [AnyObject]?, error: NSError?) -> Void in
            if error == nil {
                println("Successfully retrieved \(objects!.count) scores.")
                if let objects = objects as? [PFObject] {
                    for object in objects {
                        self.allInfoData.addObject(object)
                    }
                }
                SVProgressHUD.dismiss()
            } else {
                println("Error: \(error!) \(error!.userInfo!)")
            }
            
            //NSArray型にいったん格納して順番をリバースさせる
            let array: NSArray = self.allInfoData.reverseObjectEnumerator().allObjects
            self.allInfoData = NSMutableArray(array: array)
            self.tableView.reloadData()
        }
        
    }

    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.loadInfoData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //navbar tabbar Design
        self.navigationController?.navigationBar.backgroundColor =  UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        self.tabBarController?.tabBar.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        //Title画像
        let image = UIImage(named: "navicon_top.png")
        let imageView = UIImageView(image: image)
        imageView.frame = CGRectMake(0, 0, 36, 33)
        self.navigationItem.titleView = imageView
        //tableView Delegate
        self.tableView.delegate = self
        self.tableView.dataSource = self
        //AccessMapButton
        self.accessMapButton.layer.borderWidth = 0.311
        self.accessMapButton.layer.borderColor = UIColor.whiteColor().CGColor
        self.accessMapButton.layer.cornerRadius = 3.0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allInfoData.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell:InfoTableViewCell = (tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! InfoTableViewCell)
        let info:PFObject = (self.allInfoData.objectAtIndex(indexPath.row) as! PFObject)
       
        //cellの右側に>を表示
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        //alpha = 0
        cell.infoCreatedAtLabel.alpha = 0
        cell.infoTitleLabel.alpha = 0
        
        //textViewにinfoTitleを表示
        cell.infoTitleLabel.text = info.objectForKey("infoTitle") as? String
        
        //CreatedAtの表示
        var infoFormatter: NSDateFormatter = NSDateFormatter()
        infoFormatter.dateFormat = "yyyy/MM/dd HH:mm"
        cell.infoCreatedAtLabel.text = infoFormatter.stringFromDate(info.createdAt!)
        
        UIView.animateWithDuration(0.5, animations: {
            //alpha = 1
            cell.infoCreatedAtLabel.alpha = 1
            cell.infoTitleLabel.alpha = 1
        })
        
        return cell
    }
    
    //選択したCellをdetailViewControllerにデータを渡す
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "detailPath") {
            let detailViewContoroller: DetaiViewController = segue.destinationViewController as! DetaiViewController
            var ip: NSIndexPath! = self.tableView.indexPathForSelectedRow()
            detailViewContoroller.param = self.allInfoData.objectAtIndex(ip.row)
        }else{
            println("nothing to do")
        }
    }
    
    
    //SVProgressHUD method
    func dispatch_async_main(block: () -> ()) {
        dispatch_async(dispatch_get_main_queue(), block)
    }
    
    func dispatch_async_global(block: () -> ()) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
    }

    


}
