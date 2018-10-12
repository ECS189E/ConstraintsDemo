//
//  ViewController.swift
//  constrains
//
//  Created by Zhiyi Xu on 10/12/18.
//  Copyright © 2018 Zhiyi Xu. All rights reserved.
//

import UIKit

// Customized cell
// Many kinds of objects can be added to it. e.g. UIImageView.
// But make sure you handle the constriants right.
class keyboardCell: UICollectionViewCell {
    @IBOutlet weak var cellLabel: UILabel!
}

class CollectionViewController: UIViewController, UICollectionViewDataSource {
    
    @IBOutlet weak var keyboard: UICollectionView!
    
    var data = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "Submit", "0", "Delete"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // This is the only other situation that I use "!".
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! keyboardCell
        cell.cellLabel.text = data[indexPath.row]
        
        // For color
        /* https://www.ralfebert.de/ios-examples/uikit/swift-uicolor-picker/ */
        if data[indexPath.row] == "Submit" {
            cell.cellLabel.backgroundColor = UIColor(red: 0.2824, green: 0.7373, blue: 0, alpha: 1.0)
        }
        if data[indexPath.row] == "Delete" {
            cell.cellLabel.backgroundColor = UIColor(red: 0.8784, green: 0, blue: 0, alpha: 1.0)
        }
        
        return cell
    }
}

