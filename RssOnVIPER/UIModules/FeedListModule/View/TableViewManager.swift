//
//  TableViewManager.swift
//  RssOnVIPER
//
//  Created by Anton Tsykanov on 18.09.2018.
//  Copyright © 2018 Anton Tsykanov. All rights reserved.
//

import UIKit

final class TableViewManager: NSObject, UITableViewDelegate, UITableViewDataSource {
    private var data: [FeedVM]
    var didSelectRow: ((_ dataItem: FeedVM) -> Void)?

    init(data: [FeedVM]) {
        self.data = data
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! FeedCustomTableViewCell
        cell.selectionStyle = .none
        cell.set(forPost: data[indexPath.row])

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dataItem = data[indexPath.row]
        if let didSelectRow = didSelectRow {
            didSelectRow(dataItem)
        }
    }
}
