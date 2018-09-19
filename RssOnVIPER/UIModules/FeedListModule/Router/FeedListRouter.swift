//
//  FeedListRouter.swift
//  RssOnVIPER
//
//  Created by Anton Tsykanov on 10.09.2018.
//  Copyright © 2018 Anton Tsykanov. All rights reserved.
//

import UIKit

class FeedListRouter {

    class func prepareModule() -> UIViewController {
        let view = FeedListViewController()
        let presenter = FeedListPresenter(withView: view, withRouter: view)

        view.presenter = presenter
//        view.tableViewCustom = TableViewManager(data: [])
//        view.postListTableView = UITableView()
        return view
    }
    
//    func openDetails(item: FeedVM) {
//        print("12378651897236498176239487123")
//    }
}

//class Router {
//    func prepareModule() -> UIViewController {
//        // создание экземпляров
//        let view = UIViewController()
//        let presenter = Presenter()
//        let interactor = Interactor()
//
//        // сетап зависимостей
//        view.presenter = presenter
//        interactor.presenter = presenter
//        presenter.view = view
//        presenter.interactor = interactor
//        presenter.router = self
//
//        return view
//    }
//}
