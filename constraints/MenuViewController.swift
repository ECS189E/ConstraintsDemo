//
//  MenuViewController.swift
//  constrains
//
//  Created by Zhiyi Xu on 10/12/18.
//  Copyright © 2018 Zhiyi Xu. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var viewTitle: UILabel!
    @IBOutlet weak var menu: UITableView!
    @IBOutlet weak var betweenTitleAndTable: NSLayoutConstraint!
    
    // How to initialize a dict with String key and String value
    var tableData = [String: String]()
    
    // How to initialize an array of String
    var dataKeys = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViewTitle()
        dataInit()
        layoutInit()
    }
    
    func updateViewTitle() {
        // This shows you the situation that if you want to customized the "return"
        viewTitle.numberOfLines = 4
        viewTitle.text = "About Constraints \n\n (the constrains of this label is a combine of fixed pixel constriants and ratio constriants.)"
    }
    
    func dataInit() {
        tableData["Fixed"] = "Example of setting fixed pixel contraints"
        tableData["Ratio"] = "Example of setting contraints of centerX, centerY, equal width/height"
        tableData["UIStackView"] = "Example of a stack view that contains three buttons"
        tableData["Customized Keyboard"] = "Example of a customized keyboard that is implemented by collection view"
        
        // Keep the keys in an array and sort them
        // So that the order of the cells will always be the same
        dataKeys = Array(tableData.keys).sorted()
    }
    
    func layoutInit() {
        // How to change constraint during runtime
        // Can be used if you can only calculate the constraint during runtime
        betweenTitleAndTable.constant = 100
    }
    
    // UITableViewDataSource
    // Number of cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    // UITableViewDataSource
    // Set each cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Remember to change the identifier on storyboard too.
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath)
        
        // The cell is set to "subtitle".
        // Use the storyboard, choose the menuCell, change the "style" using right panel.
        let currentKey = dataKeys[indexPath.row]
        tableCell.textLabel?.text = currentKey
        tableCell.detailTextLabel?.text = tableData[currentKey]
        
        return tableCell
    }
    
    // UITableViewDelegate
    // Cell on tap
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Select the segue on storyboard, check out the identifier in "attributes" on right panel.
        performSegue(withIdentifier: "segue" + dataKeys[indexPath.row], sender: self)
    }
}
