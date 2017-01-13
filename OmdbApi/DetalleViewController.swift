//
//  DetalleViewController.swift
//  OmdbApi
//
//  Created by cice on 13/1/17.
//  Copyright © 2017 cice. All rights reserved.
//

import UIKit
import WebKit

class DetalleViewController: UIViewController {
    
    
    var webView: WKWebView!
    var itemDetalle: [String: String]!
    
    override func loadView() {
        webView = WKWebView()
        view = webView
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        guard itemDetalle != nil else {return}//Para que no falle la aplicacion
        if let title = itemDetalle["title"]{
            let body = itemDetalle["body"]
            let sigs = itemDetalle["sigs"]
            
            var html = "<html>"
            html += "<head>"
            html += "<meta name=/ viewport/ content=/ width=device-width, initial-scale=1/>"
            html += "<style> body {font-size: 150%; } </style>"
            html += "</head>"
            html += "<b>"+"<i>"+"<u>"
            html += "<body>"
            html += title
             html += "</b>"+"</i>"+"</u>"
            html += "</br>"
            html += body!
            html += "</br>"
            html += sigs!
            html += "</body>"
            html += "</html>"
            
            webView.loadHTMLString(html, baseURL: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
