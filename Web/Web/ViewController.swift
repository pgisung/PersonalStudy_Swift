//
//  ViewController.swift
//  Web
//
//  Created by JOHNNY_MAC_1 on 2023/03/02.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    // ----- Global Variables -----
    
    // ----- Outlet Variables -----
    @IBOutlet var textFieldWebAddress: UITextField!
    @IBOutlet var viewWebLoading: UIActivityIndicatorView!
    @IBOutlet var myWebView: WKWebView!
    
    func loadWebPage(_ url: String){
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        myWebView.load(myRequest)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myWebView.navigationDelegate = self
        loadWebPage("https://instagram.com/xinting_chih")
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        viewWebLoading.startAnimating()
        viewWebLoading.isHidden = false
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        viewWebLoading.stopAnimating()
        viewWebLoading.isHidden = true
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        viewWebLoading.stopAnimating()
        viewWebLoading.isHidden = true
    }
    
    func checkUrl(_ url: String) -> String {
        var strUrl = url
        let flag = strUrl.hasPrefix("http://")
        if !flag {
            strUrl = "http://" + strUrl
        }
        return strUrl
    }
    
    // ----- Actions -----
    @IBAction func actionOpenWeb(_ sender: UIButton) {
        let myUrl = checkUrl(textFieldWebAddress.text!)
        textFieldWebAddress.text = ""
        loadWebPage(myUrl)
    }
    
    @IBAction func actionOpenSite1(_ sender: UIButton) {
        loadWebPage("http://www.youtube.com/@xinting_chih")
    }
    
    @IBAction func actionOpenSite2(_ sender: UIButton) {
        loadWebPage("https://www.funliday.com/xinting_chih")
    }
    
    @IBAction func actionOpenHTMLCode(_ sender: UIButton) {
        let htmlString = "<h1> HTML String </h1><p> String 변수를 이용한 웹 페이지 </p><p><a href=\"https://instagram.com/xinting_chih\">Hsinting's instagram</a>으로 이동</p>"
        myWebView.loadHTMLString(htmlString, baseURL: nil)
    }
    
    @IBAction func actionOpenHTMLFile(_ sender: UIButton) {
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        let myUrl = URL(fileURLWithPath: filePath!)
        let myRequest = URLRequest(url: myUrl)
        myWebView.load(myRequest)
    }
    
    @IBAction func actionStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading()
    }
    
    @IBAction func actionRefresh(_ sender: UIBarButtonItem) {
        myWebView.reload()
    }
    
    @IBAction func actionGoBack(_ sender: UIBarButtonItem) {
        myWebView.goBack()
    }
    
    @IBAction func actionGoForward(_ sender: UIBarButtonItem) {
        myWebView.goForward()
    }
}

