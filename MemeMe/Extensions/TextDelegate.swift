//
//  TextDelegate.swift
//  MemeMe
//
//  Created by Ali Alawami on 13/09/2019.
//  Copyright © 2019 Ali Alawami. All rights reserved.
//

import Foundation
import UIKit


extension MemeMeViewController: UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text == "top".uppercased() || textField.text == "bottom".uppercased(){
            textField.text = ""
        }
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text == ""{
            if textField.tag == 500{
                textField.text = "top".uppercased()
            }else{
                textField.text = "bottom".uppercased()
            }
        }
        textField.resignFirstResponder()
        return true
    }
    
    
    
}
