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
    private var interactor: FeedListPresenterToInteractorProtocol?

    private var feed: [FeedVM] = []
}

// MARK: - Injectable

extension FeedListPresenter {
    struct Dependencies {
        let view: FeedListPresenterToViewProtocol
        let router: FeedListPresenterToRouterProtocol
        let loadFeedInteractor: FeedListPresenterToInteractorProtocol
    }

    func inject(dependencies: FeedListPresenter.Dependencies) {
        view = dependencies.view
        router = dependencies.router
        interactor = dependencies.loadFeedInteractor
    }

}

// MARK: - FeedListPresenterToRouterProtocol

extension FeedListPresenter {
    func openDetails(item: FeedVM) {
        router?.openDetails(item: item)
    }
}

// MARK: - FeedListInteractorToPresenterProtocol

extension FeedListPresenter {
    func onViewLoaded() {
        view?.showLoading()

        interactor?.getFeeds { (result) in
            result.onSuccess {
                view?.hideLoading()
                view?.showData(data: $0)
            }
        }
    }
}
