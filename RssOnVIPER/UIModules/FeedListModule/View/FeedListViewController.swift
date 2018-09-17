//
//  FeedListViewController.swift
//  RssOnVIPER
//
//  Created by Anton Tsykanov on 10.09.2018.
//  Copyright © 2018 Anton Tsykanov. All rights reserved.
//

import UIKit

class FeedListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, FeedListViewProtocol, FeedListRouterProtocol {

    private lazy var presenter: FeedListPresenter = FeedListPresenter(withView: self, withRouter: self)
    
    @IBOutlet var postListTableView: UITableView!
    
    var feedList:[FeedVM] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.onViewLoaded()
    }
    
    // MARK: FeedListViewProtocol
    func showLoading() {
        print("showLoading FeedListViewController")
    }
    
    func hideLoading() {
        print("hideLoading FeedListViewController")
    }
    
    func showData(data: [FeedVM]) {
        feedList = data
        postListTableView.reloadData()
    }
    
    // MARK: FeedListRouterProtocol
    func openDetails(item: FeedVM) {
        print("OpenDetails FeedListViewController")
    }
    
    // MARK: TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return feedList.count
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath as IndexPath)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.onItemClicked(position: indexPath.row)
    }
    
}
