//
//  Actions.swift
//  MemeMe
//
//  Created by Ali Alawami on 13/09/2019.
//  Copyright © 2019 Ali Alawami. All rights reserved.
//

import Foundation
import UIKit

extension MemeMeViewController{
    
    
    
    
    //MARK: Event-Target functions
    
    
    /*Display image picker upon action on the bar buttons.
    When the action is recieved, the sender would be identied by its tag.
     If the tag belong to the Album, the albu would display, otherwise, the camer would launch
    */
    @objc func displayImagePicker(_ sender:UIBarButtonItem){
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        if sender.tag == 100{
            imagePicker.sourceType = .photoLibrary
        }else{
            imagePicker.sourceType = .camera
        }
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    
    @objc func shareMeme(){
        let image = UIImage()
        let activaity = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        present(activaity, animated: true, completion: nil)
    }
    
    
    
    @objc func cancelMeme(){
        //reset Everythink to original
        //self.bottomTextField.
        //self.topTextField.text?.isEmpty = true
        //self.imageDisplayer = nil
    }
    
}
