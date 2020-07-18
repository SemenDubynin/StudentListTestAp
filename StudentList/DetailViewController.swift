//
//  DeteilViewController.swift
//  StudentList
//
//  Created by Дубынин Семён on 15.07.2020.
//  Copyright © 2020 Дубынин Семён. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!
    var selectedStudentUrl: String?
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loadView()
        
        
        let myURL = URL(string: selectedStudentUrl! )
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
    
}


