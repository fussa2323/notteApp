//
//  SeatsEditViewController.swift
//  notteApp
//
//  Created by Yohei Fusayasu on 6/15/15.
//  Copyright (c) 2015 yohei2323. All rights reserved.
//

import UIKit
import Parse

class SeatsEditViewController: UIViewController {

    @IBOutlet weak var seat1: UIImageView!
    @IBOutlet weak var seat2: UIImageView!
    @IBOutlet weak var seat3: UIImageView!
    @IBOutlet weak var seat4: UIImageView!
    @IBOutlet weak var seat5: UIImageView!
    @IBOutlet weak var seat6: UIImageView!
    @IBOutlet weak var seat7: UIImageView!
    @IBOutlet weak var seat8: UIImageView!
    @IBOutlet weak var seat9: UIImageView!
    @IBOutlet weak var seat10: UIImageView!
    @IBOutlet weak var seat11: UIImageView!
    @IBOutlet weak var seat12: UIImageView!
    @IBOutlet weak var seat13: UIImageView!
    @IBOutlet weak var seat14: UIImageView!
    
    //Seatsの情報をストア
    var allSeatsData: NSMutableArray = NSMutableArray()
    //seatの空き情報のための変数
    var vacant:NSNumber = 1
    var guest:NSNumber = 0
    //seat用のimage
    var tableVacantImage: UIImage = UIImage(named: "seats_table_vacant.png")!
    var tableGuestImage: UIImage = UIImage(named: "seats_table_guest.png")!
    var counterVacantImage: UIImage = UIImage(named: "seats_counter_vacant.png")!
    var counterGuestImage: UIImage = UIImage(named: "seats_counter_guest.png")!
    var sofaVacantImage: UIImage = UIImage(named: "seats_sofa_vacant.png")!
    var sofaGuestImage: UIImage = UIImage(named: "seats_sofa_guest.png")!
    
    //Statusの情報をストア
    var statusData: NSMutableArray = NSMutableArray()
    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Edit SeatsInfo"
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.loadSeatsData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Seatsテーブルのデータをすべて読み込む
    @IBAction func loadSeatsData(){
        //初期化
        allSeatsData.removeAllObjects()
        statusData.removeAllObjects()
        
        //クエリを定義
        var findSeatsData: PFQuery = PFQuery(className: "Seats")
        var findStatusData: PFQuery = PFQuery(className: "Status")
        
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
        
        //クエリで取得したデータに対しての処理
        findStatusData.findObjectsInBackgroundWithBlock{
            (objects: [AnyObject]?, error: NSError?) -> Void in
            
            if error == nil {
                println("Successfully retrieved \(objects!.count) scores.")
                if let objects = objects as? [PFObject] {
                    for object in objects {
                        self.statusData.addObject(object)
                    }
                }
            } else {
                println("Error: \(error!) \(error!.userInfo!)")
            }
            //描画する関数を呼び出し
            self.drawStatusData()
        }
    }
    
    //Seatの空き情報を描画
    func drawSeatsVacData(){
        for SeatData in self.allSeatsData {
            var seat_Id:Int = (SeatData.objectForKey("seat_Id") as? Int)!
            switch seat_Id {
            case 1:
                if ((SeatData.objectForKey("vac") as? Int) == self.vacant){
                    seat1.image = tableVacantImage
                } else {
                    seat1.image = tableGuestImage
                }
            case 2:
                if ((SeatData.objectForKey("vac") as? Int) == self.vacant){
                    seat2.image = counterVacantImage
                } else {
                    seat2.image = counterGuestImage
                }
            case 3:
                if ((SeatData.objectForKey("vac") as? Int) == self.vacant){
                    seat3.image = counterVacantImage
                } else {
                    seat3.image = counterGuestImage
                }
            case 4:
                if ((SeatData.objectForKey("vac") as? Int) == self.vacant){
                    seat4.image = counterVacantImage
                } else {
                    seat4.image = counterGuestImage
                }
            case 5:
                if ((SeatData.objectForKey("vac") as? Int) == self.vacant){
                    seat5.image = counterVacantImage
                } else {
                    seat5.image = counterGuestImage
                }
            case 6:
                if ((SeatData.objectForKey("vac") as? Int) == self.vacant){
                    seat6.image = tableVacantImage
                } else {
                    seat6.image = tableGuestImage
                }
            case 7:
                if ((SeatData.objectForKey("vac") as? Int) == self.vacant){
                    seat7.image = tableVacantImage
                } else {
                    seat7.image = tableGuestImage
                }
            case 8:
                if ((SeatData.objectForKey("vac") as? Int) == self.vacant){
                    seat8.image = tableVacantImage
                } else {
                    seat8.image = tableGuestImage
                }
            case 9:
                if ((SeatData.objectForKey("vac") as? Int) == self.vacant){
                    seat9.image = tableVacantImage
                } else {
                    seat9.image = tableGuestImage
                }
            case 10:
                if ((SeatData.objectForKey("vac") as? Int) == self.vacant){
                    seat10.image = tableVacantImage
                } else {
                    seat10.image = tableGuestImage
                }
            case 11:
                if ((SeatData.objectForKey("vac") as? Int) == self.vacant){
                    seat11.image = tableVacantImage
                } else {
                    seat11.image = tableGuestImage
                }
            case 12:
                if ((SeatData.objectForKey("vac") as? Int) == self.vacant){
                    seat12.image = tableVacantImage
                } else {
                    seat12.image = tableGuestImage
                }
            case 13:
                if ((SeatData.objectForKey("vac") as? Int) == self.vacant){
                    seat13.image = tableVacantImage
                } else {
                    seat13.image = tableGuestImage
                }
            case 14:
                if ((SeatData.objectForKey("vac") as? Int) == self.vacant){
                    seat14.image = sofaVacantImage
                } else {
                    seat14.image = sofaGuestImage
                }
            default:
                break
            }
        }
    }
    
    func drawStatusData(){
        //Statusを描画
        if statusData.objectAtIndex(0).objectForKey("status") as! Int == 0 {
            self.statusLabel.text = "Closed."
        }else{
            self.statusLabel.text = "We are open."
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
    
    @IBAction func seat1ButtonAction(sender: AnyObject) {
        self.setSeatsVacData(sender.tag)
        self.loadSeatsData()
    }
    
    @IBAction func switchStatus(sender: AnyObject) {
        var status:PFObject = PFObject(className: "Status")
        
        status["status"] = 1
        
        status.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success) {
                
            } else {
                
            }
        }

    }
    
    @IBAction func openStatusButton(sender: AnyObject) {
        var statusQuery:PFQuery =  PFQuery(className: "Status")
        var statusDataObjectId: String = statusData.objectAtIndex(0).objectId!!
        statusQuery.getObjectInBackgroundWithId(statusDataObjectId) {
            (targetStatus: PFObject?, error: NSError?) -> Void in
            if error != nil {
                println(error)
            } else if let targetStatus = targetStatus {
                var status:Int = (targetStatus.objectForKey("status") as? Int)!
                if (status == 0){
                    targetStatus["status"] = 1
                    targetStatus.saveInBackground()
                }else{
                    targetStatus["status"] = 0
                    targetStatus.saveInBackground()
                }
            }
        }//Closer
        self.loadSeatsData()
    }

}