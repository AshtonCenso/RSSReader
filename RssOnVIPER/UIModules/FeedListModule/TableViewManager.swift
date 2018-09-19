//
//  TableViewManager.swift
//  RssOnVIPER
//
//  Created by Anton Tsykanov on 18.09.2018.
//  Copyright © 2018 Anton Tsykanov. All rights reserved.
//

import UIKit

class TableViewManager: NSObject, UITableViewDelegate, UITableViewDataSource {
    private var data: [Int] = []
    
    init(data: [Int]) {
        self.data = data
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath as IndexPath)
        cell.selectionStyle = .none
        cell.textLabel?.text = "someNewTextFromCustomClass + \(data[indexPath.row])"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("TableViewManager.swift")
    }

}
