//
//  FeedListViewController.swift
//  RssOnVIPER
//
//  Created by Anton Tsykanov on 10.09.2018.
//  Copyright © 2018 Anton Tsykanov. All rights reserved.
//

import UIKit

class FeedListViewController: UIViewController, FeedListViewProtocol, FeedListRouterProtocol {
    
//    lazy var presenter: FeedListPresenter = FeedListPresenter(withView: self, withRouter: self)
    @IBOutlet var postListTableView: UITableView!
    var tableViewCustom: TableViewManager = TableViewManager(data: [])
    var presenter: FeedListPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postListTableView.delegate = tableViewCustom
        postListTableView.dataSource = tableViewCustom
        
        presenter?.onViewLoaded()
    }
    
    // MARK: FeedListViewProtocol
    func showLoading() {
        print(#function)
    }
    
    func hideLoading() {
        print("hideLoading FeedListViewController")
    }
    
    func showData(data: [FeedVM]) {
        print("showData FeedListViewController")
        let data2 = [1, 2, 3, 4] //only for test custom TableView class
        tableViewCustom = TableViewManager(data: data2)
        postListTableView.reloadData()
    }
    
    // MARK: FeedListRouterProtocol
    func openDetails(item: FeedVM) {
        print("OpenDetails FeedListViewController")
    }
}
