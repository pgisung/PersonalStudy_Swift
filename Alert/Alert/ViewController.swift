//
//  ViewController.swift
//  Alert
//
//  Created by JOHNNY_MAC_1 on 2023/02/28.
//

import UIKit

class ViewController: UIViewController {
    // ----- Global Variables -----
    let imgOn = UIImage(named: "lamp-on.png")
    let imgOff = UIImage(named: "lamp-off.png")
    let imgRemove = UIImage(named: "lamp-remove.png")
    var bIsLampOn = true
    
    // ----- Outlet Variables -----
    @IBOutlet var imageViewLamp: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imageViewLamp.image = imgOn
    }

    // ----- Actions -----

    @IBAction func btnLampOn(_ sender: UIButton) {
        if(true == bIsLampOn){
            let lampOnAlert = UIAlertController(title: "WARNING", message: "The lamp is already turned on", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "Yes, I got it", style: UIAlertAction.Style.default, handler: nil)
            lampOnAlert.addAction(onAction)
            present(lampOnAlert, animated: true, completion: nil)
        } else {
            imageViewLamp.image = imgOn
            bIsLampOn = true
        }
    }
    @IBAction func btnLampOff(_ sender: UIButton) {
        if(true == bIsLampOn){
            let lampOffAlert = UIAlertController(title: "LAMP OFF", message: "Would you like to turn off the lamp?", preferredStyle: UIAlertController.Style.alert)
            let offAction = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: {
                Action in self.imageViewLamp.image = self.imgOff
                self.bIsLampOn = false
            })
            let cancelAction = UIAlertAction(title: "No", style: UIAlertAction.Style.default,handler: nil)
            lampOffAlert.addAction(offAction)
            lampOffAlert.addAction(cancelAction)
            present(lampOffAlert, animated: true, completion: nil)
        }
    }
    @IBAction func btnLampRemove(_ sender: UIButton) {
        let lampRemoveAlert = UIAlertController(title: "LAMP REMOVE", message: "Would you like to remove the lamp", preferredStyle: UIAlertController.Style.alert)
        let onAction = UIAlertAction(title: "No, just turn it on", style: UIAlertAction.Style.default, handler: {
            Action in self.imageViewLamp.image = self.imgOn
            self.bIsLampOn = true
        })
        let offAction = UIAlertAction(title: "No, just turn it off", style: UIAlertAction.Style.default, handler: {
            Action in self.imageViewLamp.image = self.imgOff
            self.bIsLampOn = false
        })
        let removeAction = UIAlertAction(title: "Yes, remove it", style: UIAlertAction.Style.default, handler: {
            Action in self.imageViewLamp.image = self.imgRemove
            self.bIsLampOn = false
        })
        lampRemoveAlert.addAction(onAction)
        lampRemoveAlert.addAction(offAction)
        lampRemoveAlert.addAction(removeAction)
        present(lampRemoveAlert, animated: true, completion: nil)
    }
}

