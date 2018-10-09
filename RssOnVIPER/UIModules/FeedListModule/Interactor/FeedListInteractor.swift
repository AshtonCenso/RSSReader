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
    private var feedService: FeedDataSource?
}

// MARK: - Injectable

extension FeedListInteractor {
    struct Dependencies {
        let presenter: FeedListInteractorToPresenterProtocol
        let feedService: FeedDataSource
    }
    
    func inject(dependencies: FeedListInteractor.Dependencies) {
        presenter = dependencies.presenter
        feedService = dependencies.feedService
    }
}

// MARK: - FeedListPresenterToInteractorProtocol

extension FeedListInteractor {
    func getFeeds(completion: (Result<[FeedVM]>) -> Void) {
        feedService?.getFeeds(completion: completion)
    }
}
