//
//  EditViewController.swift
//  Navigation
//
//  Created by JOHNNY_MAC_1 on 2023/04/01.
//

import UIKit

protocol EditDelegate {
    func didMessageEditDone(_ controller: EditViewController, message: String )
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool)
    func didImageZoomDone(_ controller: EditViewController, isZoom: Bool)
}

class EditViewController: UIViewController {
    // ----- Global Variables -----
    var textWayValue: String = ""
    var textMessage: String = ""
    var delegateEdit: EditDelegate?
    var bIsOn = false
    var bIsZoom = false
    
    // ----- Outlet Variables -----
    @IBOutlet var lblWay: UILabel!
    @IBOutlet var txtFieldMessage: UITextField!
    @IBOutlet var swIsOn: UISwitch!
    @IBOutlet var btnZoomInOut: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblWay.text = textWayValue
        txtFieldMessage.text = textMessage
        swIsOn.isOn = bIsOn
        if ( bIsZoom ) {
            btnZoomInOut.setTitle("ZoomIn", for: UIControl.State())
        } else {
            btnZoomInOut.setTitle("ZoomOut", for: UIControl.State())
        }
    }

    // ----- Actions -----
    @IBAction func btnZoomInOut(_ sender: UIButton) {
        if ( bIsZoom ) {
            bIsZoom = false
            btnZoomInOut.setTitle("ZoomOut", for: UIControl.State())
        } else {
            bIsZoom = true
            btnZoomInOut.setTitle("ZoomIn", for: UIControl.State())
        }
    }
    
    @IBAction func swImageOnOff(_ sender: UISwitch) {
        if sender.isOn == true {
            bIsOn = true
        } else {
            bIsOn = false
        }
    }
    
    @IBAction func actionDone(_ sender: UIButton) {
        if delegateEdit != nil {
            delegateEdit?.didMessageEditDone(self, message: txtFieldMessage.text!)
            delegateEdit?.didImageOnOffDone(self, isOn: bIsOn)
            delegateEdit?.didImageZoomDone(self, isZoom: bIsZoom)
        }
        _ = navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
