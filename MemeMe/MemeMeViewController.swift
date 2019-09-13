//
//  ViewController.swift
//  MemeMe
//
//  Created by Ali Alawami on 13/09/2019.
//  Copyright © 2019 Ali Alawami. All rights reserved.
//

import UIKit

class MemeMeViewController: UIViewController {
    
    
    //MARK: Lables
    lazy var topTextField: UITextField = {
        let text = UITextField()
        text.textAlignment = .center
        text.text = "ToP".uppercased()
        text.defaultTextAttributes = [:]
        text.textColor = .white
        text.delegate = self
        
        
        text.translatesAutoresizingMaskIntoConstraints = false
        
        return text
    }()
    
    lazy var bottomTextField: UITextField = {
        let text = UITextField()
        text.textAlignment = .center
        text.text = "Bottom".uppercased()
        text.textColor = .white
        text.delegate = self
        
        
        text.translatesAutoresizingMaskIntoConstraints = false
        
        return text
    }()

    
    //MARK: ToolBar
    lazy var toolbar:UIToolbar = {
        let bar = UIToolbar()
        
        let flex = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let imagePicker = self.imagePicker
        let camera = self.cameraButton

        bar.setItems([flex, camera , flex, imagePicker , flex], animated: true)
        bar.barStyle = UIBarStyle.default
        bar.contentMode = UIView.ContentMode.center
        bar.translatesAutoresizingMaskIntoConstraints = false
        return bar
    }()
    
    //MARK: Barbuttons
    lazy var imagePicker:UIBarButtonItem = {
        let picker = UIBarButtonItem(title: "Album", style: UIBarButtonItem.Style.plain, target: self, action: #selector(displayImagePicker(_:)))
        picker.tag = 100
        return picker
    }()
    
    lazy var cameraButton: UIBarButtonItem = {
        let picker = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.camera, target: self, action: #selector(displayImagePicker(_:)))
        picker.tag = 101
        return picker
    }()
    
    
    lazy var cancelButton: UIBarButtonItem = {
        let barButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.cancel, target: self, action: #selector(cancelMeme))
        barButton.tag = 200
        return barButton
    }()
    
    lazy var shareButton: UIBarButtonItem = {
        let barButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.action, target: self, action: #selector(shareMeme))
        barButton.tag = 201
        return barButton
    }()
    
    
    lazy var imageDisplayer:UIImageView = {
        let displayImage = UIImageView()
        displayImage.contentMode = UIView.ContentMode.scaleAspectFit
        displayImage.backgroundColor = .black
        displayImage.translatesAutoresizingMaskIntoConstraints = false
        return displayImage
    }()
    
    
    
    
    

    //MARK:LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        
        self.customNavigation()
        setupSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
    }
    
    
    
    //MARK: ViewSetup
    func setupSubviews(){
        self.setupToolBar()
        self.setupImageDisplayer()
        self.setupTextFields()
        
    }
    
    
    func setupToolBar(){
        self.view.addSubview(toolbar)
        
        let margin = self.view.layoutMarginsGuide
        self.toolbar.bottomAnchor.constraint(equalTo: margin.bottomAnchor).isActive = true
        self.toolbar.centerXAnchor.constraint(equalTo: margin.centerXAnchor).isActive = true
        self.toolbar.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        self.toolbar.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
    }
    
    
    
    func setupImageDisplayer() {
        self.view.addSubview(imageDisplayer)
        
        let margins = self.view.layoutMarginsGuide
        self.imageDisplayer.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        self.imageDisplayer.bottomAnchor.constraint(equalTo: self.toolbar.topAnchor).isActive = true
        self.imageDisplayer.rightAnchor.constraint(equalTo: margins.rightAnchor).isActive = true
        self.imageDisplayer.leftAnchor.constraint(equalTo: margins.leftAnchor).isActive = true
        
        
    }
    
    func setupTextFields(){
        self.view.addSubview(topTextField)
        self.view.addSubview(bottomTextField)
        
        let margins = self.imageDisplayer
        self.topTextField.topAnchor.constraint(equalToSystemSpacingBelow: margins.topAnchor, multiplier: 4).isActive = true
        self.topTextField.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        
        
        margins.bottomAnchor.constraint(equalToSystemSpacingBelow: self.bottomTextField.bottomAnchor, multiplier: 4).isActive = true
        self.bottomTextField.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        
    }
    
    
    
    
    
   

    
    


}



extension MemeMeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        DispatchQueue.global().async {
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
                DispatchQueue.main.async {
                    self.imageDisplayer.image = image
                    self.dismiss(animated: true, completion: nil)
                }
                
            }
        }
        
    }
}


