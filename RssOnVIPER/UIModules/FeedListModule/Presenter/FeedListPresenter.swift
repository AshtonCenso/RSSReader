//
//  FeedListPresenter.swift
//  RssOnVIPER
//
//  Created by Anton Tsykanov on 10.09.2018.
//  Copyright © 2018 Anton Tsykanov. All rights reserved.
//

final class FeedListPresenter: FeedListInteractorToPresenterProtocol, FeedListPresenterToRouterProtocol {


    var view: FeedListPresenterToViewProtocol?
    var router: FeedListPresenterToRouterProtocol?
    var loadFeedInteractor: FeedListPresenterToInteractorProtocol?
    private var feed: [FeedVM] = []

    func onViewLoaded() {
        view?.showLoading()
        loadFeedInteractor?.loadFeed()
    }

    func loadedFeeds(feeds: [FeedVM]) {
        view?.hideLoading()
        view?.showData(data: feeds)
    }

    func openDetails(item: FeedVM) {
        router?.openDetails(item: item)
    }
}
