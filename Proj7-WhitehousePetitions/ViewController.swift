//
//  ViewController.swift
//  Proj7-WhitehousePetitions
//
//  Created by Sain-R Edwards Jr. on 7/12/18.
//  Copyright © 2018 Swift Koding 4 Everyone. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var petitions = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TABLE_VIEW_CELL, for: indexPath)
        cell.textLabel?.text = "Title goes here"
        cell.detailTextLabel?.text = "Subtitle goes here"
        return cell
    }
}

