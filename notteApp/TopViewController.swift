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
    
    //Information 用のデータ定義
    var allInfoData:NSMutableArray = NSMutableArray()
    
    
    //Informationテーブルのデータをすべて読み込む
    @IBAction func loadInfoData(){
        //初期化
        allInfoData.removeAllObjects()
        
        //タイムライン用のクエリを定義
        var findInfoData: PFQuery = PFQuery(className: "Info")
        
        //クエリで取得したデータに対しての処理
        findInfoData.findObjectsInBackgroundWithBlock{
            (objects: [AnyObject]?, error: NSError?) -> Void in
            
            if error == nil {
                println("Successfully retrieved \(objects!.count) scores.")
                if let objects = objects as? [PFObject] {
                    for object in objects {
                        self.allInfoData.addObject(object)
                    }
                }
            } else {
                println("Error: \(error!) \(error!.userInfo!)")
            }
            
            //NSArray型にいったん格納して順番をリバースさせる
            let array: NSArray = self.allInfoData.reverseObjectEnumerator().allObjects
            self.allInfoData = NSMutableArray(array: array)
            self.tableView.reloadData()       }
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
        //tableView Delegate
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    Cellが選択された際に呼び出される.
    */
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    /*
    Cellの総数を返す.
    */
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allInfoData.count
    }
    
    /*
    Cellに値を設定する.
    */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell:InfoTableViewCell = (tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! InfoTableViewCell)
        let info:PFObject = (self.allInfoData.objectAtIndex(indexPath.row) as! PFObject)
       
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
    
    


}
