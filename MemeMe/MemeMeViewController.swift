//
//  ViewController.swift
//  MemeMe
//
//  Created by Ali Alawami on 13/09/2019.
//  Copyright © 2019 Ali Alawami. All rights reserved.
//

import Foundation
import UIKit

class MemeMeViewController: UIViewController {
    
    
    
    //MARK: Properties
    
    let memeTextAttributes: [NSAttributedString.Key: Any] = [
        NSAttributedString.Key.strokeColor: UIColor.black,
        NSAttributedString.Key.foregroundColor: UIColor.white,
        NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
        NSAttributedString.Key.strokeWidth:  -1
    ]
    

    
    //MARK: Lables
    lazy var topTextField: UITextField = {
        let text = UITextField()
        text.text = "Top".uppercased()
        text.tag = 500
        text.textAlignment = .center
        text.defaultTextAttributes = self.memeTextAttributes
        text.autocapitalizationType = UITextAutocapitalizationType.allCharacters
        
        text.delegate = self
        
        text.translatesAutoresizingMaskIntoConstraints = false
        
        return text
    }()
    
    lazy var bottomTextField: UITextField = {
        let text = UITextField()
        text.text = "Bottom".uppercased()
        text.tag = 501
        text.textAlignment = .center
        text.defaultTextAttributes = self.memeTextAttributes
        text.autocapitalizationType = UITextAutocapitalizationType.allCharacters
        
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
        barButton.isEnabled = false
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
        self.keyboardNotification()
        
    
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.keyboardNoificationDismiss()
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
        self.imageDisplayer.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        self.imageDisplayer.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        
        
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




