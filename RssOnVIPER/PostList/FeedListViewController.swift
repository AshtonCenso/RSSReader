//
//  FeedListViewController.swift
//  RssOnVIPER
//
//  Created by Anton Tsykanov on 10.09.2018.
//  Copyright © 2018 Anton Tsykanov. All rights reserved.
//

import UIKit

class FeedListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, FeedListViewProtocol, FeedListRouterProtocol {
   
    private var presenter: FeedListPresenter = FeedListPresenter(withView: self as! FeedListViewProtocol, withRouter: self as! FeedListRouterProtocol)
    var activity:CustomActivity = CustomActivity() // TEST IT
    
    @IBOutlet var postListTableView: UITableView!
    
    var feedList:[FeedListEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.onViewLoaded()
    }
    
    // MARK: FeedListViewProtocol
    func showLoading() {
        activity.initActivity(start: true, view: self.view)
//        self.initActivity(start: true)
    }
    
    func hideLoading() {
        activity.initActivity(start: false, view: self.view)
//        self.initActivity(start: false)
    }
    
    func showData(data: Array<FeedListEntity>) {
        feedList = data
        postListTableView.reloadData()
    }
    
    // MARK: FeedListRouterProtocol
    func openDetails(item: FeedListEntity) {
        print("OpenDetails FeedListViewController")
    }
    
    // MARK: Activity
//    func initActivity(start: Bool) {
//        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
//        activityIndicator.frame = view.bounds
//        activityIndicator.startAnimating()
//
//        if (start) {
//            view.addSubview(activityIndicator)
//        }
//        else {
//            activityIndicator.removeFromSuperview()
//        }
//    }
    
    // MARK: TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedList.count
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
