//
//  FeedListRouter.swift
//  RssOnVIPER
//
//  Created by Anton Tsykanov on 10.09.2018.
//  Copyright © 2018 Anton Tsykanov. All rights reserved.
//

import UIKit

final class FeedListRouter: FeedListPresenterToRouterProtocol {

     func prepareModule() -> UIViewController {
        guard let viewController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FeedListVC") as? FeedListViewController
            else {
                return UIViewController()
        }
        let presenter: FeedListPresenter = FeedListPresenter()
        let interactor: FeedListInteractor = FeedListInteractor()
        let router: FeedListRouter = FeedListRouter()

        viewController.inject(dependencies: FeedListViewController.Dependencies(presenter: presenter, tableViewCustom: TableViewManager(data: interactor.tempFuncForRouter())))
        viewController.postListTableView = UITableView()
        presenter.inject(dependencies: FeedListPresenter.Dependencies(view: viewController, router: router, loadFeedInteractor: interactor))
        interactor.inject(dependencies: FeedListInteractor.Dependencies(presenter: presenter))

        return viewController
    }

    func openDetails(item: FeedVM) {
        print("routerOpen + \(item)")
    }
}
