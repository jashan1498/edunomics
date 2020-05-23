//
//  ChatTabVc.swift
//  edunomics
//
//  Created by jashan on 23/05/20.
//  Copyright © 2020 jashan. All rights reserved.
//
import UIKit

class ChatTabVc: UIViewController {
  


    
    @IBOutlet weak var chatTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()      
        chatTableView.delegate = self
        chatTableView.dataSource = self
        
    }

}

