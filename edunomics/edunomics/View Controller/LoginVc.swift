//
//  LoginVc.swift
//  edunomics
//
//  Created by jashan on 23/05/20.
//  Copyright © 2020 jashan. All rights reserved.
//

import UIKit

class LoginVc: UIViewController {

    @IBOutlet weak var submitBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        submitBtn.backgroundColor = .systemGreen
           submitBtn.layer.cornerRadius = 10
           submitBtn.setTitleColor(.white, for: .normal)
        
    }


}
