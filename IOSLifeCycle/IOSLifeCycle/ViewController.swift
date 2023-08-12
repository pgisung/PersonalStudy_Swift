//
//  ViewController.swift
//  IOSLifeCycle
//
//  Created by JOHNNY_MAC_1 on 2023/07/14.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    var strNibName = ""
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
      tableView.dataSource = self
    // nib 연결시
        let buttonCellNib = UINib(nibName: strNibName, bundle: nil)
        tableView.register(buttonCellNib, forCellReuseIdentifier: "")
      tableView.translatesAutoresizingMaskIntoConstraints = false
      return tableView
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        strNibName = nibNameOrNil ?? ""
        print("init nibname")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print("init nscoder")
    }
    
    override func loadView() {
        super.loadView()
        print("loadView")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
}

