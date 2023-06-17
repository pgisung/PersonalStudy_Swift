//
//  ViewController.swift
//  DatePicker
//
//  Created by JOHNNY_MAC_1 on 2023/02/28.
//

import UIKit

class DateViewController: UIViewController {
    // ----- Global Variables -----
    let timeSelector: Selector = #selector(DateViewController.updateTime)
    let dInterval = 1.0
    var iCount = 0
    var bIsAlert = false
    var strAlarmTime: String?
    
    // ----- Outlet Variables -----
    @IBOutlet var lblCurrentTime: UILabel!  
    @IBOutlet var lblSelectTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: dInterval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    // ----- Actions -----
    @objc func updateTime(){
//        lblCurrentTime.text = String(iCount)
//        iCount = iCount + 1
        
        let date = NSDate()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        lblCurrentTime.text = "CurrentTime: " + formatter.string(from: date as Date)
        
        formatter.dateFormat = "hh:mm aaa"
        let strCurrentTime = formatter.string(from: date as Date)
        
        if(strAlarmTime == strCurrentTime
           && bIsAlert == false){
            bIsAlert = true
            view.backgroundColor = UIColor.red
            let alarmAlert = UIAlertController(title: "NOTICE", message: "It is time you set", preferredStyle: UIAlertController.Style.alert)
            let alarmAction = UIAlertAction(title: "Yes, I got it", style: UIAlertAction.Style.default, handler: nil)
            alarmAlert.addAction(alarmAction)
            present(alarmAlert, animated: true, completion: nil)
        }
        
        if(bIsAlert == true){
            iCount += 1
            if( 60 <= iCount ){
                iCount = 0
                bIsAlert = false
                view.backgroundColor = UIColor.white
            }
        }
    }
    @IBAction func actionChangeDate(_ sender: UIDatePicker) {
        let objDatePicker = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        lblSelectTime.text = "SelectTime: " + formatter.string(from: objDatePicker.date)
        
        formatter.dateFormat = "hh:mm aaa"
        strAlarmTime = formatter.string(from: objDatePicker.date)
    }
}

