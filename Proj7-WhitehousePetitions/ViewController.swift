//
//  ViewController.swift
//  Proj7-WhitehousePetitions
//
//  Created by Sain-R Edwards Jr. on 7/12/18.
//  Copyright © 2018 Swift Koding 4 Everyone. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var petitions = [[String: String]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Points to the Whitehouse.gov server, accessing petitions
        let urlString = "https://api.whitehouse.gov/v1/petitions.json?limit=100"
        
        // Use if let to make sure URL is valid
        if let url = URL(string: urlString) {
            // Created a string object using 'contentsOf' method
            if let data = try? String(contentsOf: url) {
                // If String object created successfully, create a new JSON object from it. This is SwiftyJSON structure
                let json = JSON(parseJSON: data)
                
                if json["metadata"]["responseInfo"]["status"].intValue == 200 {
                    parse(json: json)
                }
            }
        }
        
    }
    
    func parse(json: JSON) {
        for result in json["results"].arrayValue {
            let title = result["title"].stringValue
            let body = result["body"].stringValue
            let sigs = result["signatureCount"].stringValue
            let obj = ["title": title, "body": body, "sigs": sigs]
            petitions.append(obj)
        }
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TABLE_VIEW_CELL, for: indexPath)
        let petition = petitions[indexPath.row]
        cell.textLabel?.text = petition["title"]
        cell.detailTextLabel?.text = petition["body"]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailVC()
        vc.detailItem = petitions[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}













