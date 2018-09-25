//
//  FeedListViewController.swift
//  RssOnVIPER
//
//  Created by Anton Tsykanov on 10.09.2018.
//  Copyright © 2018 Anton Tsykanov. All rights reserved.
//

import UIKit

final class FeedListViewController: UIViewController, FeedListPresenterToViewProtocol, Injectable {

    @IBOutlet var postListTableView: UITableView!
    private var presenter: FeedListPresenter!
    private var tableViewManager: TableViewManager!

    struct Dependencies {
        let presenter: FeedListPresenter
        let tableViewCustom: TableViewManager
    }

    func inject(dependencies: FeedListViewController.Dependencies) {
        presenter = dependencies.presenter
        tableViewManager = dependencies.tableViewCustom
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        postListTableView.delegate = tableViewManager
        postListTableView.dataSource = tableViewManager
        tableViewManager.didSelectRow = didSelectRow
        presenter.onViewLoaded()
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
        presenter.openDetails(item: dataItem)
    }
}
