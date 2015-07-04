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
    
    //seat用のアウトレット
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
    
    //残席数を見るボタン
    @IBOutlet weak var showButton: UIButton!
    
    //Seatsの情報をストア
    var allSeatsData: NSMutableArray = NSMutableArray()
    //seatの空き情報のための変数
    var vacant:Int = 1
    var guest:Int = 0
    //seat用のimage
    var tableVacantImage: UIImage = UIImage(named: "seats_table_vacant.png")!
    var tableGuestImage: UIImage = UIImage(named: "seats_table_guest.png")!
    var counterVacantImage: UIImage = UIImage(named: "seats_counter_vacant.png")!
    var counterGuestImage: UIImage = UIImage(named: "seats_counter_guest.png")!
    var sofaVacantImage: UIImage = UIImage(named: "seats_sofa_vacant.png")!
    var sofaGuestImage: UIImage = UIImage(named: "seats_sofa_guest.png")!
    
    //VacantDataCountWindow用
    private var myWindow: UIWindow!
    private var myWindowButton: UIButton!
    private var myLabel: UILabel!
    private var effectView: UIVisualEffectView!
    private var effect = UIBlurEffect(style: UIBlurEffectStyle.Light)
    private var vacantNumFlag: Int!
    private var vacantDataListTable: [Int]!
    private var vacantDataListCounter: [Int]!
    private var vacantDataListSofa: [Int]!
    private var vacantDataCountTable = 0
    private var vacantDataCountCounter = 0
    private var vacantDataCountSofa = 0
    private var myTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Title画像
        let image = UIImage(named: "navicon_white_seats.png")
        let imageView = UIImageView(image: image)
        imageView.frame = CGRectMake(0, 0, 36, 33)
        self.navigationItem.titleView = imageView
        //vacantNumWindowの初期化
        myWindow = UIWindow()
        myWindowButton = UIButton()
        effectView = UIVisualEffectView()
        vacantNumFlag = 0
        vacantDataListTable = [1,1,1,1,1,1,1,1,1]
        vacantDataListCounter = [1,1,1,1]
        vacantDataListSofa = [1]
        self.makeMyWindow()
        //残席数見るボタンの設定
        self.showButton.layer.cornerRadius = 8.0
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.loadSeatsData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Seatsテーブルのデータをすべて読み込む
    @IBAction func loadSeatsData(){
        //初期化
        allSeatsData.removeAllObjects()
        vacantDataCountTable = 0
        vacantDataCountCounter = 0
        vacantDataCountSofa = 0
        
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
            var seat_Id:Int = (SeatData.objectForKey("seat_Id") as? Int)!
            switch seat_Id {
            case 1:
                if ((SeatData.objectForKey("vac") as? Int) == self.vacant){
                    seat1.image = tableVacantImage
                    vacantDataListTable[0] = self.vacant
                    ++vacantDataCountTable
                } else {
                    seat1.image = tableGuestImage
                    vacantDataListTable[0] = self.guest
                }
            case 2:
                if ((SeatData.objectForKey("vac") as? Int) == self.vacant){
                    seat2.image = counterVacantImage
                    vacantDataListCounter[0] = self.vacant
                    ++vacantDataCountCounter
                } else {
                    seat2.image = counterGuestImage
                    vacantDataListCounter[0] = self.guest
                }
            case 3:
                if ((SeatData.objectForKey("vac") as? Int) == self.vacant){
                    seat3.image = counterVacantImage
                    vacantDataListCounter[1] = self.vacant
                    ++vacantDataCountCounter
                } else {
                    seat3.image = counterGuestImage
                    vacantDataListCounter[1] = self.guest
                }
            case 4:
                if ((SeatData.objectForKey("vac") as? Int) == self.vacant){
                    seat4.image = counterVacantImage
                    vacantDataListCounter[2] = self.vacant
                    ++vacantDataCountCounter
                } else {
                    seat4.image = counterGuestImage
                    vacantDataListCounter[2] = self.guest
                }
            case 5:
                if ((SeatData.objectForKey("vac") as? Int) == self.vacant){
                    seat5.image = counterVacantImage
                    vacantDataListCounter[3] = self.vacant
                    ++vacantDataCountCounter
                } else {
                    seat5.image = counterGuestImage
                    vacantDataListCounter[3] = self.guest
                }
            case 6:
                if ((SeatData.objectForKey("vac") as? Int) == self.vacant){
                    seat6.image = tableVacantImage
                    vacantDataListTable[1] = self.vacant
                    ++vacantDataCountTable
                } else {
                    seat6.image = tableGuestImage
                    vacantDataListTable[1] = self.guest
                }
            case 7:
                if ((SeatData.objectForKey("vac") as? Int) == self.vacant){
                    seat7.image = tableVacantImage
                    vacantDataListTable[2] = self.vacant
                    ++vacantDataCountTable
                } else {
                    seat7.image = tableGuestImage
                    vacantDataListTable[2] = self.guest
                }
            case 8:
                if ((SeatData.objectForKey("vac") as? Int) == self.vacant){
                    seat8.image = tableVacantImage
                    vacantDataListTable[3] = self.vacant
                    ++vacantDataCountTable
                } else {
                    seat8.image = tableGuestImage
                    vacantDataListTable[3] = self.guest
                }
            case 9:
                if ((SeatData.objectForKey("vac") as? Int) == self.vacant){
                    seat9.image = tableVacantImage
                    vacantDataListTable[4] = self.vacant
                    ++vacantDataCountTable
                } else {
                    seat9.image = tableGuestImage
                    vacantDataListTable[4] = self.guest
                }
            case 10:
                if ((SeatData.objectForKey("vac") as? Int) == self.vacant){
                    seat10.image = tableVacantImage
                    vacantDataListTable[5] = self.vacant
                    ++vacantDataCountTable
                } else {
                    seat10.image = tableGuestImage
                    vacantDataListTable[5] = self.guest
                }
            case 11:
                if ((SeatData.objectForKey("vac") as? Int) == self.vacant){
                    seat11.image = tableVacantImage
                    vacantDataListTable[6] = self.vacant
                    ++vacantDataCountTable
                } else {
                    seat11.image = tableGuestImage
                    vacantDataListTable[6] = self.guest
                }
            case 12:
                if ((SeatData.objectForKey("vac") as? Int) == self.vacant){
                    seat12.image = tableVacantImage
                    vacantDataListTable[7] = self.vacant
                    ++vacantDataCountTable
                } else {
                    seat12.image = tableGuestImage
                    vacantDataListTable[7] = self.guest
                }
            case 13:
                if ((SeatData.objectForKey("vac") as? Int) == self.vacant){
                    seat13.image = tableVacantImage
                    vacantDataListTable[8] = self.vacant
                    ++vacantDataCountTable
                } else {
                    seat13.image = tableGuestImage
                    vacantDataListTable[8] = self.guest
                }
            case 14:
                if ((SeatData.objectForKey("vac") as? Int) == self.vacant){
                    seat14.image = sofaVacantImage
                    vacantDataListSofa[0] = self.vacant
                    ++vacantDataCountSofa
                } else {
                    seat14.image = sofaGuestImage
                    vacantDataListSofa[0] = self.guest
                }
            default:
                break
            }
        }
        //vacantDataCouner用のTextを更新
        myTextView.text = "テーブル席 : \(vacantDataCountTable) / 9\n\nカウンター席 : \(vacantDataCountCounter) / 4\n\nソファー席 : \(vacantDataCountSofa) / 1"
    }
    
    //vacantDataCounter用のWindowを生成
    internal func makeMyWindow(){
        
        // 背景を白に設定する.
        myWindow.backgroundColor = UIColor.clearColor()
        myWindow.frame = CGRectMake(0, 0, 200, 250)
        myWindow.layer.position = CGPointMake(self.view.frame.width/2, self.view.frame.height/2)
        myWindow.alpha = 1
        myWindow.layer.cornerRadius = 10
        
        // myWindowをkeyWindowにする.
        myWindow.makeKeyWindow()
        
        // windowを表示する.
        self.myWindow.makeKeyAndVisible()
        
        // Blurエフェクトを適用するEffectViewを作成.
        effectView = UIVisualEffectView(effect: effect)
        effectView.frame = CGRectMake(0, 0, 200, 250)
        effectView.layer.masksToBounds = true
        effectView.layer.cornerRadius = 10.0
        self.myWindow.addSubview(effectView)
        
        // Labelを作成.
        myLabel = UILabel(frame: CGRectMake(0,0,200,50))
        myLabel.text = "残席数"
        myLabel.textColor = UIColor.whiteColor()
        myLabel.font = UIFont.systemFontOfSize(20)
        myLabel.textAlignment = NSTextAlignment.Center
        myLabel.layer.position = CGPointMake(self.myWindow.frame.width/2, 20)
        self.myWindow.addSubview(myLabel)
        
        // TextViewを作成する.
        myTextView = UITextView(frame: CGRectMake(10, 55, self.myWindow.frame.width - 20, 150))
        myTextView.backgroundColor = UIColor.clearColor()
        myTextView.font = UIFont.systemFontOfSize(CGFloat(18))
        myTextView.textColor = UIColor.whiteColor()
        myTextView.textAlignment = NSTextAlignment.Left
        myTextView.editable = false
        self.myWindow.addSubview(myTextView)
        
        // ボタンを作成する.
        myWindowButton.frame = CGRectMake(0, 0, 100, 30)
        myWindowButton.backgroundColor = UIColor.grayColor()
        myWindowButton.setTitle("close", forState: .Normal)
        myWindowButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        myWindowButton.layer.masksToBounds = true
        myWindowButton.layer.cornerRadius = 8.0
        myWindowButton.layer.position = CGPointMake(self.myWindow.frame.width/2, self.myWindow.frame.height-30)
        myWindowButton.addTarget(self, action: "onClickCloseButton", forControlEvents: .TouchUpInside)
        self.myWindow.addSubview(myWindowButton)
        
        self.myWindow.hidden = true
    }
    
    internal func onClickCloseButton(){
        self.myWindow.hidden = true
        vacantNumFlag = 0
    }
    
    @IBAction func showVacantDataCount(sender: AnyObject) {
        if vacantNumFlag == 0 {
            self.myWindow.hidden = false
            vacantNumFlag = 1
        }else{
            self.onClickCloseButton()
        }
    }
    
}
