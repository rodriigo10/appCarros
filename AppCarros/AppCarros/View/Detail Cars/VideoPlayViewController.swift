//
//  VideoPlayViewController.swift
//  AppCarros
//
//  Created by Rodrigo Garcia on 01/11/22.
//

import UIKit
import WebKit

class VideoPlayViewController: UIViewController {
    
    var video = ""
    
    var webView: WKWebView = {
        let webConfiguration = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        loadVideo()
    }
    
    func loadVideo() {
        let urlVideo = URL(string: self.video)
        let myRequest = URLRequest(url: urlVideo ?? URL(filePath: ""))
        self.webView.load(myRequest)
    }
    
    func setupUI() {
        self.view.backgroundColor = .white
        self.view.addSubview(webView)
        
        NSLayoutConstraint.activate([
            webView.topAnchor
                .constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            webView.leftAnchor
                .constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
            webView.bottomAnchor
                .constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            webView.rightAnchor
                .constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor)
        ])
    }
}

