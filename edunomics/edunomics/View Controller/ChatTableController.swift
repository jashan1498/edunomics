//
//  ChatTableController.swift
//  edunomics
//
//  Created by jashan on 23/05/20.
//  Copyright © 2020 jashan. All rights reserved.
//

import UIKit


extension ChatTabVc : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell  = tableView.dequeueReusableCell(withIdentifier: "ChatItemCell", for: indexPath) as? ChatViewCell  else {
                   
                   fatalError("unable to dequeue cell")
               
               }
        cell.profileImage.image = UIImage(named:"profile\(indexPath.row)")
        cell.profileImage.setRounded()
               return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

}


extension UIImageView{
    func setRounded() {
        let radius = self.frame.width / 2
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
}
