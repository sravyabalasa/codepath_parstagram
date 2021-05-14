//
//  CameraViewController.swift
//  Parstagram
//
//  Created by Sravya Balasa on 5/1/21.
//

import UIKit
import AlamofireImage
import Parse

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var postImageView: UIImageView!
    @IBOutlet var commentField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onSubmit(_ sender: Any) {
        let post = PFObject(className:"Posts")
        post["caption"] = commentField.text!
        post["author"] = PFUser.current()!
        
        let imageData = postImageView.image!.pngData()
        let file = PFFileObject(name: "image.png", data: imageData!)
        post["image"] = file
        
        post.saveInBackground { (success, error) in
            if success {
                self.dismiss(animated: true, completion: nil)
            } else {
                print(error!)
            }
        }
    }
    
    @IBAction func onCameraButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
        } else {
            picker.sourceType = .photoLibrary
        }
        
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        let size = CGSize(width: 300, height: 300)
        let scaledImage = image.af.imageAspectScaled(toFill: size)
        postImageView.image = scaledImage
        dismiss(animated: true, completion: nil)
    }
}
