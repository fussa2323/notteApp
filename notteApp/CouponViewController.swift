//
//  PointViewController.swift
//  notteApp
//
//  Created by Yohei Fusayasu on 6/11/15.
//  Copyright (c) 2015 yohei2323. All rights reserved.
//

import UIKit
import Parse

class CouponViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    //Coupon 用のデータ定義
    var allCouponData:NSMutableArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Title画像
        let image = UIImage(named: "navicon_white_coupon.png")
        let imageView = UIImageView(image: image)
        imageView.frame = CGRectMake(0, 0, 40, 33)
        self.navigationItem.titleView = imageView
        
        self.navigationController?.navigationBar.backgroundColor =  UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        //tableView Delegate
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(animated: Bool) {
        self.loadCouponData()
        super.viewDidAppear(animated)
    }
    
    //Informationテーブルのデータをすべて読み込む
    @IBAction func loadCouponData(){
        //初期化
        allCouponData.removeAllObjects()
        
        //タイムライン用のクエリを定義
        var findCouponData: PFQuery = PFQuery(className: "Coupon")
        
        //クエリで取得したデータに対しての処理
        findCouponData.findObjectsInBackgroundWithBlock{
            (objects: [AnyObject]?, error: NSError?) -> Void in
            
            if error == nil {
                println("Successfully retrieved \(objects!.count) scores.")
                if let objects = objects as? [PFObject] {
                    for object in objects {
                        self.allCouponData.addObject(object)
                    }
                }
            } else {
                println("Error: \(error!) \(error!.userInfo!)")
            }
            
            //NSArray型にいったん格納して順番をリバースさせる
            let array: NSArray = self.allCouponData.reverseObjectEnumerator().allObjects
            self.allCouponData = NSMutableArray(array: array)
            self.tableView.reloadData()
        }
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
        return self.allCouponData.count
    }
    
    /*
    Cellに値を設定する.
    */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell:CouponTableViewCell = (tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! CouponTableViewCell)
        let coupon:PFObject = (self.allCouponData.objectAtIndex(indexPath.row) as! PFObject)

        //alpha = 0
        
        //labelに値を格納
        cell.serviceLabel.text = coupon.objectForKey("product_name") as? String
        cell.priceLabel.text = coupon.objectForKey("price") as? String
        cell.dateLabel.text = coupon.objectForKey("limit") as? String
        cell.detailLabel.text = coupon.objectForKey("detail") as? String
        
        
        
        UIView.animateWithDuration(0.5, animations: {
            //alpha = 1
    
        })
        
        return cell
    }
    

    
}
