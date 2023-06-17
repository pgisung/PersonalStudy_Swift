//
//  ViewController.swift
//  PageControl
//
//  Created by JOHNNY_MAC_1 on 2023/03/14.
//

import UIKit

class ViewController: UIViewController {
    //----- Global Variables -----
    var arrayImagePath: [String]!

    //----- Outlet Variables -----s
    @IBOutlet var imageView: UIImageView!
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
        var iCurrentPageIndex: Int
        
        repeat{
            arrayImagePath = []
            
            for imgIndex in 0...5{
                let strImage: String! = "0\(imgIndex + 1).png"
                if ( strImage == nil ) {
                    continue
                }
                arrayImagePath.append(strImage)
            }
            if( arrayImagePath.count == 0 ){
                break
            }
            
            pageControl.numberOfPages = arrayImagePath.count
            iCurrentPageIndex = pageControl.currentPage
            
            pageControl.pageIndicatorTintColor = UIColor.green
            pageControl.currentPageIndicatorTintColor = UIColor.red
            
            imageView.image = UIImage(named: arrayImagePath[iCurrentPageIndex])
            
            bReturn = true
        } while(false)
        return bReturn
    }

    //----- Actions -----
    @IBAction func actionPageChange(_ sender: UIPageControl) {
        imageView.image = UIImage(named: arrayImagePath[pageControl.currentPage])
    }
}

