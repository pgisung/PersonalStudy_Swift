//
//  ViewController.swift
//  Tab
//
//  Created by JOHNNY_MAC_1 on 2023/03/19.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //----- Actions -----
    @IBAction func actionToImageView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1
    }
    @IBAction func actionToDatePickerView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
    }
}

