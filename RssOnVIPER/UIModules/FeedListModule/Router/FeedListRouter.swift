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
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "FeedListVC") as? FeedListViewController else {
                fatalError("Can't load view controller")
        }
        
        let presenter: FeedListPresenter = FeedListPresenter()
        let interactor: FeedListInteractor = FeedListInteractor()
        let feedService: FeedDataSource = FakeFeedDataSource()

        interactor.inject(dependencies: FeedListInteractor.Dependencies(presenter: presenter, feedService: feedService))
        viewController.inject(dependencies: FeedListViewController.Dependencies(
                             presenter: presenter, tableViewCustom: TableViewManager()))
        presenter.inject(dependencies: FeedListPresenter.Dependencies(view: viewController, router: self, loadFeedInteractor: interactor))

        return viewController
    }

    func openDetails(item: FeedVM) {
        print("routerOpen + \(item)")
    }
}
