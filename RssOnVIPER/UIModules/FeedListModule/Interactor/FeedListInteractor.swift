//
//  FeedListInteractor.swift
//  RssOnVIPER
//
//  Created by Anton Tsykanov on 10.09.2018.
//  Copyright © 2018 Anton Tsykanov. All rights reserved.
//

import Foundation


final class FeedListInteractor: FeedListPresenterToInteractorProtocol {
    var presenter: FeedListInteractorToPresenterProtocol?

    func loadFeed() {
        let fakeService: LoadFakeData = LoadFakeData()
        presenter?.loadedFeeds(feeds: fakeService.loadFakeData())
    }

    func tempFuncForRouter() -> [FeedVM] {
        let fakeService: LoadFakeData = LoadFakeData()
        return fakeService.loadFakeData()
    }

}
