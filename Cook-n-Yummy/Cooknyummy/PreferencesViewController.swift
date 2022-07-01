//
//  PreferencesView.swift
//  Cooknyummy
//
//  Created by traoreao on 25/05/2022.
//

/*import SwiftUI

struct PreferencesView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct PreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesView()
    }
}*/
//
//  ViewController.swift
//  Cooknyummy
//
//  Created by traoreao on 06/04/2022.
//

import UIKit

class PreferencesViewController: UIViewController {
    
    @IBOutlet weak var preferencesView: UIView!
    @IBOutlet weak var omnivore: UIButton!
    
    @IBAction func omnivoreAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let preferencesVC = storyboard.instantiateViewController(withIdentifier: "Omnivore Decouverte View")
          self.navigationController?.pushViewController(preferencesVC, animated: true)
        
        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}



