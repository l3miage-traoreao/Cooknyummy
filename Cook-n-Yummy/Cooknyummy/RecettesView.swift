//
//  RecettesView.swift
//  Cooknyummy
//
//  Created by traoreao on 25/05/2022.
//

import UIKit

class RecettesViewController: UIViewController {
    
    @IBOutlet weak var preferencesView: UIView!
    @IBOutlet weak var omnivore: UIButton!
    @IBAction func omnivoreAction(_ sender: Any) {
        
     let storyboard = UIStoryboard(name: "Main", bundle: nil)
     let preferencesVC = storyboard.instantiateViewController(withIdentifier: "Video View Controller")
       self.navigationController?.pushViewController(preferencesVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

