//
//  DescriptionViewController.swift
//  Cooknyummy
//
//  Created by traoreao on 23/06/2022.
//

import UIKit

class DescriptionViewController: UIViewController, UITabBarDelegate, UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextFieldDelegate {
    
    @IBOutlet weak var descriptionView: UIView!
    @IBOutlet weak var imageTake: UIImageView!
    var tapChangeState = UITapGestureRecognizer()
    //@IBOutlet weak var debugLabel = UILabel!
    var imagePicker = UIImagePickerController()
    enum ImageSource {
    case photoLibrary
    case camera
    }
    
    @IBOutlet weak var textEnter: UITextField!
    override func viewDidLoad() {
    super.viewDidLoad()
        
        

                //hidekeyboard
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.hideKeyboardByTappingOutside))
            
            self.view.addGestureRecognizer(tap)
        }

        @objc func hideKeyboardByTappingOutside() {
            self.view.endEditing(true)
        }

    
    
    @IBOutlet weak var takeAPhoto: UIButton!
    @IBAction func takeAPhoto(_ sender: Any) {
        
        //MARK: - Take image
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
        selectImageFrom(.photoLibrary)
        return
        }
        selectImageFrom(.camera)
    }
    
    @IBOutlet weak var afficherimage: UIButton!
    
    @IBAction func afficherImage(_ sender: Any) {
        imagePicker.delegate  = self // setup the view controller as the image picker delegate.
                imagePicker.allowsEditing = false // disable image editing by the user
        imagePicker.sourceType = UIImagePickerController.SourceType.camera // set source as camera
        imagePicker.cameraDevice = UIImagePickerController.CameraDevice.rear // use rear camera

                // setting up gesture recognizer
                tapChangeState.numberOfTouchesRequired = 1 // number of fingers required for change state detection
                tapChangeState.numberOfTapsRequired = 2
    }
    func selectImageFrom(_ source: ImageSource){
        imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        switch source {
        case .camera:
        imagePicker.sourceType = .camera
        case .photoLibrary:
        imagePicker.sourceType = .photoLibrary
        }
        present(imagePicker, animated: true, completion: nil)
    }
    
        //MARK: - Saving Image here
    @IBAction func save(_ sender: AnyObject) {
        guard let selectedImage = imageTake.image else {
        print("Image not found!")
        return
        }
        UIImageWriteToSavedPhotosAlbum(selectedImage, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    }
        //MARK: - Add image to Library
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
        //we got back an error!
        showAlertWith(title: "Save error", message: error.localizedDescription)
        } else {
        showAlertWith(title: "Saved!", message: "Your image has been saved to your photos.")
        }
    }
    
    
    func showAlertWith(title: String, message: String){
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    // Conforming to ControllerDelegate protocol:
    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
            if let selectedImage = info[UIImagePickerController.InfoKey.originalImage.rawValue] as? UIImage {
                imageTake.contentMode = .scaleAspectFill
                imageTake.image = selectedImage
                //debugLabel.text = "Captured"
            }
            dismiss(animated: true, completion: nil)
        }
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            dismiss(animated: false, completion: nil)
        }
    
    
}
        
        
        

    


