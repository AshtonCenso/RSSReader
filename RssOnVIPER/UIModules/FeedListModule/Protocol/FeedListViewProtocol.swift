//
//  FeedListViewProtocol.swift
//  RssOnVIPER
//
//  Created by Anton Tsykanov on 11.09.2018.
//  Copyright © 2018 Anton Tsykanov. All rights reserved.
//

// MARK: View <-> Presenter Protocols
protocol FeedListPresenterToViewProtocol: class where Self: FeedListViewController {
    func showLoading()
    func hideLoading()
    func showData(data: [FeedVM])
}

protocol FeedListViewToPresenterProtocol {
    func openFeedDetail() -> FeedVM
}

// MARK: Presenter <-> Interactor Protocols
protocol FeedListPresenterToInteractorProtocol {
    func getFeeds(completion: (Result<[FeedVM]>) -> Void)
}

protocol FeedListInteractorToPresenterProtocol {
}

// MARK: Presenter <-> Router Protocols
protocol FeedListPresenterToRouterProtocol {
    func openDetails(item: FeedVM)
}

