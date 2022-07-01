//
//  ViewController.swift
//  Cooknyummy
//
//  Created by traoreao on 06/04/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var startview: UIView!
    @IBOutlet weak var start: UIButton!
    @IBAction func startAction(_ sender: Any) {
        
     let storyboard = UIStoryboard(name: "Main", bundle: nil)
     let preferencesVC = storyboard.instantiateViewController(withIdentifier: "Preferences View Controller")
       self.navigationController?.pushViewController(preferencesVC, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
        
        /* video des recettes en ligne
         var myPlayer: WKWebView!

            override func viewDidLoad() {
                super.viewDidLoad()

                let webConfiguration = WKWebViewConfiguration()
                webConfiguration.allowsInlineMediaPlayback = true
                webConfiguration.mediaTypesRequiringUserActionForPlayback = []

                myPlayer = WKWebView(frame: CGRect(x: 0, y: 0, width: 375, height: 300), configuration: webConfiguration)
                self.view.addSubview(myPlayer)

                if let videoURL:URL = URL(string: "https://www.youtube.com/embed/9n1e1N0Sa9k?playsinline=1") {
                     let request:URLRequest = URLRequest(url: videoURL)
                     myPlayer.load(request)
                }

                //OR to show player control also, use this
                /*if let videoURL:URL = URL(string: "https://www.youtube.com/embed/9n1e1N0Sa9k?playsinline=1&controls:1") {
                     let request:URLRequest = URLRequest(url: videoURL)
                     myPlayer.load(request)
                }*/
            }*/
    }


}

