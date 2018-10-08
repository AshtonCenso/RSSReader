//
//  FeedListInteractor.swift
//  RssOnVIPER
//
//  Created by Anton Tsykanov on 10.09.2018.
//  Copyright © 2018 Anton Tsykanov. All rights reserved.
//

import Foundation


final class FeedListInteractor: FeedListPresenterToInteractorProtocol, Injectable {

    private var presenter: FeedListInteractorToPresenterProtocol?
    private var fakeService: FakeFeedDataSource?

    struct Dependencies {
        let presenter: FeedListInteractorToPresenterProtocol
        let fakeService: FakeFeedDataSource

    }

    func inject(dependencies: FeedListInteractor.Dependencies) {
        presenter = dependencies.presenter
        fakeService = dependencies.fakeService
    }

    func loadFeed() {
        presenter?.loadedFeeds(feeds: (fakeService?.loadFakeData())!)
    }

    func tempFuncForRouter() -> [FeedVM] {
        return (fakeService?.loadFakeData())!
    }
}
