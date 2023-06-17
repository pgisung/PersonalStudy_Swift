//
//  ViewController.swift
//  Navigation
//
//  Created by JOHNNY_MAC_1 on 2ss023/03/24.
//

import UIKit

class ViewController: UIViewController, EditDelegate {
    // ----- Global Variables -----
    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")
    
    var bIsOn = true
    var bIsZoom = false
        var bOrgZoom = false
    
    // ----- Outlet Variables -----
    @IBOutlet var txtFieldMessage: UITextField!
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image = imgOn
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController
        if segue.identifier == "editButton" {
            editViewController.textWayValue = "segue : use button"
        } else if segue.identifier == "editBarButton" {
            editViewController.textWayValue = "segue : use Bar button"
        }
        editViewController.textMessage = txtFieldMessage.text!
        editViewController.bIsOn = bIsOn
        editViewController.bIsZoom = bOrgZoom
        editViewController.delegateEdit = self
    }
    
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        txtFieldMessage.text = message
    }
    
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool) {
        if isOn {
            imgView.image = imgOn
            self.bIsOn = true
        } else {
            imgView.image = imgOff
            self.bIsOn = false
        }
    }
    
    func didImageZoomDone(_ controller: EditViewController, isZoom: Bool) {
        let scale: CGFloat = 2.0
        var newWidth: CGFloat, newHeight: CGFloat
        
        if isZoom {
            if bOrgZoom {
                
            } else {
                newWidth = imgView.frame.width*scale
                newHeight = imgView.frame.height*scale
                imgView.frame.size = CGSize(width: newWidth, height: newHeight)
                self.bIsZoom = false
                self.bOrgZoom = true
            }
        } else {
            if bOrgZoom {
                newWidth = imgView.frame.width/scale
                newHeight = imgView.frame.height/scale
                imgView.frame.size = CGSize(width: newWidth, height: newHeight)
                self.bIsZoom = true
                self.bOrgZoom = false
            } else {
                
            }
        }
    }
}

