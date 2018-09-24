//
//  FeedListViewController.swift
//  RssOnVIPER
//
//  Created by Anton Tsykanov on 10.09.2018.
//  Copyright © 2018 Anton Tsykanov. All rights reserved.
//

import UIKit

class FeedListViewController: UIViewController, FeedListPresenterToViewProtocol, Injectable {

    @IBOutlet var postListTableView: UITableView!
    var presenter: FeedListPresenter?
    var tableViewCustom: TableViewManager?

    struct Dependencies {
        var presenter: FeedListPresenter?
        var tableViewCustom: TableViewManager?
    }
    
    func inject(dependencies: FeedListViewController.Dependencies) {
        presenter = dependencies.presenter
        tableViewCustom = dependencies.tableViewCustom
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postListTableView.delegate = tableViewCustom
        postListTableView.dataSource = tableViewCustom
        tableViewCustom?.didSelectRow = didSelectRow
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
        postListTableView.reloadData()
    }

    func didSelectRow(dataItem: FeedVM) {
        presenter?.openDetails(item: dataItem)
    }
}
