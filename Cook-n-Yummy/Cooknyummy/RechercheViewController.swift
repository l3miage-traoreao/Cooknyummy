//
//  RechercheViewController.swift
//  Cooknyummy
//
//  Created by traoreao on 20/06/2022.
//

//
//  OmnivoreDecouverteViewController.swift
//  Cooknyummy
//
//  Created by traoreao on 01/06/2022.
//

import UIKit

class RechercheViewController: UIViewController, UITabBarDelegate {
    
    //crash du segue vue non utilisée
    struct Receipe : Decodable {
        var name: String
        var description: String
        var time: Int
        var image:String
        var ingredients: String
        var steps: String
    }
    // @IBOutlet weak var receipeCollectionView: UICollectionView!
    var receipes:[Receipe] = []
    @IBOutlet weak var TestMinuteur: UIButton!
    
    @IBAction func testMinuteur(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let preferencesVC = storyboard.instantiateViewController(withIdentifier: "MinuteurView")
        self.navigationController?.pushViewController(preferencesVC, animated: true)
    }
    @IBOutlet weak var RechercheView: UIView!
    @IBOutlet weak var searchbarAdresse: UISearchBar!
    @IBOutlet weak var search: UIButton!
    
    @IBOutlet weak var imageDescription: UIImageView!
    
    @IBOutlet weak var title1: UILabel!
    var num: Int?
    
    @IBOutlet var receipeDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadJson()
        
    }
    //chargement json
    func loadJson(){
        //Affichage json
        if let fileLocation = Bundle.main.path(forResource: "receipes", ofType: "json") {
            // do catch in case of an error
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: fileLocation))
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([Receipe].self, from: data)
                //print(dataFromJson)
                //self.ReceipeData = dataFromJson
                receipes = dataFromJson
                print(receipes)
                // Create URL
                let url = URL(string: receipes[num!].image)!
                print(receipes.last!.image)
                //let url = URL(string:"https://www.supertoinette.com/recette/4197/ratatouille.html")!

                    // Fetch Image Data
                    if let data = try? Data(contentsOf: url) {
                        // Create Image and Update Image View
                        print(data)
                        self.imageDescription.image = UIImage(data: data)
                        self.title1.text = receipes[num!].name
                        self.receipeDescription.text = receipes[num!].description
                        
                        
                    }
            
        } catch {
            
            print(error)
        }
    }
    
}

}

    


