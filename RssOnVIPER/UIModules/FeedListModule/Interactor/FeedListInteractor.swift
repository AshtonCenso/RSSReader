//
//  FeedListInteractor.swift
//  RssOnVIPER
//
//  Created by Anton Tsykanov on 10.09.2018.
//  Copyright © 2018 Anton Tsykanov. All rights reserved.
//

import Foundation


final class FeedListInteractor: FeedListPresenterToInteractorProtocol, Injectable {

    var presenter: FeedListInteractorToPresenterProtocol?

    struct Dependencies {
        let presenter: FeedListInteractorToPresenterProtocol
    }

    func inject(dependencies: FeedListInteractor.Dependencies) {
        presenter = dependencies.presenter
    }

    func loadFeed() {
        let fakeService: FakeFeedDataSource = FakeFeedDataSource()
        presenter?.loadedFeeds(feeds: fakeService.loadFakeData())
    }

    func tempFuncForRouter() -> [FeedVM] {
        let fakeService: FakeFeedDataSource = FakeFeedDataSource()
        return fakeService.loadFakeData()
    }

}
