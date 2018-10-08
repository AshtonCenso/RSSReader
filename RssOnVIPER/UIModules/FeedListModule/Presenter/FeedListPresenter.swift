//
//  FeedListPresenter.swift
//  RssOnVIPER
//
//  Created by Anton Tsykanov on 10.09.2018.
//  Copyright © 2018 Anton Tsykanov. All rights reserved.
//

final class FeedListPresenter: FeedListInteractorToPresenterProtocol, FeedListPresenterToRouterProtocol, Injectable {

    private weak var view: FeedListPresenterToViewProtocol?
    private var router: FeedListPresenterToRouterProtocol?
    private var loadFeedInteractor: FeedListPresenterToInteractorProtocol?

    struct Dependencies {
        let view: FeedListPresenterToViewProtocol
        let router: FeedListPresenterToRouterProtocol
        let loadFeedInteractor: FeedListPresenterToInteractorProtocol
    }

    func inject(dependencies: FeedListPresenter.Dependencies) {
        view = dependencies.view
        router = dependencies.router
        loadFeedInteractor = dependencies.loadFeedInteractor
    }

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
