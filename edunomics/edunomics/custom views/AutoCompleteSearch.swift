//
//  AutoCompleteSearch.swift
//  edunomics
//
//  Created by jashan on 23/05/20.
//  Copyright © 2020 jashan. All rights reserved.
//

import UIKit

class AutoCompleteSeach : UITextField{
    var resultsView : UITableView? = nil;
    var dataList : [User]  = []
    var resultsList : [String]  = []
    
    
    override func willMove(toWindow newWindow: UIWindow?) {
        super.willMove(toWindow: newWindow)
        resultsView?.removeFromSuperview()
    }
    
    override open func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        
        self.addTarget(self, action: #selector(AutoCompleteSeach.textFieldDidChange), for: .editingChanged)
    }
    
    @objc open func textFieldDidChange(){
        filterSearch()
        updateSearchTableView()
        resultsView?.isHidden = false
    }
    
    override open func layoutSubviews() {
         super.layoutSubviews()
         buildSearchTableView()
         
     }
    
    func filterSearch(){
        resultsList = []
        let queryString :String = self.text!
        for user in dataList {
            if  user.name.starts(with : queryString){
                resultsList.append(user.name)
            }
        }
        resultsView?.reloadData()
    }
}


extension AutoCompleteSeach : UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "simpleTextCell", for: indexPath)
        
        cell.backgroundColor = UIColor.clear
        cell.textLabel?.text = resultsList[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let index = tableView.indexPathForSelectedRow
        guard let cell = tableView.cellForRow(at: index!) else{
            fatalError("index exception")
        }
        
        let text = cell.textLabel?.text
        self.text = text
        resultsList.removeAll()
        tableView.reloadData()
        
    }
    
    func updateSearchTableView() {
        
        if let resultsView = resultsView {
            superview?.bringSubviewToFront(resultsView)
            var tableHeight: CGFloat = 0
            tableHeight = resultsView.contentSize.height
            
            if tableHeight < resultsView.contentSize.height {
                tableHeight -= 10
            }
            
            var tableViewFrame = CGRect(x: 0, y: 0, width: frame.size.width - 4, height: tableHeight)
            tableViewFrame.origin = self.convert(tableViewFrame.origin, to: nil)
            tableViewFrame.origin.x += 2
            tableViewFrame.origin.y += frame.size.height + 2
            UIView.animate(withDuration: 0.2, animations: { [weak self] in
                self?.resultsView?.frame = tableViewFrame
            })
            
            resultsView.layer.masksToBounds = true
            resultsView.separatorInset = UIEdgeInsets.zero
            resultsView.layer.cornerRadius = 5.0
            resultsView.separatorColor = UIColor.lightGray
            resultsView.backgroundColor = UIColor.white.withAlphaComponent(0.4)
            
            if self.isFirstResponder {
                superview?.bringSubviewToFront(self)
            }
            
            resultsView.reloadData()
        }
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func buildSearchTableView() {
        
        if let resultsView = resultsView {
            resultsView.register(UITableViewCell.self, forCellReuseIdentifier: "simpleTextCell")
            resultsView.delegate = self
            resultsView.dataSource = self
            self.window?.addSubview(resultsView)
            
        } else {
            dummyData()
            resultsView = UITableView(frame: CGRect.zero)
        }
        
        updateSearchTableView()
    }
    

    
    
    func dummyData(){
        let a = User(name: "jashan")
        let b = User(name: "rahul")
        let c = User(name: "aisha")
        let d = User(name: "vinod")
        let e = User(name: "deepak")
        
        dataList.append(a)
        dataList.append(b)
        dataList.append(c)
        dataList.append(d)
        dataList.append(e)
    }
    
}
