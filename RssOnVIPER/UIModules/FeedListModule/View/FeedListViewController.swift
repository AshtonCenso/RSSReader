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

    override func viewDidLoad() {
        super.viewDidLoad()
        postListTableView.delegate = tableViewManager
        postListTableView.dataSource = tableViewManager
        tableViewManager.didSelectRow = didSelectRow

        presenter.onViewLoaded()
    }
}

// MARK: - Actions

extension FeedListViewController {
    func didSelectRow(dataItem: FeedVM) {
        presenter.openDetails(item: dataItem)
    }
}

// MARK: - Injectable

extension FeedListViewController {
    struct Dependencies {
        let presenter: FeedListPresenter
        let tableViewCustom: TableViewManager
    }

    func inject(dependencies: FeedListViewController.Dependencies) {
        presenter = dependencies.presenter
        tableViewManager = dependencies.tableViewCustom
    }
}

// MARK: - FeedListPresenterToViewProtocol

extension FeedListViewController {
    func showLoading() {
        print(#function)
    }

    func hideLoading() {
        print(#function)
    }

    func showData(data: [FeedVM]) {
        tableViewManager.data = data

        postListTableView.reloadData()
    }
}
