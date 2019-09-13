//
//  Navigation.swift
//  MemeMe
//
//  Created by Ali Alawami on 13/09/2019.
//  Copyright © 2019 Ali Alawami. All rights reserved.
//

import Foundation
import UIKit

extension MemeMeViewController{
    
    func customNavigation(){
        
        self.cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera)
        
        self.navigationItem.leftBarButtonItem = shareButton
        self.navigationItem.rightBarButtonItem = cancelButton
        
    }
    
    
    
    
}
