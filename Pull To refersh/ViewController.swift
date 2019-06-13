//
//  ViewController.swift
//  Pull To refersh
//
//  Created by Nitin Bhatia on 10/06/19.
//  Copyright © 2019 Nitin Bhatia. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tbl: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let refreshCtrl = UIRefreshControl(frame: CGRect(x: 0, y: 0, width: tbl.frame.width, height: 50))
        refreshCtrl.addTarget(self, action: #selector(refreshData(_:)), for: .allEvents)
        tbl.refreshControl = refreshCtrl
       
        
        // Add Refresh Control to Table View
        if #available(iOS 10.0, *) {
            tbl.refreshControl = refreshCtrl
        } else {
            tbl.addSubview(refreshCtrl)
        }
        
        refreshCtrl.tintColor = UIColor(red:0.25, green:0.72, blue:0.85, alpha:1.0)
        refreshCtrl.attributedTitle = NSAttributedString(string: "Fetching Weather Data ...", attributes: nil)
        
        
    }
    
    @objc func refreshData(_ sender: UIRefreshControl) {
        tbl.reloadData()
        
        //call below function to stop refreshing, if you calling data from api then call below function accordingly
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            // your code here
            sender.endRefreshing()

        }
    }


    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel!.text = "hello \(indexPath.row)"
        return cell
    }
    
    
}

