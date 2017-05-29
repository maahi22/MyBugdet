//
//  AboutVC.swift
//  MyBugdet
//
//  Created by Maahi on 08/01/17.
//  Copyright © 2017 Maahi. All rights reserved.
//

import UIKit

class AboutVC: UIViewController,UIWebViewDelegate {

   var html:String = ""
    
    @IBOutlet weak var aboutwebView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        html = "<html><head><title>My Budget</title><style type=\"text/css\">p {margin-top:2px;margin-bottom:2px;} a{color:#FC0;text-decoration:none;font-size:14px;}</style></head><body style=\"font-family:Helvetica;color:#000000;margin:0;padding:0;background-position:top;background-image:url(appbg.png);background-repeat:no-repeat;line-height:17px;font-size:12px;background-color:#d1d1d1\"><div style=\"margin:4;text-align:center;padding-top:40px;line-height:200%\">"
        // html = [html stringByAppendingString:(@"<h1 style=\"margin:2;\">QS</h1>")];
        html = html + "</br></br><b>My Budget</b>"
        
        html = html + "</br>Simplifying The Individual Budget Process"
        html = html + "<br/>My Budget (Version 1.0)"
        
        // html = [html stringByAppendingString:(@"<br/><a href=\"tgp.ca?query=web\">The Game Puck App</a>")];
        html = html + "<br/>Created and Produced by"
        html = html + "<p>Ktech Inc<br/></p>"
        // html = [html stringByAppendingString:(@"<p>Content<br/><a href=\"quantumspeed.ca?query=web\">Quantum Speed</a><p/>")];
        
        html = html + "<p>&copy; 2017 Ktech Inc.<br/></p>"
        html = html + "<p>All right reserved<br/></p>"
        
        html = html + "</div></body></html>"
        
        
        aboutwebView.delegate = self
        aboutwebView.loadHTMLString(html, baseURL: nil)
        
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
