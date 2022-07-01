//
//  OmnivoreDecouverteViewController.swift
//  Cooknyummy
//
//  Created by traoreao on 01/06/2022.
//

import UIKit

class OmnivoreDecouverteViewController: UIViewController, UITabBarDelegate {
  
  
    
    
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
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var imageView2: UIImageView!
    
    @IBOutlet weak var imageView4: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView5: UIImageView!
    @IBOutlet weak var title1: UILabel!
    @IBOutlet weak var title2: UILabel!
    @IBOutlet weak var title3: UILabel!
    @IBOutlet weak var title4: UILabel!
    @IBOutlet weak var tabBar: UITabBar!
    @IBOutlet weak var omnivoreDecouverteView: UIView!
    @IBOutlet weak var searchItem: UITabBarItem!
    
    @IBOutlet weak var title5: UILabel!
    @IBAction func omnivoreAction(_ sender: Any) {
        //receipes.in
        //print(receipes.last)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let preferencesVC = storyboard.instantiateViewController(withIdentifier: "Video View Controller")
        self.navigationController?.pushViewController(preferencesVC, animated: true)
        
        
    }
    //preparer transmission de la recette choisie a la vue suivante
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

       if segue.identifier == "segueToSearch" {

          let searchVC = segue.destination as? RechercheViewController
           let num = sender as? Int
                   searchVC?.num = num
       }

    }
    
    @objc private func handleImageSelector1() {
        print("Pressed image selector")
            let num = 0
            performSegue(withIdentifier: "segueToSearch", sender: num)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.delegate = self
        loadJson()
        
    }
    //chargement du fichier json
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
                var url = URL(string: receipes[0].image)!
                print(receipes.last!.image)
                //let url = URL(string:"https://www.supertoinette.com/recette/4197/ratatouille.html")!

                    // Fetch Image Data
                    if let data = try? Data(contentsOf: url) {
                        // Create Image and Update Image View
                        print(data)
                        self.imageView.image = UIImage(data: data)
                        self.title1.text = receipes[0].name
                        imageView.isUserInteractionEnabled = true
                            imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleImageSelector1)))
                        
                        
                    }
                url = URL(string: receipes[1].image)!
                if let data = try? Data(contentsOf: url) {
                        self.imageView2.image = UIImage(data: data)
                        self.title2.text = receipes[1].name
                }
                url = URL(string: receipes[2].image)!
                if let data = try? Data(contentsOf: url) {
                        self.imageView3.image = UIImage(data: data)
                        self.title3.text = receipes[2].name
                }
                        
                url = URL(string: receipes[3].image)!
                if let data = try? Data(contentsOf: url) {
                        self.imageView4.image = UIImage(data: data)
                        self.title4.text = receipes[3].name
                }
                        
                url = URL(string: receipes[4].image)!
                if let data = try? Data(contentsOf: url) {
                        self.imageView5.image = UIImage(data: data)
                        self.title5.text = receipes[4].name
                }
                        
                    
            } catch {
                
                print(error)
            }
        }
        
    }
    
    func rechercheAction() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let preferencesVC = storyboard.instantiateViewController(withIdentifier: "Recherche view  controller")
        self.navigationController?.pushViewController(preferencesVC, animated: true)}
    
    func ajouterAction() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let preferencesVC = storyboard.instantiateViewController(withIdentifier: "DescriptionView")
        self.navigationController?.pushViewController(preferencesVC, animated: true)
    }
    //actions tabbar
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.tag == 0 {
            ajouterAction()
            self.viewDidLoad()
        }
        else if item.tag == 1 {
            rechercheAction()
            self.viewDidLoad()
            
        }
        else if item.tag == 2 {
            print("Favoris")
        }
    }
    
    
    
}
