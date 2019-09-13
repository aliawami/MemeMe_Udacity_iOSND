//
//  ImagePicker.swift
//  MemeMe
//
//  Created by Ali Alawami on 13/09/2019.
//  Copyright © 2019 Ali Alawami. All rights reserved.
//

import UIKit


extension MemeMeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        DispatchQueue.global().async {
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
                DispatchQueue.main.async {
                    self.imageDisplayer.image = image
                    picker.dismiss(animated: true){
                        self.shareButton.isEnabled = true
                    }
                }
                
            }
        }
        
    }
}

