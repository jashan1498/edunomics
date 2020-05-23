//
//  ViewController.swift
//  edunomics
//
//  Created by jashan on 23/05/20.
//  Copyright © 2020 jashan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var signUpBtn: UIButton!
    
    @IBOutlet weak var signInBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signInBtn.backgroundColor = .systemGreen
        signInBtn.layer.cornerRadius = 10
        signInBtn.setTitleColor(.white, for: .normal)
        
        signUpBtn.backgroundColor = .systemGreen
        signUpBtn.layer.cornerRadius = 10
        signUpBtn.setTitleColor(.white, for: .normal)
        
    }
    
    
}

