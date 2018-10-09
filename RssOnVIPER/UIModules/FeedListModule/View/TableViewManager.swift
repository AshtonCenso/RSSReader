//
//  TableViewManager.swift
//  RssOnVIPER
//
//  Created by Anton Tsykanov on 18.09.2018.
//  Copyright © 2018 Anton Tsykanov. All rights reserved.
//

import UIKit

final class TableViewManager: NSObject, UITableViewDelegate, UITableViewDataSource {
    var data: [FeedVM] = []
    var didSelectRow: ((_ dataItem: FeedVM) -> Void)?

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as? FeedCustomTableViewCell
            else {
                fatalError("Cell doesn't exist")
        }
        
        cell.selectionStyle = .none
        cell.configure(config: data[indexPath.row])

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dataItem = data[indexPath.row]

        didSelectRow?(dataItem)
    }
}
