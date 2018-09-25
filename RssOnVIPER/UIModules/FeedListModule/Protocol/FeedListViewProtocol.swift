//
//  FeedListViewProtocol.swift
//  RssOnVIPER
//
//  Created by Anton Tsykanov on 11.09.2018.
//  Copyright © 2018 Anton Tsykanov. All rights reserved.
//

// MARK: View <-> Presenter Protocols
protocol FeedListPresenterToViewProtocol {
    func showLoading()
    func hideLoading()
    func showData(data: [FeedVM])
}

protocol FeedListViewToPresenterProtocol {
    func openFeedDetail() -> FeedVM
}

// MARK: Presenter <-> Interactor Protocols
protocol FeedListPresenterToInteractorProtocol {
    func loadFeed()
    func tempFuncForRouter() -> [FeedVM]
}

protocol FeedListInteractorToPresenterProtocol {
    func loadedFeeds(feeds: [FeedVM])
}

// MARK: Presenter <-> Router Protocols
protocol FeedListPresenterToRouterProtocol {
    func openDetails(item: FeedVM)
}

protocol FeedsDataSource {
    func getFeeds()
}
