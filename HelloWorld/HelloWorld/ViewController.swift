//
//  ViewController.swift
//  HelloWorld
//
//  Created by JOHNNY_MAC_1 on 2023/02/24.
//

import UIKit

class ViewController: UIViewController {
    // ----- Outlet Variables -----
    @IBOutlet var lblHello: UILabel!
    @IBOutlet var textFieldName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // ----- Actions -----
    @IBAction func actionBtnSend(_ sender: UIButton) {
        lblHello.text = "Hello, " + textFieldName.text!
    }
    
}

