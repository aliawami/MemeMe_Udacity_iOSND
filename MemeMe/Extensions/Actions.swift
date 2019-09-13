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
    
    
    
    
    
    
    //Return all the views to their orgiginal state
    @objc func cancelMeme(){
        //reset Everythink to original
        self.bottomTextField.text = "bottom".uppercased()
        self.topTextField.text = "top".uppercased()
        self.imageDisplayer.image = nil
        self.shareButton.isEnabled = false
        
    }
    
    
    
    
    
    
    @objc func shareMeme(){
        let meme = saveMeme()
        let image = meme.memedImage
        let activaity = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        activaity.excludedActivityTypes = [.postToTwitter,
                                           .postToFlickr,
                                           .postToFacebook,
                                           .postToWeibo,]
        activaity.completionWithItemsHandler = {(activityType: UIActivity.ActivityType?, completed: Bool, returnedItems: [Any]?, error: Error?) in
            if completed{
                self.cancelMeme()
            }
            
        }
        present(activaity, animated: true, completion: nil)
    }
    
    
    func saveMeme()->Meme{
        let topText = topTextField.text ?? ""
        let bottomText = bottomTextField.text ?? ""
        let originalImage = imageDisplayer.image!
        let memeImage = generateMemedImage()
        let meme = Meme(topText: topText, bottomText: bottomText, originalImage: originalImage, memedImage: memeImage)
        
        
        return meme
        
    }
    
    
    func generateMemedImage() -> UIImage {
        
        self.toolbar.isHidden = true
        self.navigationController?.navigationBar.isHidden = true
        
        // Render view to an image
        UIGraphicsBeginImageContext(self.view.frame.size)
        view.drawHierarchy(in: self.view.frame, afterScreenUpdates: true)
        let memedImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        self.toolbar.isHidden = false
        self.navigationController?.navigationBar.isHidden = false
        
        
        return memedImage
    }
    
    
}
