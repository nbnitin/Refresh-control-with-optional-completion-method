//
//  ViewController2.swift
//  Pull To refersh
//
//  Created by Nitin Bhatia on 10/06/19.
//  Copyright © 2019 Nitin Bhatia. All rights reserved.
//

import UIKit

class ViewController2: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    @IBOutlet weak var collView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let refreshCtrl = UIRefreshControl(frame: CGRect(x: 0, y: 0, width: collView.frame.width, height: 50))
        refreshCtrl.addTarget(self, action: #selector(refreshData(_:)), for: .allEvents)
        collView.refreshControl = refreshCtrl
        
        
       
        
        refreshCtrl.tintColor = UIColor(red:0.25, green:0.72, blue:0.85, alpha:1.0)
        refreshCtrl.attributedTitle = NSAttributedString(string: "Fetching Weather Data ...", attributes: nil)

    }
    
    @objc func refreshData(_ sender: UIRefreshControl) {
        collView.reloadData()
        
        //call below function to stop refreshing, if you calling data from api then call below function accordingly
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            // your code here
            self.callApi(completionHandler: {(finished) in
                sender.endRefreshing()
            })
            
        }
    }
    

    

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.lblTitle.text = "hello \(indexPath.row)"
        
        if ( indexPath.row % 2 == 0 ) {
            cell.contentView.backgroundColor =  UIColor.init(red: 243/255, green: 237/255, blue: 237/255, alpha: 1.0)
        } else {
            cell.contentView.backgroundColor = UIColor.init(red: 240/255, green: 248/255, blue: 255/255, alpha: 1.0)
        }
        return cell
    }
    
   
    func callApi(completionHandler : @escaping (_ finished:Bool)->Void = {_ in }){
        completionHandler(true)
    }

}
