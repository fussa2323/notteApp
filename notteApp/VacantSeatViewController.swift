//
//  VacantSeatViewController.swift
//  notteApp
//
//  Created by Yohei Fusayasu on 6/11/15.
//  Copyright (c) 2015 yohei2323. All rights reserved.
//

import UIKit
import Parse

class VacantSeatViewController: UIViewController {
    	
 
    //Seatsの情報をストア
    var allSeatsData: NSMutableArray = NSMutableArray()
    //Seatの空き情報のための変数
    var vacant:NSNumber = 1
    var guest:NSNumber = 0
    
    //Seatsテーブルのデータをすべて読み込む
    @IBAction func loadSeatsData(){
        //初期化
        allSeatsData.removeAllObjects()
        
        //タイムライン用のクエリを定義
        var findSeatsData: PFQuery = PFQuery(className: "Seats")
        
        //クエリで取得したデータに対しての処理
        findSeatsData.findObjectsInBackgroundWithBlock{
            (objects: [AnyObject]?, error: NSError?) -> Void in
            
            if error == nil {
                println("Successfully retrieved \(objects!.count) scores.")
                if let objects = objects as? [PFObject] {
                    for object in objects {
                        self.allSeatsData.addObject(object)
                    }
                }
            } else {
                println("Error: \(error!) \(error!.userInfo!)")
            }
            
            //描画する関数を呼び出し
            self.drawSeatsVacData()
        }
    }
    
    //Seatの空き情報を描画
    func drawSeatsVacData(){
        for SeatData in self.allSeatsData {
//            var seat_Id:Int = (SeatData.objectForKey("seat_Id") as? Int)!
//            switch seat_Id {
//            case 1:
//                if ((SeatData.objectForKey("vac") as? Int) == self.vacant){
//                    Seat1.text = "空"
//                    Seat1Button.titleLabel?.text = "空"
//                } else {
//                    Seat1.text = "客"
//                    Seat1Button.titleLabel?.text = "客"
//                }
//            case 2:
//                if ((SeatData.objectForKey("vac") as? Int) == self.vacant){
//                    Seat2.text = "空"
//                    Seat2Button.titleLabel?.text = "空"
//                } else {
//                    Seat2.text = "客"
//                    Seat2Button.titleLabel?.text = "客"
//                }
//            default:
//                break
//            }
        }
    }
    
    //DB上のseat_IdをもつSeatのVacデータを更新する
    func setSeatsVacData(selectSeat_Id: Int){
        for SeatData in self.allSeatsData {
            var seat_Id:Int = (SeatData.objectForKey("seat_Id") as? Int)!
            if seat_Id == selectSeat_Id {
                var seatDataObjectId: String = SeatData.objectId!!
                var seatsQuery:PFQuery =  PFQuery(className: "Seats")
                seatsQuery.getObjectInBackgroundWithId(seatDataObjectId) {
                    (targetSeat: PFObject?, error: NSError?) -> Void in
                    if error != nil {
                        println(error)
                    } else if let targetSeat = targetSeat {
                        var seatVac:Int = (targetSeat.objectForKey("vac") as? Int)!
                        if (seatVac == self.vacant){
                            targetSeat["vac"] = self.guest
                            targetSeat.saveInBackground()
                        }else{
                            targetSeat["vac"] = self.vacant
                            targetSeat.saveInBackground()
                        }
                    }
                }//Closer
            }//if
        }//for
    }
    
    
//    @IBAction func seat1ButtonAction(sender: AnyObject) {
//        self.setSeatsVacData(1)
//    }
//    @IBAction func seat2ButtonAction(sender: UIButton) {
//        self.setSeatsVacData(2)
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Title画像
        let image = UIImage(named: "navicon_white_seats.png")
        let imageView = UIImageView(image: image)
        imageView.frame = CGRectMake(0, 0, 36, 33)
        self.navigationItem.titleView = imageView
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.loadSeatsData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
