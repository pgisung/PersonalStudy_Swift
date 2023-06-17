//
//  ViewController.swift
//  PageMove
//
//  Created by JOHNNY_MAC_1 on 2023/03/18.
//

import UIKit

class ViewController: UIViewController {
    //----- Global Variables -----
    var arrayNumbers: [String]!
    
    //----- Outlet Variables -----
    @IBOutlet var lblNumber: UILabel!
    @IBOutlet var pageControl: UIPageControl!
    
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
            arrayNumbers = []
            
            for numIndex in 1...10{
                let strNum: String! = String(numIndex)
                if ( strNum == nil ) {
                    continue
                }
                arrayNumbers.append(strNum)
            }
            if( arrayNumbers.count == 0 ){
                break
            }
            
            pageControl.numberOfPages = arrayNumbers.count
            
            pageControl.pageIndicatorTintColor = UIColor.white
            pageControl.currentPageIndicatorTintColor = UIColor.gray
            
            lblNumber.text = String(pageControl.currentPage + 1)
            
            bReturn = true
        } while(false)
        return bReturn
    }
    
    //----- Actions -----
    @IBAction func actionPageNum(_ sender: UIPageControl) {
        lblNumber.text = arrayNumbers[sender.currentPage]
    }
}

