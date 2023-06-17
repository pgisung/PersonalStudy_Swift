//
//  ViewController.swift
//  ImageViewer
//
//  Created by JOHNNY_MAC_1 on 2023/02/26.
//

import UIKit

class ViewController: UIViewController {
    // ----- Global Variables -----
    var iImageIndex: Int = 0
    var arrayImage: [UIImage] = []
    var timer: Timer?
    
    // ----- Outlet Variables -----
    @IBOutlet var imgViewList: UIImageView!
    @IBOutlet var btnPrevious: UIButton!
    @IBOutlet var btnNext: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if( initialize() == false ){
            // initialize failed
        }
    }
    
    func initialize() -> Bool {
        var bReturn: Bool = false
        repeat{
            for imgIndex in 0...5{
                let objImage: UIImage? = UIImage(named: "\(imgIndex + 1).png")
                if( objImage == nil ) {
                    continue
                }
                arrayImage.append(objImage!)
            }
            if( arrayImage.count == 0 ){
                break
            }
            imgViewList.image = arrayImage[iImageIndex]
            
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(actionTimer), userInfo: nil, repeats: true)
            
            bReturn = true
        } while(false)
        return bReturn
    }
    
    // ----- Actions -----
    @objc func actionTimer()
    {
        switch iImageIndex {
        case 0:
            btnPrevious.isEnabled = false
            if( arrayImage.count == 1 ){
                btnNext.isEnabled = false
            }
        case arrayImage.count - 1:
            btnNext.isEnabled = false
        default:
            btnPrevious.isEnabled = true
            btnNext.isEnabled = true
        }
    }
    @IBAction func actionPreviousImage(_ sender: UIButton) {
        if ( iImageIndex <= 0
        || arrayImage.count < 2 ) {
            return
        }
        iImageIndex -= 1
        imgViewList.image = arrayImage[iImageIndex]
    }
    @IBAction func actionNextImage(_ sender: UIButton) {
        if ( iImageIndex >= arrayImage.count - 1
        || arrayImage.count < 2 ) {
            return
        }
        iImageIndex += 1
        imgViewList.image = arrayImage[iImageIndex]
    }
}

