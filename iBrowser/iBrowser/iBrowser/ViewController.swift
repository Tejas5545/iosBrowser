//
//  ViewController.swift
//  iBrowser
//
//  Created by RKU on 28/07/21.
//  Copyright © 2021 RKU. All rights reserved.
//

import UIKit
//s1. add delegate method
class ViewController: UIViewController,UIWebViewDelegate {

    @IBOutlet var myWebView: UIWebView!
    @IBOutlet var myAddresws: UITextField!
    var address:String!
    override func viewDidLoad() {
        super.viewDidLoad()
        //s2. define delegate method to webview
        myWebView.delegate = self
        address = "https://www.google.com"
         home(add: address)
    }
    
    @IBAction func home(_ sender: Any) {
        home(add: "https://www.google.com")
    }
    @IBAction func refresh(_ sender: Any) {
        myWebView.reload()
    }
    
    @IBAction func go(_ sender: Any) {
        address = myAddresws.text!
        if(!address.contains("https:") && address.contains(".com"))
        {
            address = "https://" + myAddresws.text!
            
        }else if (!address.contains("https://www.") && address.contains(".com"))
        {
            address = "https://www." + myAddresws.text!
        }else if (!address.contains("https://www.") && !address.contains(".com"))
        {
            address = "https://www.google.com/search?q=\(myAddresws.text!)"
        }
        myAddresws.text = address
        home(add: address)
    }
    
    
    func home(add:String)
    {
        myWebView.loadRequest(URLRequest(url: URL(string:add)!))
    }
    
    let alert = UIAlertController(title: "Please Wait", message: "Page is loading...", preferredStyle: .alert)
    
    //keyword: didstartload
    func webViewDidStartLoad(_ webView: UIWebView) {
        //when web page is loading
        self.present(alert, animated: true, completion: nil)
    }
    //keyword: didfinsihload
    func webViewDidFinishLoad(_ webView: UIWebView) {
        // when web page is loaded
        alert.dismiss(animated: true, completion: nil)
    }
}

