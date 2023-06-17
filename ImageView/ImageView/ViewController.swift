//
//  ViewController.swift
//  ImageView
//
//  Created by JOHNNY_MAC_1 on 2023/02/26.
//

import UIKit

class ViewController: UIViewController {
    // ----- Global Variables -----
    var isZoom = false
    var imageOn: UIImage?
    var imageOff: UIImage?
    
    // ----- Outlet Variables -----
    @IBOutlet var imageViewBulb: UIImageView!
    @IBOutlet var buttonResize: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imageOn = UIImage(named: "lamp_on.png")
        imageOff = UIImage(named: "lamp_off.png")
        
        imageViewBulb.image = imageOn
    }

    // ----- Actions -----
    @IBAction func actionResize(_ sender: UIButton) {
        let scale:CGFloat = 2.0
        var newWidth:CGFloat, newHeight:CGFloat
        
        if(isZoom){
            newWidth = imageViewBulb.frame.width / scale
            newHeight = imageViewBulb.frame.height / scale
            buttonResize.setTitle("ZoomIn", for: .normal)
        } else {
            newWidth = imageViewBulb.frame.width * scale
            newHeight = imageViewBulb.frame.height * scale
            buttonResize.setTitle("ZoomOut", for: .normal)
        }
        imageViewBulb.frame.size = CGSize(width: newWidth, height: newHeight)
        isZoom = !isZoom
    }
    @IBAction func actionImageOnOff(_ sender: UISwitch) {
        if(sender.isOn){
            imageViewBulb.image = imageOn
        } else {
            imageViewBulb.image = imageOff
        }
    }
}

