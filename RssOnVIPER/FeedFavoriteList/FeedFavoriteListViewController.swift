//
//  FeedFavoriteListViewController.swift
//  RssOnVIPER
//
//  Created by Anton Tsykanov on 11.09.2018.
//  Copyright © 2018 Anton Tsykanov. All rights reserved.
//

import UIKit

class FeedFavoriteListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, FeedFavoriteListViewProtocol {

    private var presenter:FeedFavoriteListPresenter = FeedFavoriteListPresenter(withView: self as! FeedFavoriteListViewProtocol, withRouter: self as! FeedFavoriteListRouter)
    
    var activity:CustomActivity = CustomActivity()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.onViewLoaded()
    }
    
    func showLoading() {
        activity.initActivity(start: true, view: self.view)
        print("showLoading")
    }
    
    func hideLoading() {
        activity.initActivity(start: false, view: self.view)
        print("hideLoading")
    }
    
    func showData(data: [FeedListFavoriteEntity]) {
        print("showData")
    }
    
    // MARK: TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell2", for: indexPath as IndexPath)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.onItemClicked(position: indexPath.row)
    }
}
