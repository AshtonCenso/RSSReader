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
        let controller = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "TabBarController")
        let view = controller.childViewControllers.first as! FeedListViewController
        let presenter: FeedListPresenter = FeedListPresenter()
        let interactor: FeedListInteractor = FeedListInteractor()
        let router: FeedListRouter = FeedListRouter()


        view.presenter = presenter
        view.tableViewCustom = TableViewManager(data: interactor.tempFuncForRouter()) // не нашел как решить по другому
        view.postListTableView = UITableView()
        presenter.loadFeedInteractor = interactor
        presenter.router = router
        presenter.view = view
        interactor.presenter = presenter

        return view
    }

    func openDetails(item: FeedVM) {
        print("routerOpen + \(item)")
    }
}
